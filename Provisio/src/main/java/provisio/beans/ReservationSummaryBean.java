package provisio.beans;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.*;

public class ReservationSummaryBean {
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
	
	// Determines if the user selected an amenities for the hotel.
	public String Amenities(String a) {
		String extra = "";
		
		if(a == null){
			extra = "No";
		} else {
			extra = "Yes";
		}
		
		return extra;
	}
	
	// Amenities prices will be added if selected by the user
	public double amenitiesPrice(String wifi, String breakfast, String parking) {
		
		// Create variables for database connection
  		String dbUser = "root";
  		String dbPass = "password";
  		String dbURLandName = "jdbc:mysql://localhost:3306/provisio";
  		
  		// Tries to insert data into the table 
    	Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
            
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
		
		double amenitiesCost = 0.0;
		
		if(wifi == null) {
			// Add the price to amenitiesCost
		}
		
		if(breakfast == null) {
			// Add the price to amenitiesCost
		}
		
		if(parking == null) {
			// Add the price to amenitiesCost
		}
		
		return amenitiesCost;
	}
	
	// Finds the selected room and returns the cost of the room
	public double roomPrice(String city, String roomName) throws SQLException {
		
		// Create variables for database connection
  		String dbUser = "root";
  		String dbPass = "password";
  		String dbURLandName = "jdbc:mysql://localhost:3306/provisio";
  		
  		// Tries to insert data into the table 
    	Connection con = null;
        Statement stmt = null;
        
        ResultSet rsCity = null;
        ResultSet rsRoom = null;
        
        int cityId = 0;
        int cityName = 0;
        String roomCost = "";
        Double totalCost = 0.0;
            
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
        
        //Attempt to retrieve user data from the table
        try {
        	// Finds the city hotel ID so that the room and room price can be determined
        	rsCity = stmt.executeQuery("SELECT HotelId FROM provisio.hotel WHERE City = '" + city + "'");
        	while(rsCity.next()) {
        		cityId = rsCity.getInt("HotelId");
        	}
        	
        	// Finds the price of the room according to the city hotel ID
        	rsRoom = stmt.executeQuery("SELECT BasePrice FROM provisio.room WHERE Name = '" + roomName + "' AND '" + cityId + "'");
//        	rs = stmt.executeQuery("select * from provisio.room");
            
        	roomCost = rsRoom.getString("BasePrice");
//            roomCost = rs.getString(roomName);
//        	totalCost = rs.getDouble("BasePrice");
            
            totalCost = Double.parseDouble(roomCost);
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
  		
//		double totalCost = 0;
//		String nameRoom = "";
//		nameRoom = roomName.toString();
//		
//		if(nameRoom == "Two Twin Beds"){
//			totalCost += 110.00;
//		}
//		else if(nameRoom == "One Queen Bed"){
//			totalCost += 125.00;
//		}
//		else if(nameRoom == "Two Queen Beds"){
//			totalCost += 150.00;
//		}
//		else {
//			totalCost += 165.00;
//		}
		
		return totalCost;
	}
	
	public void setReservation(Date bookDate, Date arrive, Date depart, int points, int guest) {
		// Create variables for database connection
  		String dbUser = "root";
  		String dbPass = "password";
  		String dbURLandName = "jdbc:mysql://localhost:3306/provisio";
  		
  		// Tries to insert data into the table 
    	Connection con = null;
        Statement stmt = null;
        
        // FK for the tables of "reservation"
        int hotel = 0;
        String email = "";
        int room = 0;
            
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
        
      //Attempt to insert user data into "reservation" table
        try{
            stmt.execute("INSERT INTO reservation(BookingDate, ArrivalDate, DepartureDate, PointsEarned, NumberOfGuests, HotelId, Email, RoomId) VALUES ('"+ bookDate + "', '" + arrive + "', '" + depart + "', '" + points + "', '" + guest + "', '" + hotel + "', '" + email + "', '" + room + "')"); 
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
}

// ****Archive Code****
//if(city == "Omaha") {
//cityLocation = "Omaha";
//} else if(city == "Denver") {
//cityLocation = "Denver";
//} else if(city == "LosAngeles") {
//cityLocation = "Los Angeles";
//}

//if(room.toString() == "Queen") {
//out.print("One Queen Bed");
//} else if(room.toString() == "Double") {
//out.print("Two Twin Beds");
//} else if(room.toString() == "King") {
//out.print("One King Bed");
//} else {
//out.print("Two Queen Beds");
//}