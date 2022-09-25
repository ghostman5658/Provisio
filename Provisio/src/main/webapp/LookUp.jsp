<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*, java.util.Date, java.text.*, java.util.ArrayList, java.text.SimpleDateFormat, java.util.concurrent.TimeUnit, java.util.Calendar, java.text.ParseException, java.math.BigDecimal, java.math.RoundingMode, java.sql.*" %>
<%@ page import="provisio.beans.ReservationSummaryBean"%>

<!DOCTYPE html>
<html lang="en">
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
                class="navbarButton" href="AboutUs.jsp">About Us</a> <a
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
        if (session.getAttribute("sessionID") == null) {
            %>
        <div class="response">
        	<h3 class="responseHeader">You are not logged in. Please login to continue.</h3><br />
        	<a class="highlight" href="Login.jsp">Login</a>
    	</div>
            <%
        } 
        else {
        	
            try {
            	String email = (String)session.getAttribute("sessionID");
            	ReservationSummaryBean summary = new ReservationSummaryBean();
            
         		// Create variables for database connection
        		String dbUser = "root";
        		String dbPass = "password";
        		String dbURLandName = "jdbc:mysql://localhost:3306/provisio";
            	Connection con = null;
            	Statement stmt = null;
            	ResultSet rsres = null;
            
            	String [] reservation = new String[15];
                
            	try{
                	Class.forName("com.mysql.cj.jdbc.Driver");
                	String url = dbURLandName + "?";
                    
                	con = DriverManager.getConnection(url + "user=" + dbUser + "&" + "password=" + dbPass);             
                	stmt = con.createStatement();  
                	System.out.println("Connection Successful");
           		}
            	catch(Exception e){
                	System.out.println("Error connecting to the database.");
                	e.printStackTrace();
            	}
            
            	
                rsres = stmt.executeQuery("SELECT* FROM reservation WHERE Email = '" + email + "'"); 
                while (rsres.next()) {
                	reservation[0] = rsres.getString("ReservationId");
                	reservation[1] = rsres.getString("BookingDate");
                	reservation[2] = rsres.getString("ArrivalDate");
                	reservation[3] = rsres.getString("DepartureDate");
                	reservation[4] = rsres.getString("PointsEarned");
                	reservation[5] = rsres.getString("NumberOfGuests");
                	reservation[6] = rsres.getString("SelectedAmenities");
                	reservation[7] = rsres.getString("TotalDays");
                	reservation[8] = rsres.getString("RoomCost");
                	reservation[9] = rsres.getString("AmenitiesCost");
                	reservation[10] = rsres.getString("Taxes");
                	reservation[11] = rsres.getString("TotalCost");
                	reservation[12] = rsres.getString("HotelId");
                	reservation[13] = rsres.getString("Email");
                	reservation[14] = rsres.getString("RoomId");
                	
            
            		int roomId = Integer.parseInt(reservation[14]); 
            		String roomSize = summary.getRoomSize(roomId);
            		int hotelId = Integer.parseInt(reservation[12]); 
            		String destination = summary.getHotelName(hotelId);

                    %>
                    <div width="98%" class="randl">
                    <h1 class="formHeading">Recent Reservation</h1><hr /><br />
                    <table>
                        <tr>
                            <td>Booking Date: </td>
                            <td>
                            <% 
                            out.println(reservation[1]);
                            %>
                            </td>
                        </tr>
                        <tr>
                            <td>Check-In Date: </td>
                            <td>
                            <% 
                            out.print(reservation[2]);
                            %>
                            </td>
                        </tr>
                        <tr>
                            <td>Check-out Date: </td>
                            <td>
                            <% 
                            out.print(reservation[3]);
                            %>
                            </td>
                        </tr>
                        <tr>
                            <td>Destination: </td>
                            <td>
                            <%
                            out.print(destination);
                            %> 
                            </td>
                        </tr>
                        <tr>
                            <td>Room Size: </td>
                            <td>
                            <%
                            out.print(roomSize);
                            %> 
                            </td>
                        </tr>
                        <tr>
                            <td>Points Earned: </td>
                            <td>
                            <%
                            out.print(reservation[4]);
                            %>
                            </td>
                        </tr>
                        <tr>
                            <td>Number of Guests: </td>
                            <td>
                            <%
                            out.print(reservation[5]);
                            %>
                            </td>
                        </tr>
                        <tr>
                            <td>Amenities Requested: </td>
                            <td>
                            <%
                            out.print(reservation[6]);					
                            %>
                            </td>
                        </tr>
                        <tr>
                            <td>Room Cost: </td>
                            <td>
                            <%
                            out.print("$" + reservation[8]);
                            %>				
                            </td>
                        </tr>
                        <tr>
                            <td>Amenities Cost: </td>
                            <td>
                            <%
                            out.print("$" + reservation[9]);
                            %>				
                            </td>
                        </tr>
                        <tr>
                            <td>Taxes (10%): </td>
                            <td>
                            <%
                            out.print("$" + reservation[10]);  
                            %> 
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Total Cost: </strong></td>
                            <td><strong>
                            <%
                            out.print("$" + reservation[11]);
                            %>		
                            </strong></td>
                        </tr>
                    </table>
                </div>
            <%
    		}
        }
    	catch (Exception e) {
    	%>
    	<div class="response">
    	<h3 class="responseHeader">No Reservations Found</h3><br />
    	<a class="highlight" href="Reservation.jsp">Book Reservation</a>
		</div>
		<%
    	}
    }
    %>
    </body>
</html>