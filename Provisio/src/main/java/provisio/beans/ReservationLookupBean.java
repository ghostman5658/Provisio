package provisio.beans;

import java.sql.*;
import java.util.*;

public class ReservationLookupBean {

    public static ArrayList<ReservationBean> getReservation(String email, int ReservationId) throws SQLException {
		
		String dbUser = "root";
		String dbPass = "password";
		String dbURLandName = "jdbc:mysql://localhost:3306/provisio";
		  		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
        String query = "SELECT * FROM reservation WHERE Email = '" + email + "' AND ReservationId = '" + ReservationId + "'";

        ArrayList<ReservationBean> reservationList = new ArrayList<>();

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
			rs = stmt.executeQuery(query);

            while (rs.next()) {
                ReservationBean reservation = new ReservationBean(rs.getString("ReservationId"), rs.getString("BookingDate"), rs.getString("ArrivalDate"), rs.getString("DepartureDate"), rs.getString("PointsEarned"), rs.getString("NumberOfGuests"), rs.getString("SelectedAmenities"), rs.getString("Cost"), rs.getString("HotelId"), rs.getString("Email"), rs.getString("RoomId"));
                reservationList.add(reservation);
            }
            return reservationList;
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
        return reservationList;
    }
}