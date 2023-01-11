<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>  
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="/css/allhalls.css">
</head>
<body>
<header>
		<div class="wrapper">
			<h1 class="logo">Qa3ati</h1>
			<nav>
				<h2>Main Navigation</h2>
				<ul>
					<li><c:out value=" ${user.userName}"></c:out></li>
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
	<div class="divseperator"></div>
    <div style="margin:10%;" class="container">
        <h1>Reserve a Hall</h1>
          <table class="rwd-table">
            <tbody>
              <tr>
                <th>Hall</th>
                <th>Price</th>
                <th>Capacity</th>
                <th>Address</th>
                <th>City</th>
                <th>Actions</th>
              </tr>
               <c:forEach var="hall" items="${halls}">
              <tr>
             
                <!-- <td data-th="Supplier Code"> -->
                   
                     
                            <td><a href="/halls/${hall.id}"><c:out value="${hall.name}"></c:out></a></td>
                            <td><c:out value="${hall.basicPrice}"></c:out></td>
                            <td><c:out value="${hall.capacity}"></c:out></td>
                            <td><c:out value="${hall.address}"></c:out></td>
                            <td><c:out value="${hall.city.cityName}"></c:out></td>
                             <c:if test="${user.id == hall.creator.id}">
                            <td><a href="/halls/${hall.id}/delete">delete</a></td>
                             </c:if>
                             <c:if test="${user.id != hall.creator.id}">
                      		<td><a href="/halls/${hall.id}">Review</a></td>
                    </c:if>
                </td>
                
              </tr>
               </c:forEach>
            </tbody>
          </table>
          <a href="/halls/new"><h3>Add a Hall</h3></a>
        </div>
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