package com.abite.web.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
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
	@Value("#{constConfig[WORLD_API_KEY]}")
	private String worldAPIKey;
	
	
	
	public ModelMap getMember(HashMap<String, Object> param) throws Exception {
		ModelMap map = new ModelMap();
		Map<String, Object> userInfo = memberMapper.getMember(param);
		map.put("userInfo", userInfo);
		logger.debug(userInfo + "");
		return map;
	}
	
	public ModelMap getMemberForSetting(int userNo) throws Exception {
		ModelMap map = new ModelMap();
		Map<String, Object> userInfo = memberMapper.getMemberForSetting(userNo);
		map.put("userInfo", userInfo);
		logger.debug(userInfo + "");
		return map;
	}
	
	public ModelMap getMemberForChat(HashMap<String, Object> param) throws Exception {
		ModelMap map = new ModelMap();
		Map<String, Object> userInfo = memberMapper.getMemberForChat(param);
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
	

	public Map<String, Object> signup(HttpServletRequest req, HashMap<String, Object> param) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		boolean flag = !"E".equals(checkValidation(param, map).get("RESULT_CODE"));
		String sns = (String)param.get("sns");
		long cnt = (int)map.get("CNT");
		
		if(flag) {
			if(!"DEFAULT".equals(sns)) {
				String password = generatePassword(8).toString();
				param.put("password", password);
			}
			if((int)map.get("CNT") != 1) {
				cnt = memberMapper.addMember(param);	
			}
			map.put("COUNT", cnt);
			boolean chkFlag = (boolean)param.get("flag");
			if(!chkFlag) {
				login(param, req.getSession());
			}
		}
		return map;
	}
	
	public Map<String, Object> login(HashMap<String, Object> param, HttpSession session) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		boolean flag = !"E".equals(checkLoginValidation(param, map).get("RESULT_CODE"));
		
		boolean chkFlag = (boolean)param.get("flag");
		
		if(flag) {
			Map<String, Object> userInfo = null;
			if(chkFlag) {
				userInfo = memberMapper.getMemberInfo(param);	
			} else {
				userInfo = memberMapper.getAutoMemberInfo(param);
			}
			
			if(ObjectUtils.isEmpty(userInfo)) {
				map.put("RESULT_CODE", "E");
				map.put("RESULT_MSG", "등록되지 않은 사용자 이거나, 비밀번호가 달라요!");
			} else {
				session.setAttribute("USER_INFO", userInfo);
				session.setAttribute("WORLD_API_KEY", worldAPIKey);
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
		boolean flag = (boolean)param.get("flag");
		if(StringUtils.isEmpty(password) && flag) {
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
		String sns = (String)param.get("sns");
		
		if(!m.matches() && "DEFAULT".equals(sns)) { 
			map.put("RESULT_CODE", "E");
			map.put("RESULT_MSG", "email 형식이 맞지 않아요!");
			return map;
			
		} 
		if ("DEFAULT".equals(sns)) {
			String password = (String)param.get("password");
			String passwordcf =(String)param.get("passwordcf");
			if (!password.equals(passwordcf)) {
				map.put("RESULT_CODE", "E");
				map.put("RESULT_MSG", "No Same Password");
				return map;
			}
		}
		
		int count = memberMapper.exsistMember(param);
		
		if (count > 0) {
			if("DEFAULT".equals(sns)) {
				map.put("RESULT_CODE", "E");
				map.put("RESULT_MSG", "이미 등록된 email 입니다.");	
			} else {
				map.put("RESULT_CODE", "S");
				map.put("RESULT_MSG", "사용 가능합니다.");
			}
		} else {
			map.put("RESULT_CODE", "S");
			map.put("RESULT_MSG", "사용 가능합니다.");
		}
		map.put("CNT", count);
		
		return map;
	}

	public List<HashMap<String, Object>> getCategoryPercent(int userNo) throws Exception {
		return memberMapper.getCategoryPercent(userNo);
	}
	

   private static char[] generatePassword(int length) {
      String capitalCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
      String lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
      String specialCharacters = "!@#$";
      String numbers = "1234567890";
      String combinedChars = capitalCaseLetters + lowerCaseLetters + specialCharacters + numbers;
      Random random = new Random();
      char[] password = new char[length];

      password[0] = lowerCaseLetters.charAt(random.nextInt(lowerCaseLetters.length()));
      password[1] = capitalCaseLetters.charAt(random.nextInt(capitalCaseLetters.length()));
      password[2] = specialCharacters.charAt(random.nextInt(specialCharacters.length()));
      password[3] = numbers.charAt(random.nextInt(numbers.length()));
   
      for(int i = 4; i< length ; i++) {
         password[i] = combinedChars.charAt(random.nextInt(combinedChars.length()));
      }
      return password;
   }
}
