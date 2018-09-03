package com.monsanto.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;

import com.monsanto.domain.RecipeManager;

public class RecipeManagerDaoImpl extends NamedParameterJdbcDaoSupport implements RecipeManagerDao {

	public RecipeManager getRecipeManagerById(String recipeId) {

		String selectSql = "SELECT * FROM RECIPEMANAGER WHERE RECIPE_ID = :RECIPE_ID";
		MapSqlParameterSource recipeManagerParam = new MapSqlParameterSource();
		recipeManagerParam.addValue("RECIPE_ID", recipeId);

		RowMapper<RecipeManager> recipeManagerMapper = new RowMapper<RecipeManager>() {

			public RecipeManager mapRow(ResultSet rs, int rowNum) throws SQLException {

				RecipeManager recipeManager = new RecipeManager();
				recipeManager.setRecipeId(rs.getString("RECIPE_ID"));
				recipeManager.setIngredient1(rs.getString("INGREDIENT1"));
				recipeManager.setIngredient2(rs.getString("INGREDIENT2"));
				recipeManager.setIngredient3(rs.getString("INGREDIENT3"));
				recipeManager.setIngredient4(rs.getString("INGREDIENT4"));

				return recipeManager;

			}
		};

		List<RecipeManager> recipeManagerList = new NamedParameterJdbcTemplate(getJdbcTemplate()).query(selectSql,
				recipeManagerParam, recipeManagerMapper);
		if (recipeManagerList == null || recipeManagerList.isEmpty()) {
			return null;
		} else {
			return recipeManagerList.get(0);
		}

	}

	public RecipeManager insertRecipeManager(RecipeManager recipeManager) {

		String insertSql = "INSERT INTO RECIPEMANAGER (RECIPE_ID, INGREDIENT1, INGREDIENT2, INGREDIENT3, INGREDIENT4) VALUES (:RECIPE_ID, :INGREDIENT1, :INGREDIENT2, :INGREDIENT3, :INGREDIENT4)";
		int result = 0;

		result = this.getNamedParameterJdbcTemplate().update(insertSql, getSqlParameterByModel(recipeManager));

		return recipeManager;
	}

	public RecipeManager updateRecipeManagerById(RecipeManager recipeManager) {

		String updateSql = "UPDATE RECIPEMANAGER SET INGREDIENT1 = :INGREDIENT1, INGREDIENT2 = :INGREDIENT2, INGREDIENT3 = :INGREDIENT3, INGREDIENT4 = :INGREDIENT4 WHERE RECIPE_ID = :RECIPE_ID";

		int result = 0;

		result = this.getNamedParameterJdbcTemplate().update(updateSql, getSqlParameterByModel(recipeManager));

		return recipeManager;

	}

	public String deleteRecipeManagerById(String recipeId) {

		String deleteSql = "DELETE FROM RECIPEMANAGER WHERE RECIPE_ID = :RECIPE_ID";

		int result = 0;

		result = this.getNamedParameterJdbcTemplate().update(deleteSql, getSqlParameterByModel(new RecipeManager(recipeId)));

		return recipeId;
	}

	private SqlParameterSource getSqlParameterByModel(RecipeManager recipeManager) {
		MapSqlParameterSource parameterSource = new MapSqlParameterSource();
		if (recipeManager != null) {
			parameterSource.addValue("RECIPE_ID", recipeManager.getRecipeId());
			parameterSource.addValue("INGREDIENT1", recipeManager.getIngredient1());
			parameterSource.addValue("INGREDIENT2", recipeManager.getIngredient2());
			parameterSource.addValue("INGREDIENT3", recipeManager.getIngredient3());
			parameterSource.addValue("INGREDIENT4", recipeManager.getIngredient4());
		}
		return parameterSource;
	}

	public List<RecipeManager> getAllRecipeManager() {

		String sql = "SELECT * FROM RECIPEMANAGER";

		RowMapper<RecipeManager> mapper = new RowMapper<RecipeManager>() {

			public RecipeManager mapRow(ResultSet rs, int rowNum) throws SQLException {

				RecipeManager recipeManager = new RecipeManager();
				recipeManager.setRecipeId(rs.getString("RECIPE_ID"));
				recipeManager.setIngredient1(rs.getString("INGREDIENT1"));
				recipeManager.setIngredient2(rs.getString("INGREDIENT2"));
				recipeManager.setIngredient3(rs.getString("INGREDIENT3"));
				recipeManager.setIngredient4(rs.getString("INGREDIENT4"));

				return recipeManager;
			}
		};

		List<RecipeManager> recipeManagerlist = this.getNamedParameterJdbcTemplate().query(sql, mapper);

		return recipeManagerlist;
	}

}
