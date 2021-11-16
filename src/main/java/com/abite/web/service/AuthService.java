package com.abite.web.service;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.util.ObjectUtils;
import org.springframework.web.servlet.ModelAndView;

import com.abite.common.service.CommonApiService;
import com.abite.web.mapper.MemberMapper;

/**
 * web main Service (BizLogic)
 * 
 * @author 오승민
 * @since 2020-01-20
 **/

@Service
public class AuthService {
	private static final Logger logger = LoggerFactory.getLogger(AuthService.class);
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private CommonApiService apiService;
	
	@Value("#{constConfig[KAKAO_AUTH_DOMAIN]}")
	private String kakao_auth_domain;
	@Value("#{constConfig[KAKAO_API_DOMAIN]}")
	private String kakao_api_domain;
	@Value("#{constConfig[KAKAO_API_KEY]}")
	private String kakao_apikey;
	@Value("#{constConfig[DOMAIN]}")
	private String domain;
	
	
	public ModelMap getMember(HashMap<String, Object> param) throws Exception {
		ModelMap map = new ModelMap();
		Map<String, Object> userInfo = memberMapper.getMember(param);
		map.put("userInfo", userInfo);
		logger.debug(userInfo + "");
		return map;
	}
	
	public int isExistsForMember(HashMap<String, Object> param) throws Exception {
		int count = memberMapper.exsistMember(param);
		return count;
	}
	
	public Map<String, Object> getTokenForKakao(HashMap<String, String> param) throws Exception {
		String systemUrl = kakao_auth_domain + "/oauth/token";
		
		param.put("grant_type", "authorization_code");
		param.put("client_id", kakao_apikey);
		param.put("code", param.get("code"));
		param.put("redirect_uri", domain);
		Map<String, Object> token_info = apiService.callApi("POST", param, systemUrl);
		
		return token_info;
	}
	
	public Map<String, Object> getMemberInfoForKakao(HashMap<String, String> param) throws Exception{
		String systemUrl = kakao_api_domain + "/v2/user/me";
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("token", param.get("token"));
		Map<String, Object> dataJson = apiService.callApi("POST", map, systemUrl);
		
		dataJson.put("token", map.get("token"));
		
		return dataJson;
	}
	
	public Map<String, Object> getLogoutForKakao(HashMap<String, String> param) throws Exception{
		String systemUrl = kakao_auth_domain + "/oauth/logout?client_id="+kakao_apikey+"&logout_redirect_uri="+domain;
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("token", param.get("token"));
		Map<String, Object> api_info = apiService.callApi("GET", map, systemUrl);
		return api_info;
	}
	

	public Map<String, Object> signup(HashMap<String, Object> param) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		boolean flag = !"E".equals(checkValidation(param, map).get("RESULT_CODE"));
		
		if(flag) {
			long cnt = memberMapper.addMember(param);
			map.put("COUNT", cnt);
		}
		return map;
	}
	
	public Map<String, Object> login(HashMap<String, Object> param, HttpSession session) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		boolean flag = !"E".equals(checkLoginValidation(param, map).get("RESULT_CODE"));
		
		if(flag) {
			Map<String, Object> userInfo = memberMapper.getMemberInfo(param);
			if(ObjectUtils.isEmpty(userInfo)) {
				map.put("RESULT_CODE", "E");
				map.put("RESULT_MSG", "등록되지 않은 사용자 이거나, 비밀번호가 달라요!");
			} else {
				session.setAttribute("USER_INFO", userInfo);
				map.put("RESULT_CODE", "S");
				map.put("RESULT_MSG", "로그인 성공");
			}
		}
		return map;
	}
	
	private Map<String, Object> checkLoginValidation(HashMap<String, Object> param, Map<String, Object> map) {
		if(ObjectUtils.isEmpty(param)) {
			map.put("RESULT_CODE", "E");
			map.put("RESULT_MSG", "Data is Exsists");
			return map;
		}
		
		String email = (String) param.get("email");
		String password = (String) param.get("password");
		
		if(StringUtils.isEmpty(email)) {
			map.put("RESULT_CODE", "E");
			map.put("RESULT_MSG", "email is empty");
			return map;
		}
		
		if(StringUtils.isEmpty(password)) {
			map.put("RESULT_CODE", "E");
			map.put("RESULT_MSG", "password is empty");
			return map;
		}
		
		
		return map;
	}
	
	private Map<String, Object> checkValidation(HashMap<String, Object> param, Map<String, Object> map) {
		
		if (ObjectUtils.isEmpty(param)) {
			map.put("RESULT_CODE", "E");
			map.put("RESULT_MSG", "Data is Exsists");
			return map;
		}
		
		String email = (String)param.get("email");
		String regex = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$"; 
		Pattern p = Pattern.compile(regex); 
		Matcher m = p.matcher(email); 
		if(!m.matches()) { 
			map.put("RESULT_CODE", "E");
			map.put("RESULT_MSG", "email 형식이 맞지 않아요!");
			return map;
			
		} 
		
		String password = (String)param.get("password");
		String passwordcf =(String)param.get("passwordcf");
		if (!password.equals(passwordcf)) {
			map.put("RESULT_CODE", "E");
			map.put("RESULT_MSG", "No Same Password");
			return map;
		}
		
		int count = memberMapper.exsistMember(param);
		
		if (count > 0) {
			map.put("RESULT_CODE", "E");
			map.put("RESULT_MSG", "이미 등록된 email 입니다.");
		} else {
			map.put("RESULT_CODE", "S");
			map.put("RESULT_MSG", "사용 가능합니다.");
		}
		
		return map;
	}
}
