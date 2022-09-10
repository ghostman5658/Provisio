<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%-- <%@ page import="provisio.beans.ReservationSummaryBean"%> --%>
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
		<form class="Reservation" method='post' action='Reservation.jsp'>
			<h1 class="formHeading">Reservation Summary</h1>
			<hr />
			<br />
			<fieldset>
				<legend>Summary</legend>
				<div class="boxes">
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
				<div class="boxes">
					<p>
						<label>Amenities:<br /> 
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
				<div class="boxes">
					<p>
						<label>Booking Date:
						<% 
						// Gets the current booking date
						Date date = new Date();
						SimpleDateFormat df = new SimpleDateFormat("yyyy-mm-dd");
         				out.print(df.format(date));
						%>
						</label>
					</p>
					<p>
						<label>Check-in Date:
						<% 
						String checkin = request.getParameter("Checkin");
						out.print(checkin);
						%>
						</label>
					</p>
					<p>
						<label>Check-out Date:
						<% 
						String checkout = request.getParameter("CheckOut");
						out.print(checkout);
						%></label>
					</p>
				</div>
			</fieldset>
	</div>
	<div class="center">
		<button type='submit'>Confirm</button>
		<input type="submit" name="cancel" value="Cancel" />
		<%-- <input type="submit" name="Cancel" value="cancel" onclick="document.history.back();">--%>
		<br />
	</div>
	</form>
	</div>
	<%
	}
	%>
</body>
</html>