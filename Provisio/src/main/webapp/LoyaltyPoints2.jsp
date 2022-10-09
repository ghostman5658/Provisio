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
	if (session.getAttribute("sessionID") == null) {
	%>
	<div class="response">
		<h3 class="responseHeader">You are not logged in. Please login to
			continue.</h3>
		<br /> <a class="highlight" href="Login.jsp">Login</a>
	</div>
	<%
	} 
	else {
		ReservationSummaryBean summary = new ReservationSummaryBean();
		String email = (String)session.getAttribute("sessionID");
		String excursionSelection = request.getParameter("excursion");
		int lp = summary.getLoyaltyPoints(email);
		int exP = summary.getExcursionPoints(excursionSelection);
		
		if (exP > lp) {
			%>
			<div class="response">
				<h3 class="responseHeader">You Do Not Have Enough Points.</h3>
				<br /> 
				<a class="highlight" href="LoyaltyPoints.jsp">Back</a>
			</div>
			<% 
		}
		else {
			
			int returnPoints = exP * (-1);
			summary.setLoyaltyPoints(returnPoints, email);
			int getNewPoints = summary.getLoyaltyPoints(email);
			String excursionName = summary.getExcursionName(excursionSelection);
			
	%>
	<div class="randl">
	<h1 class="formHeading">Your Excursion Overview</h1><hr /><br /> 
		<table>
			<tr>
				<td>Excursion: </td>
				<td>
				<%out.print(excursionName);%>
				</td>
			</tr>
			<tr>
				<td>Charged Points: </td>
				<td>
				<%out.print(exP);%>
				</td>
			</tr>
			<tr>
				<td>New Loyalty Points Total: </td>
				<td>
				<%out.print(getNewPoints);%>
				</td>
			</tr>
		</table>
	</div>
	
	<%
		}
	}
	%>
	
</body>

</html>