package com.monsanto.service;

import java.util.List;

import com.monsanto.domain.RecipeManager;

public interface RecipeManagerService {

	public RecipeManager getRecipeManagerById(String recipeId);

	public RecipeManager insertRecipeManager(RecipeManager recipeManager);

	public RecipeManager updateRecipeManagerById(RecipeManager recipeManager);

	public String deleteRecipeManagerById(String recipeId);

	public List<RecipeManager> getAllRecipeManager();
}
