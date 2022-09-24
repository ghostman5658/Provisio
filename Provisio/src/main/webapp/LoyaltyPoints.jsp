<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="provisio.beans.ReservationSummaryBean"%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>Provisio - Loyalty Points</title>
<link href="provisio.css" type="text/css" rel="stylesheet" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html">

<div class="navbar">
	<img src="logo.png" class="navimg">
	<div class="navtext">Provisio</div>
	<a class="navbarButton" href="index.html">Home</a> <a
		class="navbarButton" href="AboutUs.jsp">About Us</a> <a
		class="navbarButton" href="Locations.jsp">Locations</a> <a
		class="navbarButton" href="Registration.jsp">Register</a> <a
		class="navbarButton" href="Login.jsp">Login</a> <a
		class="navbarButton" href="Reservation.jsp">Reservations</a> <a
		class="navbarButton" href="LookUp.jsp">Look Up</a> <a
		class="navbarButtonActive" href="LoyaltyPoints.jsp">Loyalty Points</a>
	<a class="navbarButtonLogOut" href="LogOut.jsp">Log Out</a>
</div>
</head>

<body>
	<%
	ReservationSummaryBean summary = new ReservationSummaryBean();
	%>
	<%
	if (session.getAttribute("sessionID") == null) {
	%>
	<div class="response">
		<h3 class="responseHeader">You are not logged in. Please login to
			continue.</h3>
		<br /> <a class="highlight" href="Login.jsp">Login</a>
	</div>
	<%
	} else {


	%>

	<h1 class="formHeading">Your Loyalty Points</h1>
	<hr />
	<br />
	<center>
		<%
	out.print(session.getAttribute("LoyaltyPoints"));

		%>
	</center>

<%
if(session.getAttribute("City") == "Omaha"){
%>

<img src="OmahaBaseball.jpg" alt="TD Ameritrade Park" width="500" height="600">
<img src="OmahaFootball.jpg" alt="Memorial Stadium" width="500" height="600">
<img src="OmahaZoo.jpg" alt="Henry Doorly Zoo" width="500" height="600">
<%
}
%>

<%
if(session.getAttribute("City") == "Denver"){
	%>

	<img src="DenverPark.jpg" alt="Rocky Mountain National Park" width="500" height="600">
	<img src="DenverGardens.jpg" alt="Denver Botanic Gardens" width="500" height="600">
	<img src="DenverBaseball.jpg" alt="Coors Field" width="500" height="600">
	<%
}
%>

<%
if(session.getAttribute("City") == "Los Angeles"){
	%>

	<img src="LAUniversal.jpg" alt="Universal Studios" width="500" height="600">
	<img src="LAPier.jpg" alt="Santa Monica Pier" width="500" height="600">
	<img src="LAGetty.jpg" alt="The Getty Center" width="500" height="600">
	<%
}
%>


	<%
	}
	%>
</body>

</html>