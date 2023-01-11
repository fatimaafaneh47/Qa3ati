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
<link rel="stylesheet" href="css/home.css" />


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
					<li><a href="/myhalls">My Halls/Reserves</a></li>
					<li><a href="/logout">Logout</a></li>


				</ul>
			</nav>

		</div>
	</header>
	<!-- Start homepage content -->

	<div id="main-banner">
		<img src="img/hhhh.jpg" alt="Welcome to qa3ati">
	</div>

	<div class="wrapper">
	
		<section id="home-menu">
			<h2>Welcome</h2>
			<ul>
				<li>
					<h3>About Us</h3>
					<p id="paragraph">This website has advantages for both the
						owner of the halls and the clients. The owner can show the details
						of his hall to be reserved easily by the clients, and the clients
						can view all the halls with their details including the available
						dates to be able to reserve the hall they want. Once the user logs
						in he/she can add a hall or reserve a hall in which he/she can
						book a hall easily and fast.</p>

				</li>
				<img id="card" src="img/rr.jpg">
				<li></li>
			</ul>

			<section id="featured">
				<ul>
					<li style="width: 320px;" class="square"><a href="/halls/new"><img src="img/addd.png"></a>

					</li>
				</ul>
				<ul>
					<li style="width: 320px;" class="square2"><a href="/halls"><img
						src="img/viewiw.png"></a></li>
				</ul>
				<ul>
					<li style="width: 320px;"><a href="/halls"><img src="img/reserverr.png"></a></li>

				</ul>
			</section>
	</div>


	<!-- End homepage content -->

	<footer>
		<div class="wrapper">
			<ul>
				<li>Qa3ati Application</li>
				<li>Palestine, Ramallah</li>
				<li>738-738-7382</li>
			</ul>
			
			<ul>

				<li><a href="#">Facebook</a></li>
				<li><a href="#">Twitter</a></li>
				<li><a href="#">Email</a></li>

			</ul>
			<ul>
				<li>Qa3ati</li>
				<li>&copy; All Rights Reserved 2022</li>
			</ul>
		</div>
	</footer>
</body>
</html>

