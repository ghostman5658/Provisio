package provisio.beans;

import java.util.Date;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.*;


public class ReservationSummaryBean {
	
	// Create variables for database connection
	String dbUser = "root";
	String dbPass = "password";
	String dbURLandName = "jdbc:mysql://localhost:3306/provisio";
	
	public String setCity(String city) {
		String cityLocation = "";
				
		if(city == "Omaha")
		{
			cityLocation = "Omaha";
		}
		else if(city == "Denver")
		{
			cityLocation = "Denver";
		}
		else
		{
			cityLocation = "Los Angeles";
		}
		
		return cityLocation;
	}
	
	// Calculates the days between the two dates. 
	public int dayLength(String checkin, String checkout) throws ParseException {
		String dateIn = checkin;
		String dateOut = checkout;
		
		//give format in which you are receiving the `String date_updated`
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    
		Date inDate = sdf.parse(dateIn);
		Date outDate = sdf.parse(dateOut);
	    //java.sql.Date sqlDate_updated = new java.sql.Date(date.getTime());
	    //ps.setDate(11, sqlDate_updated); 
	    
		// https://beginnersbook.com/2013/04/number-of-days-calculation-between-two-dates/
		long difference = outDate.getTime() - inDate.getTime();
		float daysBetween = (difference / (1000*60*60*24));
		
		// Remove decimal
		// https://www.codegrepper.com/code-examples/typescript/remove+decimal+from+double+java
		int days = (int) daysBetween;
		
		return days;
	}	
	
	public int pointsEarned(int totalDays)  {
		int pointsEarned = 150 * totalDays;
		return pointsEarned;
	}	
	
	// Determines if the user selected an amenities for the hotel.
	public String amenities(String a) {
		String extra = "";
		
		if(a == null){
			extra = "No";
		} else {
			extra = "Yes";
		}
		
		return extra;
	}
	
	public int numbOfGuests(String guests) {
		int numbOfGuests = 0;
		if (guests.equalsIgnoreCase("1")) {
			numbOfGuests = 1;
		}
		else if (guests.equalsIgnoreCase("2")) {
			numbOfGuests = 2;
		}
		else if (guests.equalsIgnoreCase("3")) {
			numbOfGuests = 3;
		}
		else if (guests.equalsIgnoreCase("4")) {
			numbOfGuests = 4;
		}
		else if (guests.equalsIgnoreCase("5")) {
			numbOfGuests = 5;
		}
		return numbOfGuests;
	}
	
	// Determines if the user selected an amenities for the hotel.
	public String selectedAmenities(String wifiSelected, String breakfastSelected, String parkingSelected) {
		String selectedAmenities = ""; 
		if (wifiSelected.equalsIgnoreCase("yes")) {
			selectedAmenities += " wifi ";
		}
		if (breakfastSelected.equalsIgnoreCase("yes")) {
			selectedAmenities += " breakfast ";
		}
		if (parkingSelected.equalsIgnoreCase("yes")) {
			selectedAmenities += " parking ";
		}
		return selectedAmenities;
	}
	
	// Amenities prices will be added if selected by the user
	public double amenitiesPrice(String wifiSelected, String breakfastSelected, String parkingSelected, int totalDays) {
  		
  		// Tries to insert data into the table 
    	Connection con = null;
        Statement stmt = null;
        ResultSet rsWifiCost = null;
        ResultSet rsbreakfastCost = null; 
        ResultSet rsparkingCost = null;  
        
        double amenitiesCost = 0.0;
            
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
		
        
        try {
        	if (wifiSelected.equalsIgnoreCase("yes")) {
        		rsWifiCost = stmt.executeQuery("SELECT Cost FROM amenities WHERE name = 'WI-FI'");
        			while(rsWifiCost.next()) {
        				double wifiCost = rsWifiCost.getDouble("Cost");
        				amenitiesCost = amenitiesCost + wifiCost;
        			}
        	}
        	
        	if (breakfastSelected.equalsIgnoreCase("yes")) {
        		rsbreakfastCost = stmt.executeQuery("SELECT Cost FROM amenities WHERE name = 'Breakfast'");
                	while(rsbreakfastCost.next()) {
                		double breakfastCost = rsbreakfastCost.getDouble("Cost");
                		breakfastCost = breakfastCost * totalDays; 
                		amenitiesCost = amenitiesCost + breakfastCost;
                	}
            }
        	
        	if (parkingSelected.equalsIgnoreCase("yes")) {
        		rsparkingCost = stmt.executeQuery("SELECT Cost FROM amenities WHERE name = 'Parking'");
                	while(rsparkingCost.next()) {
                		double parkingCost = rsparkingCost.getDouble("Cost");
                		parkingCost = parkingCost * totalDays; 
                		amenitiesCost = amenitiesCost + parkingCost;
                	}
            }
        }
        catch(SQLException e){
			System.out.println("Error retrieving data");
			e.printStackTrace();
		}
		finally {
			try {
				stmt.close();
				con.close();
			}
			catch(SQLException e){
				System.out.println("Connection close failed");
				e.printStackTrace();
			}
		}
        amenitiesCost = round(amenitiesCost, 2);
		return amenitiesCost;
	}
	
