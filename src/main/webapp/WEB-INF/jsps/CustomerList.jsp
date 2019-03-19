<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div>

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
<td><button class="btn btn-primary btn-sm" ng-click="editUser(user)">Edit User</button></td>
<td><button class="btn btn-danger btn-sm" ng-click="deleteUser(user)">Delete User</button></td>
<td><a href="#!user/{{user.id}}">edit</a></td>
</tr>
</table>
</div>
</body>
</html>