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
<title>Provisio - Reservation Summary</title>
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
		class="navbarButtonActive" href="Reservation.jsp">Reservations</a> <a
		class="navbarButton" href="LookUp.jsp">Look Up</a> <a
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
	<div width="98%">
		<form class="randl" method='POST' action='ReservationSummary.jsp'>
			<h1 class="formHeading">Reservation Summary</h1><hr /><br />
			<table>
				<tr>
					<td>Booking Date: </td>
					<td>
					<% 
					// Gets the current booking date
					// https://www.tutorialspoint.com/how-to-format-date-in-jsp
					// Date must be formated with correct upper and lower case
					Date dateToday = new Date();
					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	      			String bd = df.format(dateToday);
	      			session.setAttribute("bookingDate", bd);
	      			out.println(bd);
					%>
					</td>
				</tr>
				<tr>
					<td>Check-in Date: </td>
					<td>
					<% 
					String checkInDate = request.getParameter("Checkin");
					session.setAttribute("checkInDate", checkInDate);
					out.print(checkInDate);
					%>
					</td>
				</tr>
				<tr>
					<td>Check-out Date: </td>
					<td>
					<% 
					String checkOutDate = request.getParameter("CheckOut");
					session.setAttribute("checkOutDate", checkOutDate); 
					out.print(checkOutDate);
					%>
					</td>
				</tr>
				<tr>
					<td>Destination: </td>
					<td>
					<%
					String city = request.getParameter("City");
					out.print(city);
					%> 
					</td>
				</tr>
				<tr>
					<td>Room Size: </td>
					<td>
					<%
					String roomSize = request.getParameter("RoomSize");
					out.print(roomSize);			
					%> 
					</td>
				</tr>
				<tr>
					<td>Points Earned: </td>
					<td>
					<%
					int totalDays = summary.dayLength(checkInDate, checkOutDate);			
					int pointsEarned = summary.pointsEarned(totalDays);
					session.setAttribute("pointsEarned", pointsEarned);
					out.print(pointsEarned);
					%>
					</td>
				</tr>
				<tr>
					<td>Number of Guests: </td>
					<td>
					<%
					String guest = request.getParameter("Guests");
					int guestNum = summary.numbOfGuests(guest);
					session.setAttribute("guestNum", guestNum); 
					out.print(guestNum);
					%>
					</td>
				</tr>
				<tr>
					<td>Wifi: </td>
					<td>
					<%
					String wifi = request.getParameter("Wifi");
					String amenWifi = summary.amenities(wifi);
					out.print(amenWifi);					
					%>
					</td>
				</tr>
				<tr>
					<td>Breakfast: </td>
					<td>
					<%
					String breakfast = request.getParameter("Breakfast");
					String amenBreakfast = summary.amenities(breakfast);
					out.print(amenBreakfast);
					%>
					</td>
				</tr>
				<tr>
					<td>Parking: </td>
					<td>
					<%
					String parking = request.getParameter("Parking");
					String amenParking = summary.amenities(parking);
					String selectedAmenities = summary.selectedAmenities(amenWifi, amenBreakfast, amenParking);
					session.setAttribute("selectedAmenities", selectedAmenities); 
					out.print(amenParking);					
					%>
					</td>
				</tr>
				<tr>
					<td>Night: </td>
					<td>
					<% 
					totalDays = summary.dayLength(checkInDate, checkOutDate);				
					out.println(totalDays);
					%>		
					</td>
				</tr>
				<tr>
					<td>Room: </td>
					<td>
					<% 
					roomSize = request.getParameter("RoomSize");
					out.print(roomSize);
					%>				
					</td>
				</tr>
				<tr>
					<td>Room Cost: </td>
					<td>
					<%
					double roomPrice = summary.getRoomPrice(city, roomSize, totalDays);
					out.print("$" + roomPrice);
					%>				
					</td>
				</tr>
				<tr>
					<td>Amenities Cost: </td>
					<td>
					<%
					// **If amenities is selected, price will be true and added to the total cost**
					double amenitiesPrice = summary.amenitiesPrice(amenWifi, amenBreakfast, amenParking, totalDays);
					out.print("$" + amenitiesPrice);
					%>			
					</td>
				</tr>
				<tr>
					<td>Taxes: </td>
					<td>$20.90</td>
				</tr>
				<tr>
					<td><strong>Total Cost: </strong></td>
					<td><strong>
					<%
					double tax = 20.9;
					double grandTotal = summary.getGrandTotal(amenitiesPrice, roomPrice, tax);
					session.setAttribute("grandTotal", grandTotal); 
					out.print("$" + grandTotal);
					%>		
					</strong></td>
				</tr>
			</table>
			<%
			int hotelId = summary.getHotelId(city);
			session.setAttribute("hotelId", hotelId); 
			
			int roomId = summary.getroomId(hotelId, roomSize);
			session.setAttribute("roomId", roomId); 
			%>
	<div class="center">
		<button type='submit'>Confirm</button>
	</div>
	</form>
	<div class="center">
	<button type='submit' id="cancel" onClick="window.location.href='http://localhost:8080/Provisio/Reservation.jsp'">Cancel</button>
	</div>
	</div>
	<%
		}
	}
	%>
</body>
</html>




