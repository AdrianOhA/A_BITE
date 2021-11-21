package com.abite.web.controller;

import java.util.HashMap;

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

import com.abite.web.service.FileService;

@Controller
@RequestMapping("/File")
public class FileController {
	private static final Logger logger = LoggerFactory.getLogger(FileController.class);
	@Autowired
	private FileService service;
	
	@RequestMapping(value="/fileUpload")
	public ModelMap fileUpload(HttpSession session, HttpServletRequest req, HttpServletResponse res,  @RequestBody HashMap<String, Object> param) throws Exception{
		logger.info("param =" + param); 
		
		ModelMap map = new ModelMap();
		
		map.put("fileName", service.fileUpload(param));
		return map;
	}
}
