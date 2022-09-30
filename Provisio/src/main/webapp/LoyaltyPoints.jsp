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
		String[] res = summary.getReservation(email);
		
		int lp = summary.getLoyaltyPoints(email);
	%>
	<div class="randl">
	<h1 class="formHeading">Your Loyalty Points Overview</h1><hr /><br /> 
		<table>
			<tr>
				<td>Email: </td>
				<td>
				<%out.print(email);%>
				</td>
			</tr>
			<tr>
				<td>Total Points: </td>
				<td>
				<%out.print(lp);%>
				</td>
			</tr>
            <%
                if (res[12] == null) {
                    out.print("<tr>");
                    out.print("<td>");
                    out.print("Reservation status: ");
                    out.print("</td>");
                    out.print("<td>");
                    out.print("No Reservations created.");
                    out.print("</td>");
                    out.print("</tr>");
            %>
		</table>
	</div>
	<%
    }
		else if(res[12] == "1" || res[12].equalsIgnoreCase("1")){
	%>
	
	<div>
		<div class="boxes">
			<img class="cities" src="OmahaBaseball.jpg" alt="TD Ameritrade Park" style="width: 100%">
			<p style="text-align: center;">TD Ameritrade Park</p>
		</div>
		<div class="boxes">
			<img class="cities" src="OmahaFootball.jpg" alt="Memorial Stadium" style="width: 100%">
			<p style="text-align: center;">Memorial Stadium</p>
		</div>
		<div class="boxes">
			<img class="cities" src="OmahaZoo.jpg" alt="Henry Doorly Zoo" style="width: 100%">
			<p style="text-align: center;">Henry Doorly Zoo</p>
		</div>
	</div>
		<%
		}
		else if(res[12] == "2" || res[12].equalsIgnoreCase("2")){
		%>
		
	<div>
		<div class="boxes">
			<img class="cities" src="DenverPark.jpg" alt="Rocky Mountain National Park" style="width: 100%">
			<p style="text-align: center;">Rocky Mountain National Park</p>
		</div>
		<div class="boxes">
			<img class="cities" src="DenverGardens.jpg" alt="Denver Botanic Gardens" style="width: 100%">
			<p style="text-align: center;">Denver Botanic Gardens</p>
		</div>
		<div class="boxes">
			<img class="cities" src="DenverBaseball.jpg" alt="Coors Field" style="width: 100%">
			<p style="text-align: center;">Coors Field</p>
		</div>
	</div>
		<%
		}
		else if (res[12] == "3" || res[12].equalsIgnoreCase("3")){
		%>
		
	<div>
		<div class="boxes">
			<img class="cities" src="LAUniversal.jpg" alt="Universal Studios" style="width: 100%">
			<p style="text-align: center;">Universal Studios</p>
		</div>
		<div class="boxes">
			<img class="cities" src="LAPier.jpg" alt="Santa Monica Pier" style="width: 100%">
			<p style="text-align: center;">Santa Monica Pier</p>
		</div>
		<div class="boxes">
			<img class="cities" src="LAGetty.jpg" alt="The Getty Center" style="width: 100%">
			<p style="text-align: center;">The Getty Center</p>
	</div>
	
	</div>
		<%
		}
	}
	%>
</body>

</html>