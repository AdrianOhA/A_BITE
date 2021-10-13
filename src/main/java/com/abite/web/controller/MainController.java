package com.abite.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.abite.web.service.MainService;

@Controller
@RequestMapping("/web/main")
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger (MainController.class);
	
	@Autowired
	private MainService service;
	
	@Autowired
	private RedisTemplate<String, Object> redisTemplate;
	
	
	/**
	 * 로그인 페이지.
	 * 
	 * @param req	HttpServletRequest
	 * @param res	HttpServletResponse
	 * 
	 * @return ModelAndView
	 */
	@RequestMapping(value="/loginPage.do")
	public ModelAndView loginPage (HttpServletRequest req, HttpServletResponse res) throws Exception
	{
		service.getMember(req);
		
		System.out.println(redisTemplate.keys("*"));
		
		logger.debug("호출");
		return null;
	}
}
