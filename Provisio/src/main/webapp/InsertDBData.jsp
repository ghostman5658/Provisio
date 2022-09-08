<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.io.*" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>Insert Records</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html">
</head>
<body>
	<a href="setup.html">Setup</a>
	<hr>
    <h1>Insert Records</h1>
        
    <%
    
  		//used init param from XML file
  		String dbName = application.getInitParameter("dbName");
  		String dbUser = application.getInitParameter("dbUser");
  		String dbPass = application.getInitParameter("dbPass");
  		String dbURL = application.getInitParameter("dbURL");
  		String dbURLandName = application.getInitParameter("dbURLandName");
  		
 		
    	// Tries to insert data into the table 
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
        
        //Attempt to populate amenities table with data
        try{
            stmt.executeUpdate("INSERT INTO amenities(AmenitiesId, Name, Cost, ChargeFrequency) VALUES (1, 'WI-FI', 12.99, 'flat')"); 
            stmt.executeUpdate("INSERT INTO amenities(AmenitiesId, Name, Cost, ChargeFrequency) VALUES (2, 'Breakfast', 8.99, 'daily')"); 
            stmt.executeUpdate("INSERT INTO amenities(AmenitiesId, Name, Cost, ChargeFrequency) VALUES (3, 'Parking', 19.99, 'daily')"); 

            out.println("<b>Amenities Data Inserted</b><br />");
        }
        catch(SQLException e){
            out.println("<b>Error inserting amenities data</b><br />");
        }
        
      //Attempt to populate hotel table with data
        try{
            stmt.executeUpdate("INSERT INTO hotel(HotelId, HotelName, Address, PostCode, City, Country, NumberOfRooms, PhoneNumber, Attraction1, Attraction2, Attraction3) VALUES (1, 'Hotel One', '123 1st St', 68135, 'Omaha', 'United States', 1, '402-555-5555', 'Henry Doorly Zoo', 'College World Series', 'Nebraska Football Game')"); 
            stmt.executeUpdate("INSERT INTO hotel(HotelId, HotelName, Address, PostCode, City, Country, NumberOfRooms, PhoneNumber, Attraction1, Attraction2, Attraction3) VALUES (2, 'Hotel Two', '456 2nd St', 80014, 'Denver', 'United States', 1, '720-555-5555', 'Rocky Mountain National Park', 'Denver Botanic Gardens', 'Coors Field')"); 
            stmt.executeUpdate("INSERT INTO hotel(HotelId, HotelName, Address, PostCode, City, Country, NumberOfRooms, PhoneNumber, Attraction1, Attraction2, Attraction3) VALUES (3, 'Hotel Three', '789 3rd St', 90001, 'Los Angeles', 'United States', 1, '310-555-5555', 'The Getty Center ', 'Santa Monica Pier and Beach', 'Universal Studios Hollywood')"); 

            out.println("<b>Hotel Data Inserted</b><br />");
        }
        catch(SQLException e){
            out.println("<b>Error inserting hotel data</b><br />");
        }
        
      	//Attempt to populate room table with data
        //try{
            stmt.executeUpdate("INSERT INTO room(RoomId, Name, Size, BasePrice, Points, HotelId) VALUES (1, 'Queen Room', 'queen', 125.00, 150, 1)"); 
            stmt.executeUpdate("INSERT INTO room(RoomId, Name, Size, BasePrice, Points, HotelId) VALUES (2, 'Double Room', 'double full', 110.00, 150, 1)"); 
            stmt.executeUpdate("INSERT INTO room(RoomId, Name, Size, BasePrice, Points, HotelId) VALUES (3, 'King Room', 'king', 165.00, 150, 1)"); 
            stmt.executeUpdate("INSERT INTO room(RoomId, Name, Size, BasePrice, Points, HotelId) VALUES (4, 'Double Queen Room', 'double queen', 150.00, 150, 1)");
            
            stmt.executeUpdate("INSERT INTO room(RoomId, Name, Size, BasePrice, Points, HotelId) VALUES (5, 'Queen Room', 'queen', 125.00, 150, 2)"); 
            stmt.executeUpdate("INSERT INTO room(RoomId, Name, Size, BasePrice, Points, HotelId) VALUES (6, 'Double Room', 'double full', 110.00, 150, 2)"); 
            stmt.executeUpdate("INSERT INTO room(RoomId, Name, Size, BasePrice, Points, HotelId) VALUES (7, 'King Room', 'king', 165.00, 150, 2)"); 
            stmt.executeUpdate("INSERT INTO room(RoomId, Name, Size, BasePrice, Points, HotelId) VALUES (8, 'Double Queen Room', 'double queen', 150.00, 150, 2)"); 
            
            stmt.executeUpdate("INSERT INTO room(RoomId, Name, Size, BasePrice, Points, HotelId) VALUES (9, 'Queen Room', 'queen', 125.00, 150, 3)"); 
            stmt.executeUpdate("INSERT INTO room(RoomId, Name, Size, BasePrice, Points, HotelId) VALUES (10, 'Double Room', 'double full', 110.00, 150, 3)"); 
            stmt.executeUpdate("INSERT INTO room(RoomId, Name, Size, BasePrice, Points, HotelId) VALUES (11, 'King Room', 'king', 165.00, 150, 3)"); 
            stmt.executeUpdate("INSERT INTO room(RoomId, Name, Size, BasePrice, Points, HotelId) VALUES (12, 'Double Queen Room', 'double queen', 150.00, 150, 3)"); 

            out.println("<b>Room Data Inserted</b><br />");
        //}
        //catch(SQLException e){
            //out.println("<b>Error inserting room data</b><br />");
        //}
        
      	//Attempt to populate user table with data
        try{
            stmt.executeUpdate("INSERT INTO user(Email, Password, FirstName, LastName, LoyaltyPoints) VALUES ('JohnnyW01@example.com', 'Johnny1', 'Johnny', 'Wanderer', 0)"); 
            stmt.executeUpdate("INSERT INTO user(Email, Password, FirstName, LastName, LoyaltyPoints) VALUES ('JamieS87@example.com', 'Jamie1', 'Jamie', 'Smith', 0)");
            stmt.executeUpdate("INSERT INTO user(Email, Password, FirstName, LastName, LoyaltyPoints) VALUES ('AdaW93@example.com', 'Ada1', 'Ada', 'Wilson', 0)"); 


            out.println("<b>User Data Inserted</b><br />");
        }
        catch(SQLException e){
            out.println("<b>Error inserting user data</b><br />");
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