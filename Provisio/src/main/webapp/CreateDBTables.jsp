<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.io.*" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>

<html>
<head>
	<title>Create DB Tables</title>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html">
</head>
<body>
	<a href="setup.html">Setup</a>
	<h1>Create DB Tables</h1>

	<%
	
		//used init param from XML file
		String dbName = application.getInitParameter("dbName");
		String dbUser = application.getInitParameter("dbUser");
		String dbPass = application.getInitParameter("dbPass");
		String dbURL = application.getInitParameter("dbURL");
		String dbURLandName = application.getInitParameter("dbURLandName");
			
     		
        // Tries to create the table if it does not exist
        Connection con = null;
        Statement stmt = null;
            
        try{
        	Class.forName("com.mysql.cj.jdbc.Driver");
            String url = dbURLandName + "?";
                
            con = DriverManager.getConnection(url + "user=" + dbUser + "&" + "password=" + dbPass);                 
            stmt = con.createStatement();
        }
        catch(Exception e){
            out.println("<h1>Error connecting to database.</h1>");
        }
            
        try{
            stmt.executeUpdate("DROP TABLE amenities");
            out.println("<b>Table amenities Dropped</b><br />");
            
        }
        catch(SQLException e){                
            out.println("<b>Table amenities does not exist</b><br />");
        }
            
        try{
            String query = "CREATE TABLE amenities(AmenitiesId int NOT NULL, Name varchar(15) NOT NULL, " +
                    "Cost double NOT NULL, ChargeFrequency varchar(15) NOT NULL, PRIMARY KEY (AmenitiesId));";
            	
            stmt.executeUpdate(query);
            out.println("<b>Table amenities Created</b><br />");
        }
        catch(SQLException e){
            out.println("<b>Table amenities Creation failed</b><br />");
        }
        
        try{                
            stmt.executeUpdate("DROP TABLE hotel");
            out.println("<b>Table hotel Dropped</b><br />");
        }
        catch(SQLException e){                
            out.println("<b>Table hotel does not exist</b><br />");
        }
        
        try{
            String query = "CREATE TABLE hotel(HotelId int NOT NULL, HotelName varchar(30) NOT NULL, Address varchar(30) NOT NULL, PostCode int NOT NULL, " +
       				 "City varchar(15) NOT NULL, Country varchar(15) NOT NULL, NumberOfRooms int NOT NULL, PhoneNumber varchar(12) NOT NULL, " + 
            			"Attraction1 varchar(50) NOT NULL, Attraction2 varchar(50) NOT NULL, Attraction3 varchar(50) NOT NULL, " +
       				 		"PRIMARY KEY (HotelId));";
            	
            stmt.executeUpdate(query);
            out.println("<b>Table hotel Created</b><br />");
        }
        catch(SQLException e){
            out.println("<b>Table hotel Creation failed</b><br />");
        }
        
        try{                
            stmt.executeUpdate("DROP TABLE room");
            out.println("<b>Table room Dropped</b><br />");
        }
        catch(SQLException e){                
            out.println("<b>Table room does not exist</b><br />");
        }
         
        try{
            String query1 = "CREATE TABLE room(RoomId int NOT NULL, Name varchar(30) NOT NULL, Size varchar(25) NOT NULL, " +
       				 "BasePrice double NOT NULL, Points int NOT NULL, HotelId int NOT NULL, PRIMARY KEY (RoomId), FOREIGN KEY (HotelId) REFERENCES hotel (HotelId));"; 
            	
            stmt.executeUpdate(query1);
            out.println("<b>Table room Created</b><br />");
        }
        catch(SQLException e){
            out.println("<b>Table room Creation failed</b><br />");
        }
        
        try{                
            stmt.executeUpdate("DROP TABLE user");
            out.println("<b>Table user Dropped</b><br />");
        }
        catch(SQLException e){                
            out.println("<b>Table user does not exist</b><br />");
        }
            
        try{
            String query = "CREATE TABLE user(Email varchar(30) NOT NULL, Password varchar(30) NOT NULL, " + 
                    "FirstName varchar(30) NOT NULL, LastName varchar(30) NOT NULL, LoyaltyPoints int NOT NULL, PRIMARY KEY (Email));";
            	
            stmt.executeUpdate(query);
            out.println("<b>Table user Created</b><br />");
        }
        catch(SQLException e){
            out.println("<b>Table user Creation failed</b><br />");
        }
            
        try{                
            stmt.executeUpdate("DROP TABLE reservation");
            out.println("<b>Table reservation Dropped</b><br />");
        }
        catch(SQLException e){                
            out.println("<b>Table reservation does not exist</b><br />");
        }
            
        try{
            String query = "CREATE TABLE reservation(ReservationId int NOT NULL AUTO_INCREMENT, BookingDate varchar(15) NOT NULL, " +
                    "ArrivalDate varchar(12) NOT NULL, DepartureDate varchar(12) NOT NULL, PointsEarned int NOT NULL, NumberOfGuests int NOT NULL, SelectedAmenities varchar(45), Cost double NOT NULL, HotelId int NOT NULL, Email varchar(30) NOT NULL, RoomId int NOT NULL, PRIMARY KEY (ReservationId), " +
                    "FOREIGN KEY (HotelId) REFERENCES hotel (HotelId), " + 
                    "FOREIGN KEY (Email) REFERENCES user (Email), " + 
                    "FOREIGN KEY (RoomId) REFERENCES room (RoomId));";  
            	
            stmt.executeUpdate(query);
            out.println("<b>Table reservation Created</b><br />");
        }
        catch(SQLException e){
            out.println("<b>Table reservation Creation failed</b><br />");
        }

        try{
            stmt.close();
            con.close(); 
            out.println("<b>Database connections closed</b><br />");
        }
        catch(SQLException e){
            out.println("<b>Connection close failed</b><br />");
        }
        
        
    %>    
</body>
</html>