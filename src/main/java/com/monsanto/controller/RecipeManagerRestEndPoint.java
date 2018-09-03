package com.monsanto.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.monsanto.domain.RecipeManager;
import com.monsanto.service.RecipeManagerService;

@Controller
@RequestMapping("/recipeManager/")
public class RecipeManagerRestEndPoint {

	@Autowired
	RecipeManagerService recipeManagerService;

	@RequestMapping(value = "fetchAllData", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody List<RecipeManager> getAdminPage() {
		return recipeManagerService.getAllRecipeManager();
	}
	
	@RequestMapping(value = "fetchById", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody RecipeManager getRecipeManagerById(
			@RequestParam(value = "recipeId", required = true) String recipeId) {
		return recipeManagerService.getRecipeManagerById(recipeId);
	}

	@RequestMapping(value = "insert", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE,
	        produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody String addRecipeManager(@RequestBody RecipeManager recipeManager) {
		recipeManagerService.insertRecipeManager(recipeManager);
		return "OK";
	}

	@RequestMapping(value = "update", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody String updateRecipeManager(@RequestBody RecipeManager recipeManager) {
		recipeManagerService.updateRecipeManagerById(recipeManager);
		return "OK";
	}

	@RequestMapping(value = "deleteById", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody String deleteRecipeManagerById(
			@RequestParam(value = "recipeId", required = true) String recipeId) {
		recipeManagerService.deleteRecipeManagerById(recipeId);
		return "OK";
	}

}
