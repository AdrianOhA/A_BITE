package com.abite.web.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.abite.web.service.MainService;

@Controller
@RequestMapping("/dev")
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger (MainController.class);

	@Autowired
	private MainService service;
	
	
	@RequestMapping(value="/main.do")
	public ModelAndView main(HttpServletRequest req, HttpServletResponse res) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		Device device = DeviceUtils.getCurrentDevice(req);
		
		logger.debug("init device: " + device.toString());
		
		if(device.isMobile() || device.isTablet()) {
			mv.setViewName("/mo/main"); 
		} else {
			mv.setViewName("/web/main");
		}
		return mv;
	}
	
	@RequestMapping(value="/getMenuList")
	public ModelMap menu(HttpServletRequest req, HttpServletResponse res, @RequestBody HashMap<String, Object> param) throws Exception
	{
		ModelMap map = new ModelMap();
		
		logger.debug("param = " + param.toString());
		
		map.addAttribute("MENU_LIST", service.getMenuList(param));
		return map;
	}
}