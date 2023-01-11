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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/css/myhalls.css" />
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
    <div style="display:inline-flex; justify-contents:space-around; margin:2% 25%; width: 100%">
    	<div style="margin-right:10%;" class="container">
        <h1>My Halls</h1>
          <table class="rwd-table">
            <tbody>
              <tr>
                <th>Hall</th>
                <th>Actions</th>
                
              </tr>
            
                <!-- <td data-th="Supplier Code"> -->
                    <c:forEach var="hall" items="${myHalls}">
                        <tr>
                            <td><a href="/halls/${hall.id}"><c:out value="${hall.name}"></c:out></a></td>
                            <td><a href="/halls/${hall.id}/delete">delete</a></td>
                      
              </tr>
                    </c:forEach>
                
                
            </tbody>
          </table>
          </div>
          <br><br><br>
          <div>
          <h1>My Reservations</h1>
          <table class="rwd-table">
          	
            <tbody>
              <tr>
                <th>Hall</th>
              </tr>
          	
            
                <!-- <td data-th="Supplier Code"> -->
                    <c:forEach var="hall" items="${myReserves}">
                        <tr>
                           	<td><a href="/halls/${hall.id}"><c:out value="${hall.name}"></c:out></a></td>
              			</tr>
                    </c:forEach>
                
               
     
            </tbody>
          </table>
       </div>
        </div>
                  
                
</body>
</html>