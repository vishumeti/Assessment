<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
  <script
     src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.7.8/angular.js"></script>
  <script
     src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.7.8/angular-route.js"></script>
         
<script type="text/javascript">
     
var app = angular.module('myapp', ['ngRoute']);

app.controller('myappcontroller', function($scope, $http, $window) {
$scope.users = [];
$scope.showAddUser = false;
$scope.userform = {
firstName : "",
lastName : "",
middleName : "",
age : "",
gender : ""
 };

getUserDetails();

function getUserDetails() {
	  $http({
	    method : 'GET',
	    url : '/api/customers'
	   }).then(function successCallback(response) {
	   $scope.users = response.data;
	   }, function errorCallback(response) {
	    console.log(response.statusText);
	   });
	  };
	  	  
$scope.deleteUser = function(user){
 $http({
	 method: 'DELETE',
	 url: '/api/customer/'+user.id
 }).then(function successCallback(response) {
	   $scope.users = response.data;
 }, function errorCallback(response) {
  console.log(response.statusText);
 });
 $window.location.href = "/";
};

$scope.addUser = function(){
	$scope.showAddUser = true;
};

$scope.processUser = function(){
	
	$http({
		method: 'POST',
		url: '/api/customers',
		data: $scope.userform,
		headers: {
			'Content-Type' : 'application/json'
		}
	}).then((function(data){
		/* alert(angular.toJson(data));
		$scope.users.push(data); */
		getUserDetails();
	}))};

$scope.editUser = function(user) 
{
  $scope.userform.firstName = user.firstName;
  $scope.userform.middleName = user.middleName;
  $scope.userform.lastName = user.lastName;
  $scope.userform.id= user.id;
  $scope.userform.age = user.age;
  $scope.userform.gender = user.gender;
}
});



app.config(function($routeProvider){
	$routeProvider.when('/user/:param1',{
		templateUrl : '/user',
		controller: 'RouteController'
	}).otherwise({
		redirectTo: '/'
	});
});

app.controller("RouteController", function ($scope, $routeParams, $location, $http, $window) {
    // Using $location service
    var url = $location.path().split('/');
    $scope.firstParameter = url[2];
    $scope.secondParameter = url[3];
    $scope.param1 = $routeParams.param1;
    $scope.newform = {
    		firstName : "",
    		lastName : "",
    		middleName : "",
    		age : "",
    		gender : ""
    		 };

    function getById(id){
  	  $http({
  		 method: 'GET',
  		 url: '/api/customer/'+id
  	 }).then(function successCallback(response) {
  		   $scope.newform = response.data;
	   	}); 
  	};
    
    getById($scope.param1);
    
    $scope.processUser = function(){
    	
    	$http({
    		method: 'POST',
    		url: '/api/customers',
    		data: $scope.newform,
    		headers: {
    			'Content-Type' : 'application/json'
    		}
    	}).then((function(data){
    		/* alert(angular.toJson(data));
    		$scope.users.push(data); */
    		getUserDetails();
    		 $window.location.href = "/";
    	}))};
    
    	function getUserDetails() {
    		  $http({
    		    method : 'GET',
    		    url : '/api/customers'
    		   }).then(function successCallback(response) {
    		   $scope.users = response.data;
    		   }, function errorCallback(response) {
    		    console.log(response.statusText);
    		   });
    		  };    	
});

</script>

<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>

<body ng-app="myapp" ng-controller="myappcontroller">
<nav class="nav navbar navbar-inverse primary-color">
<a class="navbar-brand" href="/">Customers</a>
</nav>
 

<div>
<a class="btn btn-primary" ng-click="addUser()">Add User</a>
<hr>
<table class="table table-responsive">
<tr>
<th> ID </th>
<th> FirstName </th>
<th> MiddleName </th>
<th> LastName </th>
<th> Age </th>
<th> Gender </th>
</tr>
<tr  ng-repeat="user in users">
<td> {{user.id }}</td>
<td> {{user.firstName }}</td>
<td> {{user.middleName }}</td>
<td> {{user.lastName }}</td>
<td> {{user.age }}</td>
<td> {{user.gender }}</td>
<td><a class="btn btn-primary btn-sm" href="#!user/{{user.id}}">Edit User</a></td>
<td><a class="btn btn-danger btn-sm" ng-click="deleteUser(user)">Delete User</a></td>
</tr>
</table>
</div>

<div style="padding:100px 0 0 0;">

<form id="userform" ng-submit="processUser" ng-if="showAddUser">
<table class="table table-bordered table-responsive">
<tr>
<td> FirstName </td>
<td> MiddleName </td>
<td> LastName </td>
<td> Age </td>
<td> Gender </td>
</tr>
<tr>
<td><input type="text" ng-model="userform.firstName"></td>
<td><input type="text" ng-model="userform.middleName"></td>
<td><input type="text" ng-model="userform.lastName"></td>
<td><input type="text" ng-model="userform.age"></td>
<td><input type="text" ng-model="userform.gender"></td>
<td><input type="submit" class="btn btn-primary btn-sm" ng-click="processUser()" value="Create User" /></td>
</tr>
</table>

</form> 

<ng-view></ng-view>  

</div>
</body>
</html>