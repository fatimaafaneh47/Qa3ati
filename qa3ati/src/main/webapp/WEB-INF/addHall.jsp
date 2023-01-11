<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>  
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<title>Insert title here</title>
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
	<div class="seperator"></div>
	
<h1 class="hall" >Add a Hall</h1>
 <main id="main"  role="main">		
        <div class="con dep">
                <div id="tp-area">
                </div>
                 <div>
                <form:form action="/halls/create" method="post" modelAttribute="hall" class="new_hire" name="hr_nh" >
                <form:input type="hidden" path="creator" value="${user.id}"/>
        <ul id="n_list">
         
                <div class="input-group date ft_r" id="dt_pick_bd">
                    
                </div>
            </li>
	            <li></i><div class="ft_r"><form:label path="name">Name</form:label><form:input path="name" type="" placeholder="name" name="emp_ext" value="" class="hall-address"/><form:errors path="name"></form:errors></div></li>	
	            <li></i><div class="ft_r selecttion">
	            <form:label path="city">City</form:label>
	            <form:select path="city" class="input cities" >
	            <c:forEach var="city" items="${cities}">
	            <option value="${city.id}">${city.cityName}</option>
	   			 </c:forEach>
	 
				 </form:select>
				</div></li>	
	            <li></i><div class="ft_r"><form:label path="address">Address</form:label><form:input path="address" placeholder="Address" type="emp_pos" name="" value="" class="hall-address" /><form:errors path="address"></form:errors></div></li>
	            <li></i><div class="ft_r"><form:label path="phoneNumber">Phone Number</form:label><form:input path="phoneNumber" placeholder="number" type="emp_pos" name="" value="" class="hall-address" /><form:errors path="phoneNumber"></form:errors></div></li>
	            <li></i><div class="ft_r"><form:label path="description">Description</form:label><form:input path="description" placeholder="description" type="emp_pos" name="" value="" class="hall-address" /><form:errors path="description"></form:errors></div></li>
	             <li></i><div class="ft_r"><form:label path="capacity">Capacity</form:label><form:input path="capacity" placeholder="number" type="emp_pos" name="" value="" class="hall-address" /><form:errors path="capacity"></form:errors></div></li>
	            <li></i><div class="ft_r"><form:label path="basicPrice">Price</form:label><form:input path="basicPrice" placeholder="number" type="emp_pos" name="" value="" class="hall-address" /><form:errors path="basicPrice"></form:errors></div></li>
	            
	           
	          
                    
            <li ><div class="ft_r addahall"><input type="submit" value="Add" class=" mybutton"></div></li>
        </ul>
   
    </form:form> 
            </div></div>
          
            		</main>
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