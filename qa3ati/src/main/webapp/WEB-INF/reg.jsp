<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="CSS/reg.css">
</head>
<body>
<header>
		<div class="wrapper">
			<h1 class="logo">Qa3ati</h1>
			<nav>
				<h2>Main Navigation</h2>
				<ul>
					<li><a href="/">About Us</a></li>
					<li><a href="/login">Login</a></li>
					<li><a href="/reg">Register</a></li>
					<li><a href="/halls/new">Add a Hall</a></li>
					<li><a href="/halls">Reserve a Hall</a></li>
					<li><a href="/">My Halls/Reserves</a></li>
					<li><a href="/logout">Logout</a></li>


				</ul>
			</nav>

		</div>
	</header>
	<div>
		<div class="login-box">
			<h1>Register</h1>
			<form:form action="/register" method="post" modelAttribute="newUser">
				<div class="user-box">
					<p>
						<form:label path="userName"> User Name</form:label>

						<form:input path="userName" />
						<form:errors path="userName" />
					</p>

					<p>
					<div class="user-box">
						<form:label path="email"> Email</form:label>

						<form:input  type="email" path="email" />
						<form:errors path="email" />
						</p>
						<div class="user-box">
							<p>
								<form:label path="password"> Password</form:label>

								<form:input type="password" path="password" />
								<form:errors path="password" />
							</p>
							<div class="user-box">
								<p>
									<form:label path="confirm"> Confirm</form:label>

									<form:input type="password" path="confirm" />
									<form:errors path="confirm" />
								</p>
							</div>
							
							<input type="submit" value="register" />
			</form:form>
		</div>
</body>
</html>