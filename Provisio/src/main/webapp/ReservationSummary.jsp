<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>

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
<title>Reservation Summary</title>
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
	} else {
	%>
	<div width="98%">
		<form class="ReservationSummary" method='GET' action='Reservation.jsp'>
			<h1 class="formHeading">Reservation Summary</h1>
			<hr />
			<br />
			<fieldset>
				<legend>Your Booking Details</legend>
				<div>
					<p>
						<label>Booking Date:
						<% 
						// Gets the current booking date
						// https://www.tutorialspoint.com/how-to-format-date-in-jsp
						// Date must be formated with correct upper and lower case
						Date dateToday = new Date();
						SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	      				out.println(df.format(dateToday));
						%>
						</label>
					</p>
					<p>
						<label>Check-in Date:
						<% 
						String showCheckin = request.getParameter("Checkin");
						out.print(showCheckin);
						%>
						</label>
					</p>
					<p>
						<label>Check-out Date:
						<% 
						String showCheckout = request.getParameter("CheckOut");
						out.print(showCheckout);
						%></label>
					</p>
				</div>
				<div>
					<p>
						<label>Destination: 
						<%
						String city = request.getParameter("City");												
						out.print(city);
						%> 
						<br />
						</label>
					</p>
					<p>
						<label>Room Size: 
						<%
						String roomSize = request.getParameter("RoomSize");
						out.print(roomSize);			
						%> 
						<br />
						</label>
					</p>
					<p>
						<label>Number of Guests: 
						<%
						String guestNum = request.getParameter("Guests");
						out.print(guestNum);
						%>
						<br />
						</label>
					</p>
				</div>
				<div>
					<p>
						<label>Amenities<br /> 
						<%
						String wifi = request.getParameter("Wifi");
						out.print("Wifi: ");
						
						String amenWifi = summary.Amenities(wifi);
						out.print(amenWifi);					
						%>
						<br /> 
						<%
						String breakfast = request.getParameter("Breakfast");
						out.print("Breakfast: ");
						
						String amenBreakfast = summary.Amenities(breakfast);
						out.print(amenBreakfast);
						%>
						<br />
						<%
						String parking = request.getParameter("Parking");
						out.print("Parking: ");
						
						String amenParking = summary.Amenities(parking);
						out.print(amenParking);					
						%>
						<br />
						</label>
					</p>
				</div>
				
			</fieldset>
	</div>
	<div width="90%">
		<fieldset>
			<legend>Total Length of Stay</legend>
			<p>
				<% 
				// https://stackoverflow.com/questions/51213753/convert-string-to-date-jsp
				String checkInDate = request.getParameter("Checkin");
				String checkOutDate = request.getParameter("CheckOut");
				
				int totalDays = summary.dayLength(checkInDate, checkOutDate);
								
				out.println(totalDays + " Night");
				%>							
			</p>		
		</fieldset>
	</div>
	<div width="90%">
		<fieldset>
			<legend>Price Summary</legend>
			<p>
				<label>
					Room Cost:
				<% 
				String roomName = request.getParameter("RoomSize");
				//String roomCheck = roomName.toString();
				out.print(roomName);
				%>				
				<%
				double roomPrice = summary.roomPrice(roomName);
				out.print("$" + roomPrice);
				%>			
					
				</label>
				<br>
			</p>
			<p>
				<label>
					Amenities Cost:
					<%
					// **If amenities is selected, price will be true and added to the total cost**
					double amenitiesPrice = 0.0;
					//amenitiesPrice = summary.amenitiesPrice(wifi, breakfast, parking);
					//out.print("$" + amenitiesPrice);
					%>
					
				</label>
				<br>
			</p>
			<p>
				<label>
					TAX: $20.90
				</label>
			</p>
			<p>
				<label>
					Total Cost: 
					<%
					double grandTotal = 0.0;
					double tax = 20.9;
					grandTotal = roomPrice + amenitiesPrice + tax;
					
					out.print("$" + grandTotal);
					%>
				</label>
			</p>
		</fieldset>
	</div>
	
	<%
	// To be inserted into the database
	Date bookDate = dateToday;
	
	String inDate = request.getParameter("Checkin");
	String outDate = request.getParameter("CheckOut");
	
	// Convert type 'String' Date into a type 'Date'
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");    
	Date arrive = sdf.parse(inDate);
	Date depart = sdf.parse(outDate);	
	
	int points = 0;
	
	String guestCount = request.getParameter("Guests");
	int guest = Integer.parseInt(guestCount);
	%>	
	<%
	// Insert into database
	// summary.setReservation(bookDate, arrive, depart, points, guest, email);
	%>
	
	<div class="center">
		<button type='submit'>Confirm</button>
		<%-- 
		<input type="submit" name="cancel" value="Cancel" />
		--%>
		<input type="submit" name="Cancel" value="cancel" onClick="document.history.back();">
		<br />
	</div>
	</form>
	</div>
	<%
	}
	%>
</body>
</html>