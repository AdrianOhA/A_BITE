package com.abite.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/dev")
public class MainController {
	
	
	@RequestMapping(value="/main.do")
	public ModelAndView main(HttpServletRequest req, HttpServletResponse res) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		Device device = DeviceUtils.getCurrentDevice(req);
		if(device.isMobile() || device.isTablet()) {
			mv.setViewName("/mo/main");
		} else {
			mv.setViewName("/web/main");
		}
		return mv;
	}
}