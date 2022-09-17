package provisio.beans;

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