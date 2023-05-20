<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<title>Login Page</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
	<div class="login-box">
		<h2>Login</h2>
		<form method="post" action="http://localhost:8080/admin/login">
			<div class="user-box">
				<label for="uid">Username:</label>
				<input type="text" id="uid" name="uid"><br>
			</div>
			<div class="user-box">
				<label for="password">Password:</label>
				<input type="password" id="password" name="password"><br>
			</div>
			<div class="button-box">
				<button type="submit">Login</button>
			</div>
		</form>
	</div>
</body>
</html>