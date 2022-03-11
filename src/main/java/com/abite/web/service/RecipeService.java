package com.abite.web.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.util.ObjectUtils;

import com.abite.common.service.CommonApiService;
import com.abite.common.service.Pager;
import com.abite.web.mapper.RecipeMapper;

/**
 * web recipe Service (BizLogic)
 * 
 * @author 오승민
 * @since 2021-11-26
 **/

@Service
public class RecipeService {
	private static final Logger logger = LoggerFactory.getLogger(RecipeService.class);
	
	@Autowired
	private RecipeMapper recipeMapper;
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private CommonApiService apiService;
	
	@Value("#{constConfig[WORLD_API_DOMAIN]}")
	private String world_domain;
	
	@Value("#{constConfig[WORLD_API_KEY]}")
	private String world_apikey;
	

	public List<HashMap<String, Object>> getComments(HashMap<String, Object> param) throws Exception {
		return recipeMapper.getComments(param);
	}
	
	public int getRecipeCount(HashMap<String, Object> param) throws Exception {
		return recipeMapper.getRecipeCount(param);
	}
	
	public ModelMap getRecipeList(HashMap<String, Object> param) throws Exception {
		
		ModelMap map = new ModelMap();
		int count = recipeMapper.getRecipeCount(param);
		int pageno = (int)param.get("pageno");
		int rowCount =  (int)param.get("rowCount");
		Pager pager = new Pager(pageno, rowCount, count);
		
		param.put("beginRownum", pager.getBeginRownum());
		List<HashMap<String, Object>> recipeList = recipeMapper.getRecipeList(param);
		
		if(!ObjectUtils.isEmpty(param.get("pageno2"))) {
			int _pageno = (int) param.get("pageno2");
			Pager pager2 = new Pager(_pageno, rowCount, count);
			param.put("StartRownum", pager2.getBeginRownum());
			List<HashMap<String, Object>> recipeLocationList = recipeMapper.getRecipeLocationList(param);
			map.put("pager2", pager2);
			map.put("locationList", recipeLocationList);
		}
		map.put("pager", pager);
		map.put("list", recipeList);
		
		return map;
	}
	
	public ModelMap getCategoryRanks() throws Exception {
		ModelMap map = new ModelMap();
		List<HashMap<String, Object>> recipeList = recipeMapper.getCategoryRanks();
		map.put("list", recipeList);
		
		return map;
	}
	
	public HashMap<String, Object> getRecipe(HashMap<String, Object> param) throws Exception {
		return recipeMapper.getRecipe(param);
	}

	public HashMap<String, Object> getRecipeInfo(int recipeNo) throws Exception {
		HashMap<String, Object> recipe = recipeMapper.getRecipeInfo(recipeNo);
		if(recipe != null) {
			recipe.put("INGREDIENTS",  recipeMapper.getRecipeIngredients(recipeNo));
			recipe.put("DETAILS",  recipeMapper.getRecipeDtl(recipeNo));	
		}
		return recipe;
	}
	
	public long saveLookupCount(HashMap<String, Object> param) throws Exception{
		return recipeMapper.saveLookupCount(param);
	}
	
	public long saveComment(HashMap<String, Object> param) throws Exception{
		int seq = recipeMapper.getComment(param);
		param.put("SEQ", seq+1);
		return recipeMapper.saveComment(param);
	}

	
	@SuppressWarnings("unchecked")
	public Map<String, Object> saveRecipeTx(HashMap<String, Object> param) throws Exception{
//		logger.info("param =" + param);
		
	    Map<String, Object> rtMap = new HashMap<>();  
		
		recipeMapper.addRecipe(param);
		int recipeNo = (int) param.get("recipeNo");
		
		String fileName = fileService.fileUpload(param);
		
		param.put("thumbnail", "/images/" + fileName);
		
		recipeMapper.modifyRecipe(param);
		
		List<HashMap<String, Object>> details = (List<HashMap<String, Object>>)param.get("details");
		addRecipeDetails(details, recipeNo);
		
		List<HashMap<String, Object>> ingredients = (List<HashMap<String, Object>>)param.get("ingredients");
		addIngredients(ingredients , recipeNo);
		
		rtMap.put("recipe", param);
		return rtMap;	
	}

	public Map<String, Object> modifyRecipe(HashMap<String, Object> param) throws Exception{
//		logger.info("param =" + param);
		
	    Map<String, Object> rtMap = new HashMap<>();  
		
		rtMap.put("CNT", recipeMapper.modifyRecipe(param));  
		
		return rtMap;
		
	}
	

	public Map<String, Object> searchAddress(HashMap<String, Object> param) throws Exception {
		String systemUrl = world_domain + "/req/search?service=search&request=search&version=2.0&type=address&category=road&format=json&errorformat=json";
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("crs", "EPSG:3857");
		map.put("key", world_apikey);
		map.put("size", "30");
		map.put("query", (String) param.get("address"));
	    return apiService.callApi("GET", map, systemUrl);
	}

	public List<HashMap<String, Object>> getCurrRecipeList() throws Exception {
		List<HashMap<String, Object>> currRecipeList = recipeMapper.getCurrRecipeList();
		return currRecipeList;
	}
	

	private void addRecipeDetails(List<HashMap<String, Object>> details, int recipeNo) throws Exception{
		for(HashMap<String, Object> detail: details) {
			detail.put("recipeNo", recipeNo);
			String fileName = fileService.fileUpload(detail);
			detail.put("image", "/images/" + fileName);
			recipeMapper.addRecipeDetail(detail);	
		}
	}
	
	private void addIngredients(List<HashMap<String, Object>> ingredients, int recipeNo) throws Exception{
		for(HashMap<String, Object> ingredient: ingredients) {
			ingredient.put("recipeNo", recipeNo);
			recipeMapper.addIngredient(ingredient);	
		}
	}
	
}
