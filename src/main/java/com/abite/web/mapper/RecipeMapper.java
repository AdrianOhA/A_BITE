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
	long addRecipe(HashMap<String, Object> map);
	long modifyRecipe(HashMap<String, Object> map);
	long addRecipeDetail(HashMap<String, Object> map);
	long addIngredient(HashMap<String, Object> map);
}
