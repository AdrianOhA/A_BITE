package com.abite.web.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	

	public List<HashMap<String, Object>> getComments(HashMap<String, Object> param) throws Exception {
		return recipeMapper.getComments(param);
	}
	
	public int getRecipeCount(HashMap<String, Object> param) throws Exception {
		return recipeMapper.getRecipeCount(param);
	}
	
	public List<HashMap<String, Object>> getRecipeList(HashMap<String, Object> param) throws Exception {
		return recipeMapper.getRecipeList(param);
	}
	
	public HashMap<String, Object> getRecipe(HashMap<String, Object> param) throws Exception {
		return recipeMapper.getRecipe(param);
	}

	public HashMap<String, Object> getRecipeInfo(int recipeNo) throws Exception {
		HashMap<String, Object> recipe = recipeMapper.getRecipeInfo(recipeNo);
		
		recipe.put("INGREDIENTS",  recipeMapper.getRecipeIngredients(recipeNo));
		recipe.put("DETAILS",  recipeMapper.getRecipeDtl(recipeNo));
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