	public double round(double value, int places) {
	    
	    BigDecimal bd = new BigDecimal(value).setScale(places, RoundingMode.HALF_UP);
	    double val2 = bd.doubleValue();
	    
	    return val2;
	}

	// Finds the selected room and returns the cost of the room
	public double getRoomPrice(String city, String roomName, int totalDays) throws SQLException {
  		
    	Connection con = null;
        Statement stmt = null;
        
        ResultSet rsCity = null;
        ResultSet rsRoom = null;
        
        int cityId = 0;
        double roomCost = 0.0;  
            
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
        
        try {
        	// Finds the city hotel ID so that the room and room price can be determined
        	rsCity = stmt.executeQuery("SELECT HotelId FROM hotel WHERE City = '" + city + "'");
        	while(rsCity.next()) {
        		cityId = rsCity.getInt("HotelId");
        	}
        	
        	// Finds the price of the room according to the city hotel ID
        	rsRoom = stmt.executeQuery("SELECT BasePrice FROM room WHERE Name = '" + roomName + "' AND HotelID = '" + cityId + "'");
        	while(rsRoom.next()) {
        		roomCost = rsRoom.getDouble("BasePrice");
        		roomCost = roomCost * totalDays;
        	}
        }
        catch(SQLException e){
			System.out.println("Error retrieving data");
			e.printStackTrace();
		}
		finally {
			try{
				rsCity.close();
				rsRoom.close();
				stmt.close();
				con.close();
			}
			catch(SQLException e){
				System.out.println("Connection close failed");
				e.printStackTrace();
			}
		}
        roomCost = round(roomCost, 2);
		return roomCost;
	}
	
	public double getTax(double amenities, double room) {
		double price = amenities + room;
		double tax = price * .1;
		tax = round(tax, 2);
		return tax;
	}
	
	public double addFivePercent(double price) {
		double addedPrice = price * .05;
		double newPrice = addedPrice + price;
		double returnPrice = round(newPrice, 2);
		return returnPrice;
	}
	
	public double getGrandTotal(double amenities, double room, double tax) {
		double grandTotal = amenities + room + tax;
		double val2 = round(grandTotal, 2);
		return val2;
	}
	
	public int getHotelId(String city) throws SQLException {
			
	    Connection con = null;
	    Statement stmt = null;
	        
	    ResultSet rsCity = null;
	        
	    int cityId = 0;
	            
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
	        
	    try {
	    	// Finds the city hotel ID so that the room and room price can be determined
	        rsCity = stmt.executeQuery("SELECT HotelId FROM hotel WHERE City = '" + city + "'");
	        while(rsCity.next()) {
	        	cityId = rsCity.getInt("HotelId");
	        }
	    }
	    catch(SQLException e){
	    	System.out.println("Error retrieving data");
			e.printStackTrace();
		}
		finally {
			try{
				rsCity.close();
				stmt.close();
				con.close();
			}
			catch(SQLException e){
				System.out.println("Connection close failed");
				e.printStackTrace();
			}
		}
		return cityId;
	}
	
