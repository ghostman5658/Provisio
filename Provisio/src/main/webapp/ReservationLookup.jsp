<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*, java.util.Date" %>

<%-- ****Bean**** --%>
<%-- <%@ page import="provisio.beans.ReservationSummaryBean"%> --%>
<%@ page import="provisio.beans.ReservationSummaryBean"%>

<%-- ****Calendar and Dates**** --%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.util.Calendar" %>

<!DOCTYPE html>
<html lang="en">
<head>
<head>
<title>Provisio - Past Reservation Lookup</title>
<link href="provisio.css" type="text/css" rel="stylesheet" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html">
<div class="navbar">
	<img src="logo.png" class="navimg">
	<div class="navtext">Provisio</div>
	<a class="navbarButton" href="index.html">Home</a> <a
		class="navbarButton" href="AboutUs.html">About Us</a> <a
		class="navbarButton" href="Locations.jsp">Locations</a> <a
		class="navbarButton" href="Registration.jsp">Register</a> <a
		class="navbarButton" href="Login.jsp">Login</a> <a
		class="navbarButton" href="Reservation.jsp">Reservations</a> <a
		class="navbarButtonActive" href="LookUp.jsp">Look Up</a> <a
		class="navbarButton" href="LoyaltyPoints.jsp">Loyalty Points</a> <a
		class="navbarButtonLogOut" href="LogOut.jsp">Log Out</a>
</div>
</head>

<body>
<%
ReservationSummaryBean summary = new ReservationSummaryBean();
%>
	<%
	if (session.getAttribute("sessionID") == null) {
	%>
	<h1>You are not logged in. Please log in to continue.</h1>
	<a class="highlight" href="Login.jsp">Login</a>
	<%
	} 
	else {
		if(request.getMethod().equals("POST")){
			String bd = (String)session.getAttribute("bookingDate");
			//Date bookingDate = new SimpleDateFormat("yyyy-MM-dd").parse(bd);  
			
			String ad = (String)session.getAttribute("checkInDate");
			//Date arrivalDate = new SimpleDateFormat("yyyy-MM-dd").parse(ad); 
			
			String dd = (String)session.getAttribute("checkOutDate");
			//Date departureDate = new SimpleDateFormat("yyyy-MM-dd").parse(dd); 
			
			int pointsEarned = (int)session.getAttribute("pointsEarned");
			int guestNum = (int)session.getAttribute("guestNum");
			String selectedAmenities = (String)session.getAttribute("selectedAmenities");
			double cost = (Double)session.getAttribute("grandTotal");
			int hotelId = (Integer)session.getAttribute("hotelId");
			String email = (String)session.getAttribute("sessionID");
			int roomId = (Integer)session.getAttribute("roomId");
		
			summary.setReservation(bd, ad, dd, pointsEarned, guestNum, selectedAmenities, cost, hotelId, email, roomId);
			summary.setLoyaltyPoints(pointsEarned, email); 
			int reservationId = summary.getReservationId(hotelId, email, roomId);
	%>
	<div class="response">
        <h3 class="responseHeader">
        <%
        out.println("Congratulations you have successfully booked your room, your confirmation number is " +  reservationId);

        %> </h3><br />
        <a class="highlight" href="index.html">Home Page</a>
    </div>
	<%
		
		}
		
		if(request.getMethod().equals("GET")){
	%>

	<%
		}
	}
	%>
</body>
</html>


