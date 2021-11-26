package com.abite.web.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.abite.web.service.CodeService;

@Controller
@RequestMapping("/Code")
public class CodeController {
	
	private static final Logger logger = LoggerFactory.getLogger (CodeController.class);
	
	@Autowired
	private CodeService service;
	
	
	/**
	 * getCategory
	 * 
	 * @param req	HttpServletRequest
	 * @param res	HttpServletResponse
	 * 
	 * @return ModelAndView
	 */
	@RequestMapping(value="/getCategorys")
	public ModelMap getCategorys(HttpServletRequest req, HttpServletResponse res,  @RequestBody HashMap<String, Object> param) throws Exception
	{
		ModelMap ret = new ModelMap();
		logger.info("param= " + param);
		
		List<HashMap<String, Object>> categorys = service.getCategory(param);
		
		ret.addAttribute("CATEGORY_LIST", categorys);
		return ret;
	}
}