	public String getHotelName(int hotelId) {

		Connection con = null;
		Statement stmt = null;
						        
		ResultSet rs = null;
						        
		String hotelName = "";
						            
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
						        
		try {
			rs = stmt.executeQuery("SELECT City FROM hotel WHERE HotelId = '" + hotelId + "'");
			while(rs.next()) {
				hotelName = rs.getString("City");
			}
		}
		catch(SQLException e){
			System.out.println("Error retrieving city name");
			e.printStackTrace();
		}
		finally {
			try{
				rs.close();
				stmt.close();
				con.close();
			}
			catch(SQLException e){
				System.out.println("Connection close failed");
				e.printStackTrace();
			}
		}
		return hotelName;
	}
	
	public int getroomId(int hotelId, String roomName) throws SQLException {
		  		
		// Tries to insert data into the table 
		Connection con = null;
		Statement stmt = null;
		        
		ResultSet rsRoom = null;
		        
		int roomId = 0;
		            
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
		        
		try {
			rsRoom = stmt.executeQuery("SELECT RoomId FROM room WHERE Name = '" + roomName + "' AND HotelID = '" + hotelId + "'");
		    while(rsRoom.next()) {
		    	roomId = rsRoom.getInt("RoomId");
		    }
		}
		catch(SQLException e){
		    System.out.println("Error retrieving data");
			e.printStackTrace();
		}
		finally {
			try{
				rsRoom.close();
				stmt.close();
				con.close();
			}
			catch(SQLException e){
				System.out.println("Connection close failed");
				e.printStackTrace();
			}
		}
		return roomId;
	}
	
	public String getRoomSize(int roomId) {

		Connection con = null;
		Statement stmt = null;		        
		ResultSet rs = null;			        
		String roomSize = "";
				            
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
				        
		try {
			rs = stmt.executeQuery("SELECT Name FROM room WHERE RoomId = '" + roomId + "'");
			while(rs.next()) {
				roomSize = rs.getString("Name");
			}
		}
		catch(SQLException e){
			System.out.println("Error retrieving data");
			e.printStackTrace();
		}
		finally {
			try{
				rs.close();
				stmt.close();
				con.close();
			}
			catch(SQLException e){
				System.out.println("Connection close failed");
				e.printStackTrace();
			}
		}
		return roomSize;
	}

	public void setReservation(String bookDate, String arrive, String depart, int points, int guest, String amenities, int totalDays, double roomCost, double amenitiesCost, double taxes, double totalCost, int hotelId, String email, int roomId) {
		
    	Connection con = null;
        Statement stmt = null;
            
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
        
        try{
            stmt.execute("INSERT INTO reservation(BookingDate, ArrivalDate, DepartureDate, PointsEarned, NumberOfGuests, SelectedAmenities, TotalDays, RoomCost, AmenitiesCost, Taxes, TotalCost, HotelId, Email, RoomId) VALUES ('"+ bookDate + "', '" + arrive + "', '" + depart + "', '" + points + "', '" + guest + "', '" + amenities + "', '" + totalDays + "', '" + roomCost + "', '" + amenitiesCost + "', '" + taxes + "', '"   + totalCost + "', '" + hotelId + "', '" + email + "', '" + roomId + "')"); 
            System.out.println();
        }
        catch(SQLException e){
            System.out.println("Error inserting data");
            e.printStackTrace();
            
        }
        
        try{
            stmt.close();
            con.close();
        }
        catch(SQLException e){
            System.out.println("Connection close failed");
            e.printStackTrace();
        }
	}
	
	public String[] getReservation(String email) {
		
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
        
        try{
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
            }
            System.out.println();
        }
        catch(SQLException e){
            System.out.println("Error retrieving data");
            e.printStackTrace();
            
        }
        
        try{
        	rsres.close();
            stmt.close();
            con.close();
        }
        catch(SQLException e){
            System.out.println("Connection close failed");
            e.printStackTrace();
        }
		
