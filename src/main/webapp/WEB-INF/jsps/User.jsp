<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Data</title>
</head>
<body>
<form id="newform" ng-submit="processUser">
<table class="table table-bordered table-responsive">
<tr>
<td> FirstName </td>
<td> MiddleName </td>
<td> LastName </td>
<td> Age </td>
<td> Gender </td>
</tr>
<tr>
<td><input type="text" ng-model="newform.firstName"></td>
<td><input type="text" ng-model="newform.middleName"></td>
<td><input type="text" ng-model="newform.lastName"></td>
<td><input type="text" ng-model="newform.age"></td>
<td><input type="text" ng-model="newform.gender"></td>
<td><input type="submit" class="btn btn-primary btn-sm" ng-click="processUser()" value="Update User" /></td>
</tr>
</table>
</body>
</html>