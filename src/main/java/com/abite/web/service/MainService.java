package com.abite.web.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
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
public class MainService {
	private static final Logger logger = LoggerFactory.getLogger(MainService.class);
	
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
	
	
	public ModelAndView getMember(HttpServletRequest req) throws Exception {
		ModelMap map = new ModelMap();
		int a = memberMapper.getMember(map);
		logger.debug(a + "");
		
		return null;
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
	

	public long signup(HashMap<String, Object> param) throws Exception{
		System.out.println(param);
		return  memberMapper.addMember(param);
	}
}
