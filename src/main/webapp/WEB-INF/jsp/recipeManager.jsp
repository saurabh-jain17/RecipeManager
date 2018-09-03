<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Recipe Manager</title>
<script
	src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script type="text/javascript">
	var app = angular.module('myapp', []);

	app.controller('myappcontroller', function($scope, $http) {

		$scope.recipeManager = []
		$scope.recipeManagerForm = {
			recipeId : "",
			ingredient1 : "",
			ingredient2 : "",
			ingredient3 : "",
			ingredient4 : "",
		};

		getAllRecipeManager();

		function getAllRecipeManager() {
			$http({
				method : 'GET',
				url : 'fetchAllData'
			}).then(function successCallback(response) {
				$scope.recipeManager = response.data;
			}, function errorCallback(response) {
				console.log(response.statusText);
			});
		}

		$scope.addRecipeManager = function() {
			$http({
				method : 'POST',
				url : 'insert',
				data : angular.toJson($scope.recipeManagerForm),
				headers : {
					'Content-Type' : 'application/json'
				}
			}).then(getAllRecipeManager(), clearForm())
			  .success(function(data){
				$scope.recipeManager= data
		    });
		}

		$scope.updateRecipeManager = function() {
			$http({
				method : 'POST',
				url : 'update',
				data : angular.toJson($scope.recipeManagerForm),
				headers : {
					'Content-Type' : 'application/json'
				}
			}).then(getAllRecipeManager(), clearForm())
			  .success(function(data){
				$scope.recipeManager= data
		    });
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

	<h2>Recipe Manager</h2>

	<form ng-submit="addRecipeManagerDetails()">
		<div class="table-responsive">
			<table class="table table-bordered" style="width: 600px">
				<tr>
					<td>Recipe Id </td>
					<td><input type="text" id="recipeId" ng-model="recipeManagerForm.recipeId"
						size="30" /></td>
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
						class="btn btn-primary btn-sm" ng-click="addRecipeManager()"
						value="ADD" /></td>
				</tr>
			</table>
		</div>
	</form>

	<h2>Recipe Manager Detail </h2>
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

			<tr ng-repeat="recipeManager in recipeManagers">
				<td>{{ recipeManager.recipeId}}</td>
				<td>{{ recipeManager.ingredient1 }}</td>
				<td>{{ recipeManager.ingredient2 }}</td>
				<td>{{ recipeManager.ingredient3 }}</td>
				<td>{{ recipeManager.ingredient4 }}</td>
				<td><a ng-click="updateRecipeManager(recipeManager)" class="btn btn-primary btn-sm">Update</a>
					| <a ng-click="deleteRecipeManagerById(recipeId)" class="btn btn-danger btn-sm">Delete</a></td>
			</tr>
		</table>
	</div>



</body>
</html>