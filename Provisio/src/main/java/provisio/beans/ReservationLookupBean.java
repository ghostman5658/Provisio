package provisio.beans;

import java.sql.*;
import java.util.*;

public class ReservationLookupBean {

    public static ArrayList<Reservation> getReservation(String email, int ReservationId) throws SQLException {
		
		String dbUser = "root";
		String dbPass = "password";
		String dbURLandName = "jdbc:mysql://localhost:3306/provisio";
		  		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
        String query = "SELECT * FROM reservation WHERE Email = " + email + "' AND ReservationId = '" + ReservationId + "'";

        ArrayList<Reservation> reservationList = new ArrayList<>();

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
                Reservation reservation = new Reservation(rs.getString("ReservationId"), rs.getString("BookingDate"), rs.getString("ArrivalDate"), rs.getString("DepartureDate"), rs.getString("PointsEarned"), rs.getString("NumberOfGuests"), rs.getString("SelectedAmenities"), rs.getString("Cost"), rs.getString("HotelId"), rs.getString("Email"), rs.getString("RoomId"));
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
    
    public class Reservation {
        private String ReservationId;
        private String BookingDate;
        private String ArrivalDate;
        private String DepartureDate;
        private String PointsEarned;
        private String NumberOfGuests;
        private String SelectedAmenities;
        private String Cost;
        private String HotelId;
        private String Email;
        private String RoomId;
    
        public String getReservationId() {
            return ReservationId;
        }
        public void setReservationId(String ReservationId) {
            this.ReservationId = ReservationId;
        }
    
        public String getBookingDate() {
            return BookingDate;
        }
        public void setBookingDate(String BookingDate) {
            this.BookingDate = BookingDate;
        }
    
        public String getArrivalDate() {
            return ArrivalDate;
        }
        public void setArrivalDate(String ArrivalDate) {
            this.ArrivalDate = ArrivalDate;
        }
        
        public String getDepartureDate() {
            return DepartureDate;
        }
        public void setDepartureDate(String DepartureDate) {
            this.DepartureDate = DepartureDate;
        }
    
        public String getPointsEarned() {
            return PointsEarned;
        }
        public void setPointEarned(String PointsEarned) {
            this.PointsEarned = PointsEarned;
        }
    
        public String getNumberOfGuests() {
            return NumberOfGuests;
        }
        public void setNumberOfGuests(String NumberOfGuests) {
            this.NumberOfGuests = NumberOfGuests;
        }
    
        public String getSelectedAmenities() {
            return SelectedAmenities;
        }
        public void set(String SelectedAmenities) {
            this.SelectedAmenities = SelectedAmenities;
        }
    
        public String getCost() {
            return Cost;
        }
        public void setCost(String Cost) {
            this.Cost = Cost;
        }
    
        public String getHotelId() {
            return HotelId;
        }
        public void setHotelId(String HotelId) {
            this.HotelId = HotelId;
        }
        public String getEmail() {
            return Email;
        }
        public void setEmail(String Email) {
            this.Email = Email;
        }
    
        public String getRoomId() {
            return RoomId;
        }
        public void setRoomId(String RoomId) {
            this.RoomId = RoomId;
        }
    }
}