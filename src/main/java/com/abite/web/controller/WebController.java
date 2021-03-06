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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.abite.web.service.AuthService;
import com.abite.web.service.CodeService;
import com.abite.web.service.RecipeService;

@Controller
@RequestMapping("/web")
public class WebController {
	
	private static final Logger logger = LoggerFactory.getLogger (WebController.class);
	
	@Autowired
	private CodeService code_service;
	
	@Autowired
	private RecipeService recipeService;
	
	@Autowired
	private AuthService memberService;
	
	@RequestMapping(value="/post.do")
	public ModelAndView main(HttpServletRequest req, HttpServletResponse res) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("CODE_GROUP", "CATEGORY");
		mv.addObject("CATEGORY_LIST",  code_service.getCategory(param));
		mv.setViewName("/web/catagory-post");
		return mv;
	}
	
	@RequestMapping(value="/saveRecipe.json")
	public ModelMap saveRecipe(HttpServletRequest req, HttpServletResponse res, @RequestBody HashMap<String, Object> param) throws Exception
	{
		ModelMap map = new ModelMap();
		logger.info("call saveRecipe");
		map.addAllAttributes(recipeService.saveRecipeTx(param));
		return map;
	}
	
	@RequestMapping(value="/modifyRecipe.json")
	public ModelMap modifyRecipe(HttpServletRequest req, HttpServletResponse res, @RequestBody HashMap<String, Object> param) throws Exception
	{
		ModelMap map = new ModelMap();
		logger.info("call modifyRecipe");
		map.addAllAttributes(recipeService.modifyRecipe(param));
		return map;
	}

	@RequestMapping(value="/getRecipeList.json")
	public ModelMap getRecipeList(HttpServletRequest req, HttpServletResponse res, @RequestBody HashMap<String, Object> param) throws Exception
	{
		logger.info("call getRecipeList");
		return recipeService.getRecipeList(param);
	}
	
	@RequestMapping(value="/getRecipe.json")
	public ModelMap getRecipe(HttpServletRequest req, HttpServletResponse res, @RequestBody HashMap<String, Object> param) throws Exception
	{
		ModelMap map = new ModelMap();
		logger.info("call getRecipe");
		map.addAttribute("RECIPE", recipeService.getRecipe(param));
		return map;
	}
	
	@RequestMapping(value="/recipe.do")
	public ModelAndView recipe(HttpServletRequest req, HttpServletResponse res, @RequestParam(value="recipeNo", required=false) int recipeNo) throws Exception
	{
		ModelAndView mv = new ModelAndView();
        
        mv.addObject("RECIPE", recipeService.getRecipeInfo(recipeNo));
		mv.setViewName("/web/recipe");
		return mv;
	}
	

	@RequestMapping(value="/getComments.json")
	public ModelMap getComments(HttpServletRequest req, HttpServletResponse res, @RequestBody HashMap<String, Object> param) throws Exception
	{
		ModelMap map = new ModelMap();
		map.put("COMMENTS", recipeService.getComments(param));
		return map;
	}
	
	@RequestMapping(value="/saveLookupCount.json")
	public ModelMap saveLookupCount(HttpServletRequest req, HttpServletResponse res, @RequestBody HashMap<String, Object> param) throws Exception
	{
		ModelMap map = new ModelMap();
		map.put("COUNT", recipeService.saveLookupCount(param));
		return map;
	}
	

	@RequestMapping(value="/saveComment.json")
	public ModelMap saveComment(HttpServletRequest req, HttpServletResponse res, @RequestBody HashMap<String, Object> param) throws Exception
	{
		ModelMap map = new ModelMap();
		map.put("COUNT", recipeService.saveComment(param));
		return map;
	}
	
	@RequestMapping(value="/getCategoryRanks.json")
	public ModelMap getCategoryRanks(HttpServletRequest req, HttpServletResponse res) throws Exception
	{
		logger.info("call getRecipeList");
		return recipeService.getCategoryRanks();
	}

	@RequestMapping(value="/search.do")
	public ModelAndView search(HttpServletRequest req, HttpServletResponse res, @RequestParam(value="param", required=false) String condition) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("CODE_GROUP", "CATEGORY");
		mv.addObject("CATEGORY_LIST",  code_service.getCategory(param));
		mv.setViewName("/web/search");
		return mv;
	}	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/setting.do")
	public ModelAndView setting(HttpSession session, HttpServletRequest req, HttpServletResponse res, @RequestParam(value="userNo", required=false, defaultValue="0") int userNo) throws Exception
	{
		ModelAndView mv = new ModelAndView();
		Map<String, Object> userInfo = null;
		if(userNo == 0) {
			userInfo = (Map<String, Object>)session.getAttribute("USER_INFO");
			userNo = (int)userInfo.get("USER_NO");
		}
		
		userInfo = (Map<String, Object>)memberService.getMemberForSetting(userNo).get("userInfo");
		userInfo.put("CATEGORY_PERCENTS", memberService.getCategoryPercent(userNo));
		
		
		mv.addObject("SETTING_INFO",userInfo);
		mv.setViewName("/web/setting");
		return mv;
	}	
	
	@RequestMapping(value="/searchAddress.json")
	public ModelMap searchAddress(HttpServletRequest req, HttpServletResponse res, @RequestBody HashMap<String, Object> param) throws Exception
	{
		ModelMap map = new ModelMap();
		logger.info("call searchAddress");
		map.addAllAttributes(recipeService.searchAddress(param));
		return map;
	}	
}
