<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
* {
	box-sizing: border-box;
}

body {
	font-family: Arial, Helvetica, sans-serif;
}

/* Style the header */
header {
	background-color: #666;
	padding: 30px;
	text-align: center;
	font-size: 35px;
	color: white;
}

/* Create two columns/boxes that floats next to each other */
nav {
	float: left;
	width: 30%;
	height: 300px; /* only for demonstration, should be removed */
	background: #ccc;
	padding: 20px;
}

/* Style the list inside the menu */
nav ul {
	list-style-type: none;
	padding: 0;
}

article {
	float: left;
	padding: 20px;
	width: 70%;
	background-color: #f1f1f1;
	height: 300px; /* only for demonstration, should be removed */
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Recipe Manager</title>
<script
	src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script type="text/javascript">
	var app = angular.module('myapp', []);

	app.controller('myappcontroller', function($scope, $http) {

		$scope.addClicked = false;
		$scope.addselect = false;
		$scope.recipeManager = []
		$scope.recipeManagerForm = {
			recipeId : "",
			ingredient1 : "",
			ingredient2 : "",
			ingredient3 : "",
			ingredient4 : "",
		};
		
		$scope.recipeManagerUpdate = {
				recipeId : null,
				ingredient1 : "",
				ingredient2 : "",
				ingredient3 : "",
				ingredient4 : "",
			};

		 $scope.onChangeOfrecipeList = function(id) {				 
			 for(var i=0;i<$scope.recipeManager.length;i++) {				 
				 if($scope.recipeManager[i].recipeId == id) {
					 $scope.recipeManagerUpdate = $scope.recipeManager[i];
				 }
			 }
		 }

		$scope.getAllRecipeManager = function() {			
			$http({
				method : 'GET',
				url : '/RecipeManager/recipeManager/fetchAllData'
			}).then(function successCallback(response) {				
				$scope.recipeManager = response.data;
			}, function errorCallback(response) {
				console.log(response.statusText);
			});
		}
		
		$scope.getAllRecipeManager();

		$scope.addRecipeManager = function(recipeManagerForm) {	
			console.log(recipeManagerForm);
			$http({
				method : 'POST',
				url : '/RecipeManager/recipeManager/insert',
				data : angular.toJson($scope.recipeManagerForm),
				headers : {
					'Content-Type' : 'application/json'
				}
			}).then(function successCallback(response) {
				$scope.getAllRecipeManager();
			}, function errorCallback(response) {
			    console.log(response.statusText);
			});			
			
			/* 
			  .success(function(data){
				  $scope.recipeManager = response.data;
		    }); */
		}

		$scope.updateRecipeManager = function(recipeManagerForm) {
			$http({
				method : 'PUT',
				url : '/RecipeManager/recipeManager/update',
				data : recipeManagerForm,
				headers : {
					'Content-Type' : 'application/json'
				}
			}).then($scope.getAllRecipeManager(), clearForm())
			  .success(function(data){
				$scope.recipeManager= response.data
		    });
		}
		
		$scope.addRecipe = function () {
			$scope.addClicked = true;
		}
		
		$scope.selectRecipe = function () {
			$scope.addselect = true;
		}

		$scope.deleteRecipeManagerById = function(recipeId) {
			$http({
				method : 'DELETE',
				url : 'deleteById',
				data : angular.toJson(user),
				headers : {
					'Content-Type' : 'application/json'
				}
			}).then(getAllRecipeManager());
		}

		function clearForm() {
			$scope.recipeManagerForm.recipeId = "";
			$scope.recipeManagerForm.ingredient1 = "";
			$scope.recipeManagerForm.ingredient2 = "";
			$scope.recipeManagerForm.ingredient3 = "";
			$scope.recipeManagerForm.ingredient4 = "";
			document.getElementById("recipeId").disabled = false;
		}
		;
		function disableName() {
			document.getElementById("recipeId").disabled = true;
		}


	});

</script>
</head>
<body ng-app="myapp" ng-controller="myappcontroller">
	<header>
	<h2>Recipe Manager</h2>
	</header>

	<div>
		<select ng-model="selectedId"
			ng-change="onChangeOfrecipeList(selectedId)">
			<option ng-repeat="rm in recipeManager" value="{{rm.recipeId}}">Recipet - {{rm.recipeId}}</option>
		</select>
	</div>

	</th>


	<th>


		<div ng-show="recipeManagerUpdate.recipeId !=null">

			<h2>Recipe  {{recipeManagerUpdate.recipeId}} - Ingredient List</h2>

			<table>
				<tr>
					<td>Ingredient 1:</td>
					<td>{{recipeManagerUpdate.ingredient1}}</td>
				</tr>
				<tr>
					<td>Ingredient 2:</td>
					<td>{{recipeManagerUpdate.ingredient2}}</td>
				</tr>
				<tr>
					<td>Ingredient 3:</td>
					<td>{{recipeManagerUpdate.ingredient3}}</td>
				</tr>
				<tr>
					<td>Ingredient 4:</td>
					<td>{{recipeManagerUpdate.ingredient4}}</td>
				</tr>

			</table>
		</div> <br> <input type="submit" ng-click="addRecipe();" value="Add Recipe" />



		<div ng-show="addClicked" ng-hide="selectRecipe()">
			<h3><b> Add New Recipe </b></h3>

			<form>
				<div class="table-responsive">
					<table class="table table-bordered" style="width: 600px">
						<tr>
							<td>Recipe Id</td>
							<td><input type="text" id="recipeId"
								ng-model="recipeManagerForm.recipeId" size="30" /></td>
						</tr>
						<tr>
							<td>Ingredient 1</td>
							<td><input type="text" id="ingredient1"
								ng-model="recipeManagerForm.ingredient1" size="30" /></td>
						</tr>
						<tr>
							<td>Ingredient 2</td>
							<td><input type="text" id="ingredient2"
								ng-model="recipeManagerForm.ingredient2" size="30" /></td>
						</tr>
						<tr>
							<td>Ingredient 3</td>
							<td><input type="text" id="ingredient3"
								ng-model="recipeManagerForm.ingredient3" size="30" /></td>
						</tr>
						<tr>
							<td>Ingredient 4</td>
							<td><input type="text" id="ingredient4"
								ng-model="recipeManagerForm.ingredient4" size="30" /></td>
						</tr>
						<td colspan="2"><input type="submit"
							class="btn btn-primary btn-sm"
							ng-click="addRecipeManager(recipeManagerForm)" value="ADD" /></td>
						</tr>
					</table>
				</div>
			</form>
		</div> <!-- <h2>Recipe Manager Detail </h2>
	<div class="table-responsive">
		<table class="table table-bordered" style="width: 600px">
			<tr>
				<th>Recipe Id</th> 
				<th>Ingredient 1</th>
				<th>Ingredient 2</th>
				<th>Ingredient 3</th>
				<th>Ingredient 4</th>
				<th>Actions</th>
			</tr>			
			<tr ng-repeat="rm in recipeManager">
				<td>{{ rm.recipeId }}</td>
				<td>{{ rm.ingredient1 }}</td>
				<td>{{ rm.ingredient2 }}</td>
				<td>{{ rm.ingredient3 }}</td>
				<td>{{ rm.ingredient4 }}</td>
				<td><a ng-click="updateRecipeManager(rm)" class="btn btn-primary btn-sm">Update</a>
					| <a ng-click="deleteRecipeManagerById(rm.recipeId)" class="btn btn-danger btn-sm">Delete</a></td>
			</tr>
		</table>
	</div> -->
</body>
</html>