package com.monsanto.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.monsanto.dao.RecipeManagerDao;
import com.monsanto.domain.RecipeManager;

@Component
public class RecipeManagerServiceImpl implements RecipeManagerService {

	@Autowired
	RecipeManagerDao recipeManagerDao;

	public RecipeManager getRecipeManagerById(String recipeId) {

		return recipeManagerDao.getRecipeManagerById(recipeId);
	}

	public RecipeManager insertRecipeManager(RecipeManager recipeManager) {

		return recipeManagerDao.insertRecipeManager(recipeManager);
	}

	public RecipeManager updateRecipeManagerById(RecipeManager recipeManager) {

		return recipeManagerDao.updateRecipeManagerById(recipeManager);
	}

	public String deleteRecipeManagerById(String recipeId) {

		return recipeManagerDao.deleteRecipeManagerById(recipeId);
	}

	public List<RecipeManager> getAllRecipeManager() {
		
		return recipeManagerDao.getAllRecipeManager();
	}

}
