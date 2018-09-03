package com.monsanto.dao;

import java.util.List;

import com.monsanto.domain.RecipeManager;

public interface RecipeManagerDao {

	public RecipeManager getRecipeManagerById(String recipeId);

	public RecipeManager updateRecipeManagerById(RecipeManager recipeManager);

	public RecipeManager insertRecipeManager(RecipeManager recipeManager);

	public String deleteRecipeManagerById(String recipeId);

	public List<RecipeManager> getAllRecipeManager();

}
