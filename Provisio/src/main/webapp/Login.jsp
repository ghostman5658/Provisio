<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>Registration</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="provisio.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;700&display=swap"
	rel="stylesheet">

<div id="navbar">
	<img src="logo.png" class="navimg">
	<div class="navtext">Provisio</div>
	<a class="navbarButton" href="Home.html">Home</a> 
	<a class="navbarButton" href="AboutUs.jsp">About Us</a> 
	<a class="navbarButton" href="Locations.jsp">Locations</a> 
	<a class="navbarButtonActive" href="Registration.jsp">Register</a> 
	<a class="navbarButton" href="Login.jsp">Login</a> 
	<a class="navbarButton" href="Reservation.jsp">Reservations</a> 
	<a class="navbarButton" href="LookUp.jsp">Look Up</a> 
	<a class="navbarButton" href="LoyaltyPoints.jsp">Loyalty Points</a>
</div>

</head>
<body>
	<div id="container">


		<form action="user_login" method="post" action='Login.jsp'>
		<div class="" id="">
		<h1 class="formHeading">Login</h1> 
		
			<table style="width: 20%">
				<tr>
					<td>Username: </td>
					<td><input name="email" type="text" min="0" maxlength="30" required="required"> </td>
				</tr>
				<tr>
					<td>Password: </td>
					<td><input name="password" type="password" min="0" maxlength="20" required="required"> </td>
				</tr>
			</table>
			<input type="submit" value="Login" />
		</form>
</body>
</html>