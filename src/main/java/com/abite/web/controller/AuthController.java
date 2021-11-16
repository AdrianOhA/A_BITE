package com.abite.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.abite.web.service.AuthService;

@Controller
@RequestMapping("/Auth")
public class AuthController {
	
	private static final Logger logger = LoggerFactory.getLogger (AuthController.class);
	
	@Autowired
	private AuthService service;
	
	
	/**
	 * Kakao getToken 간편로그인
	 * 
	 * @param req	HttpServletRequest
	 * @param res	HttpServletResponse
	 * 
	 * @return ModelAndView
	 */
	@RequestMapping(value="/getAutoLoginForKakao")
	public ModelMap getAutoLoginForKakao(HttpServletRequest req, HttpServletResponse res,  @RequestBody HashMap<String, String> param) throws Exception
	{
		ModelMap ret = new ModelMap();
		logger.debug("get kakao token");
		Map<String, Object> token_info = service.getTokenForKakao(param);
		logger.info("token_info : "+ token_info);
		
		param.put("token", (String)token_info.get("access_token"));
		Map<String, Object> customer_info = service.getMemberInfoForKakao(param);
		
		ret.addAttribute("customer_info", customer_info);
		ret.addAttribute("RESULT_CODE", customer_info.get("RESULT_CODE"));
		ret.addAttribute("RESULT_MSG", customer_info.get("RESULT_MSG"));
		return ret;
	}
	

	/**
	 * Kakao getToken 로그아웃
	 * 
	 * @param req	HttpServletRequest
	 * @param res	HttpServletResponse
	 * 
	 * @return ModelAndView
	 */
	@RequestMapping(value="/getAutoLogoutForKakao")
	public ModelMap getAutoLogoutForKakao(HttpServletRequest req, HttpServletResponse res,  @RequestBody HashMap<String, String> param) throws Exception
	{
		ModelMap ret = new ModelMap();
		logger.info("token_info : "+ param.get("token"));
		
		Map<String, Object> api_info = service.getLogoutForKakao(param);
		
		ret.addAttribute("api_info", api_info);
		ret.addAttribute("RESULT_CODE", api_info.get("RESULT_CODE"));
		ret.addAttribute("RESULT_MSG", api_info.get("RESULT_MSG"));
		return ret;
	}
	/**
	 * 한입만 사용자 여부
	 * 
	 * @param req	HttpServletRequest
	 * @param res	HttpServletResponse
	 * 
	 * @return ModelAndView
	 */
	@RequestMapping(value="/isExistsForMember")
	public ModelMap isExistsForMember(HttpServletRequest req, HttpServletResponse res,  @RequestBody HashMap<String, Object> param) throws Exception
	{
		ModelMap ret = new ModelMap();
		logger.info("param : "+ param);
		int count = service.isExistsForMember(param);
		ret.addAttribute("COUNT", count);
		return ret;
	}
	/**
	 * 한입만 회원가입
	 * 
	 * @param req	HttpServletRequest
	 * @param res	HttpServletResponse
	 * 
	 * @return ModelAndView
	 */
	@RequestMapping(value="/signup")
	public ModelMap signup(HttpServletRequest req, HttpServletResponse res,  @RequestBody HashMap<String, Object> param) throws Exception
	{
		ModelMap ret = new ModelMap();
		logger.info("signup form : "+ param);
		ret.addAllAttributes(service.signup(param));
		return ret;
	}
	
	/**
	 * 한입만 로그인
	 * 
	 * @param req	HttpServletRequest
	 * @param res	HttpServletResponse
	 * 
	 * @return ModelAndView
	 */
	@RequestMapping(value="/login")
	public ModelMap login(HttpSession session, HttpServletRequest req, HttpServletResponse res,  @RequestBody HashMap<String, Object> param) throws Exception
	{
		ModelMap ret = new ModelMap();
		logger.info("login form : "+ param);
		Map<String, Object> login_info = service.login(param, session);
		
		login_info.put("REDIRECT_URL", "/dev/main.do");
		
		return ret.addAllAttributes(login_info);
	}
	@RequestMapping(value="/getMember")
	public ModelMap getMemberInfo(HttpSession session, HttpServletRequest req, HttpServletResponse res,  @RequestBody HashMap<String, Object> param) throws Exception{
		logger.info("login form : "+ param);
		return service.getMember(param);
	}
}
