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
			<%
			ReservationSummaryBean summary = new ReservationSummaryBean();
			%>
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
						//String locateCity = summary.setCity(city);
						//out.print(locateCity);
						
						out.print(city);
						//if(city.toString() == "omaha") {
							//out.print("Omaha, NE");	
						//} else {
							//out.println("Not Working");
						//}
						%> 
						<br />
						</label>
					</p>
					<p>
						<label>Room Size: 
						<%
						String room = request.getParameter("RoomSize");
						out.print(room);			
						%> 
						<br />
						</label>
					</p>
					<p>
						<label>Number of Guests: 
						<%
						String guest = request.getParameter("Guests");
						out.print(guest);
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
						if(wifi == null) {
							out.print("No");
						} else {
							out.print("Yes");							
						}						
						%>
						<br /> 
						<%
						String breakfast = request.getParameter("Breakfast");
						out.print("Breakfast: ");
						if(breakfast == null) {
							out.print("No");
						} else {
							out.print("Yes");							
						}						
						%>
						<br />
						<%
						String parking = request.getParameter("Parking");
						out.print("Parking: ");
						if(parking == null) {
							out.print("No");
						} else {
							out.print("Yes");							
						}						
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
				
			    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//give format in which you are receiving the `String date_updated`
			    
			    java.util.Date inDate = sdf.parse(checkInDate);
			    java.util.Date outDate = sdf.parse(checkOutDate);
			    //java.sql.Date sqlDate_updated = new java.sql.Date(date.getTime());
			    //ps.setDate(11, sqlDate_updated); 
			    
				// https://beginnersbook.com/2013/04/number-of-days-calculation-between-two-dates/
				//Date totalStay = summary.dayLength(inDate, outDate);
				long difference = outDate.getTime() - inDate.getTime();
				float daysBetween = (difference / (1000*60*60*24));
				
				// Remove decimal
				// https://www.codegrepper.com/code-examples/typescript/remove+decimal+from+double+java
				int totalDays = (int) daysBetween;
				
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
				String roomCheck = roomName.toString();
				out.print(roomName);
				%>
				
				<%
				double roomPrice = summary.roomPrice("roomCheck");
				out.print("$" + roomPrice);
				%>			
					
				</label>
				<br>
			</p>
			<p>
				<label>
					Amenities Cost:
					
				</label>
				<br>
			</p>
			<p>
				<label>
					14.03% TAX: $169.90
				</label>
			</p>
		</fieldset>
	</div>
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