package com.abite.web.mapper;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

/**
 * 레시피 
 * 
 * 관련 테이블 : t_recipe
 * @author osm077
 * @since 2021-11-26
 * */
@Repository
public interface RecipeMapper {
	List<HashMap<String, Object>> getRecipeList(HashMap<String, Object> map);
	List<HashMap<String, Object>> getRecipeLocationList(HashMap<String, Object> map);
	List<HashMap<String, Object>> getCategoryRanks();
	List<HashMap<String, Object>> getRecipeIngredients(int recipeNo);
	List<HashMap<String, Object>> getRecipeDtl(int recipeNo);
	HashMap<String, Object> getRecipeInfo(int recipeNo);
	List<HashMap<String, Object>> getComments(HashMap<String, Object> map);
	List<HashMap<String, Object>> getCurrRecipeList();
	int getRecipeCount(HashMap<String, Object> map);
	HashMap<String, Object> getRecipe(HashMap<String, Object> map);
	long addRecipe(HashMap<String, Object> map);
	long modifyRecipe(HashMap<String, Object> map);
	long saveLookupCount(HashMap<String, Object> map);
	long saveComment(HashMap<String, Object> map);
	long addRecipeDetail(HashMap<String, Object> map);
	long addIngredient(HashMap<String, Object> map);
	int getComment(HashMap<String, Object> map);
}
