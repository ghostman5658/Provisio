<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.io.*" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>

<html>
<head>
	<title>Create DB Table</title>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html">
</head>
<body>
	<a href="/setup.html">Setup</a>
	<h1>Create EXP Table</h1>
	
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
            out.println("<h1>Error connection to database.</h1>");
        }
            
        try{                
            stmt.executeUpdate("DROP TABLE amenities");
            out.println("<b>Table amenities Dropped</b><br />");
        }
        catch(SQLException e){                
            out.println("<b>Table amenities does not exist</b><br />");
        }
            
        try{
            String query = "CREATE TABLE amenities(amenities_id not null int, name not null varchar(15), " +
                    "cost not null double, chargeFrequency not null varchar(15), room_id not null int, primary key(amenities_id), foreign key (room_id));";
            	
            stmt.executeUpdate(query);
            out.println("<b>Table amenities Created</b><br />");
        }
        catch(SQLException e){
            out.println("<b>Table amenities Creation failed</b><br />");
        }
            
        try{                
            stmt.executeUpdate("DROP TABLE reservation");
            out.println("<b>Table reservation Dropped</b><br />");
        }
        catch(SQLException e){                
            out.println("<b>Table reservation does not exist</b><br />");
        }
        
        try{
            String query = "CREATE TABLE room(RoomId int NOT NULL, Name NOT NULL varchar(30), Size int NOT NULL, NumberOfGuests int NOT NULL," +
       				 "BasePrice double NOT NULL, PRIMARY KEY (RoomId), foreign key (HotelId));";
            	
            stmt.executeUpdate(query);
            out.println("<b>Table room Created</b><br />");
        }
        catch(SQLException e){
            out.println("<b>Table room Creation failed</b><br />");
        }
            
        try{                
            stmt.executeUpdate("DROP TABLE reservation");
            out.println("<b>Table room Dropped</b><br />");
        }
        catch(SQLException e){                
            out.println("<b>Table room does not exist</b><br />");
        }
        
        try{
            String query = "CREATE TABLE hotel(HotelId int NOT NULL, HotelName NOT NULL varchar(30), Address NOT NULL varchar(30), PostCode int NOT NULL," +
       				 "City NOT NULL varchar(15), Country NOT NULL varchar(15), NumberOfRooms int NOT NULL, PhoneNumber NOT int NULL," + 
            			"Attraction1 NOT NULL varchar(50), Attraction2 NOT NULL varchar(50), Attraction3 NOT NULL varchar(50)," +
       				 		"PRIMARY KEY (HotelId), foreign key (ReservationId));";
            	
            stmt.executeUpdate(query);
            out.println("<b>Table hotel Created</b><br />");
        }
        catch(SQLException e){
            out.println("<b>Table hotel Creation failed</b><br />");
        }
            
        try{                
            stmt.executeUpdate("DROP TABLE reservation");
            out.println("<b>Table hotel Dropped</b><br />");
        }
        catch(SQLException e){                
            out.println("<b>Table hotel does not exist</b><br />");
        }
            
        try{
            String query = "CREATE TABLE reservation(ReservationId int NOT NULL AUTO_INCREMENT, BookingDate date NOT NULL, " +
                    "ArrivalDate date NOT NULL, DepartureDate date NOT NULL, PointsEarned int NOT NULL, Email varchar(30) NOT NULL, PRIMARY KEY (ReservationId), FOREIGN KEY (HotelId), FOREIGN KEY (Email), FOREIGN KEY (RoomId));";
            	
            stmt.executeUpdate(query);
            out.println("<b>Table reservation Created</b><br />");
        }
        catch(SQLException e){
            out.println("<b>Table reservation Creation failed</b><br />");
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