package com.monsanto.domain;

public class RecipeManager {

	protected String recipeId;
	protected String ingredient1;
	protected String ingredient2;
	protected String ingredient3;
	protected String ingredient4;

	public RecipeManager(){
		super();
	}
	
	public RecipeManager(String recipeId) {
		
		super();
		this.recipeId = recipeId;
	
	}

	public String getRecipeId() {
		return recipeId;
	}

	public void setRecipeId(String recipeId) {
		this.recipeId = recipeId;
	}

	public String getIngredient1() {
		return ingredient1;
	}

	public void setIngredient1(String ingredient1) {
		this.ingredient1 = ingredient1;
	}

	public String getIngredient2() {
		return ingredient2;
	}

	public void setIngredient2(String ingredient2) {
		this.ingredient2 = ingredient2;
	}

	public String getIngredient3() {
		return ingredient3;
	}

	public void setIngredient3(String ingredient3) {
		this.ingredient3 = ingredient3;
	}

	public String getIngredient4() {
		return ingredient4;
	}

	public void setIngredient4(String ingredient4) {
		this.ingredient4 = ingredient4;
	}

}
