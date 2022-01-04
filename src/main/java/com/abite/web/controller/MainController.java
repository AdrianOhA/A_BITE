package com.abite.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.abite.web.service.MainService;
import com.abite.web.service.RecipeService;

@Controller
@RequestMapping("/dev")
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger (MainController.class);

	@Autowired
	private MainService service;
	@Autowired
	private RedisTemplate<String, Object> redisTemplate;
	@Autowired
	private RecipeService recipeService;
	
	
	@RequestMapping(value="/main.do")
	public ModelAndView main(HttpServletRequest req, HttpServletResponse res) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		Device device = DeviceUtils.getCurrentDevice(req);
		
		logger.debug("init device: " + device.toString());
		
		if(device.isMobile() || device.isTablet()) {
			mv.setViewName("/mo/main"); 
		} else {
			mv.addObject("CURR_RECIPES", recipeService.getCurrRecipeList());
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
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/chatList")
	public ModelMap chatList(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws Exception
	{
		ModelMap map = new ModelMap();
		HashOperations<String, String, Object> hash = redisTemplate.opsForHash();
		Map<String, Object> userInfo = (Map<String, Object>)session.getAttribute("USER_INFO");
		String userId = (String)userInfo.get("USER_ID");
		Set<String> set = hash.keys(userId);
		Iterator<String> sKey = set.iterator();
		List<Map<String, Object>> msgList = new ArrayList<Map<String, Object>>();
		
		while(sKey.hasNext()) {
			String _skey = sKey.next();
			Map<String, Object> hmap = new HashMap<String, Object>();
			hmap.put("target", _skey);
			hmap.put("chatList", hash.get(userId, _skey));
			msgList.add(hmap);
		}
		map.addAttribute("msgList", msgList);
		return map;
	}
}