		return reservation;
	}
	
	public void setLoyaltyPoints(int points, String email) { 
		
    	Connection con = null;
        Statement stmt = null;
        ResultSet rs = null; 
        int currentLoyaltyPoints = 0;
            
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
        
        try{
        	rs = stmt.executeQuery("SELECT LoyaltyPoints FROM user WHERE Email = '" + email + "'");
		    while(rs.next()) {
		    	currentLoyaltyPoints = rs.getInt("LoyaltyPoints");
		    }
		    int newLoyaltypoints = currentLoyaltyPoints + points;
            stmt.execute("UPDATE user SET LoyaltyPoints = '" + newLoyaltypoints + "' WHERE Email = '" + email + "'"); 
            System.out.println();  
        }
        catch(SQLException e){
            System.out.println("Error inserting data");
            e.printStackTrace();
            
        }
        
        try{
        	rs.close();
            stmt.close();
            con.close();
        }
        catch(SQLException e){
            System.out.println("Connection close failed");
            e.printStackTrace();
        }
	}
	
	public int getLoyaltyPoints(String email) {
		Connection con = null;
		Statement stmt = null;		        
		ResultSet rs = null;			        
		int lp = 0;  
				            
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
				        
		try {
			rs = stmt.executeQuery("SELECT LoyaltyPoints FROM user WHERE Email = '" + email + "'");
			while(rs.next()) {
				lp = rs.getInt("LoyaltyPoints");
			}
		}
		catch(SQLException e){
			System.out.println("Error retrieving data");
			e.printStackTrace();
		}
		finally {
			try{
				rs.close();
				stmt.close();
				con.close();
			}
			catch(SQLException e){
				System.out.println("Connection close failed");
				e.printStackTrace();
			}
		}
		return lp;
	}
	
	
	public int getExcursionPoints(String excursion) {
		int excursionPoints = 0;
		if (excursion.equalsIgnoreCase("ameritradePark") || excursion.equalsIgnoreCase("rockyMountain") || excursion.equalsIgnoreCase("universalStudios")) {
			excursionPoints = 400;
		}
		else if (excursion.equalsIgnoreCase("henryZoo") || excursion.equalsIgnoreCase("denverBotanic") || excursion.equalsIgnoreCase("santaMonica")) {
			excursionPoints = 300;
		}
		else if (excursion.equalsIgnoreCase("memorialStadium") || excursion.equalsIgnoreCase("coorsField") || excursion.equalsIgnoreCase("gettyCenter")) {
			excursionPoints = 750;
		}
		return excursionPoints;
	}
	
	public String getExcursionName(String excursion) {
		String excursionName = "";
		if (excursion.equalsIgnoreCase("ameritradePark")) {
			excursionName = "TD Ameritrade Park";
		}
		else if (excursion.equalsIgnoreCase("rockyMountain")) {
			excursionName = "Rocky Mountain National Park";
		}
		else if (excursion.equalsIgnoreCase("universalStudios")) {
			excursionName = "Universal Studios";
		}
		else if (excursion.equalsIgnoreCase("henryZoo")) {
			excursionName = "Henry Doorly Zoo";
		}
		else if (excursion.equalsIgnoreCase("denverBotanic")) {
			excursionName = "Denver Botanic Gardens";
		}
		else if(excursion.equalsIgnoreCase("santaMonica"))  {
			excursionName = "Santa Monica Pier";
		}
		else if (excursion.equalsIgnoreCase("memorialStadium")) {
			excursionName = "Memorial Stadium";
		}
		else if (excursion.equalsIgnoreCase("coorsField")) {
			excursionName = "Coors Field";
		}
		else if (excursion.equalsIgnoreCase("gettyCenter")) {
			excursionName = "The Getty Center";
		}
		
		return excursionName;
	}
	
	public int getReservationId(int hotelId, String email, int roomId) throws SQLException {
		
		Connection con = null;
		Statement stmt = null;
		        
		ResultSet rs = null;
		        
		int reservationId = 0; 
		            
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
		        
		try {
			rs = stmt.executeQuery("SELECT ReservationId FROM reservation WHERE HotelId = '" + hotelId + "' AND Email = '" + email + "' AND RoomId = '" + roomId + "'");
		    while(rs.next()) {
		    	reservationId = rs.getInt("ReservationId");
		    }
		}
		catch(SQLException e){
		    System.out.println("Error retrieving data");
			e.printStackTrace();
		}
		finally {
			try{
				rs.close();
				stmt.close();
				con.close();
			}
			catch(SQLException e){
				System.out.println("Connection close failed");
				e.printStackTrace();
			}
		}
		return reservationId;
	}
}
