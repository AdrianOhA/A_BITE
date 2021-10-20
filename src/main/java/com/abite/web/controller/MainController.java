package com.abite.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.abite.web.service.MainService;

@Controller
@RequestMapping("/Auth")
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger (MainController.class);
	
	@Autowired
	private MainService service;
	
	
	@Autowired
	private RedisTemplate<String, Object> redisTemplate;
	
	
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
	 * Kakao getToken 간편로그인
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
	
	@RequestMapping(value="/isExistsForMember")
	public ModelMap isExistsForMember(HttpServletRequest req, HttpServletResponse res,  @RequestBody HashMap<String, Object> param) throws Exception
	{
		ModelMap ret = new ModelMap();
		logger.info("param : "+ param);
		int count = service.isExistsForMember(param);
		ret.addAttribute("COUNT", count);
		return ret;
	}
	
	@RequestMapping(value="/signup")
	public ModelMap signup(HttpServletRequest req, HttpServletResponse res,  @RequestBody HashMap<String, Object> param) throws Exception
	{
		ModelMap ret = new ModelMap();
		logger.info("token_info : "+ param);
		long seq = service.signup(param);
		
		ret.addAttribute("COUNT", seq);
		
		return ret;
	}
}
