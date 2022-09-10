package provisio.beans;

import java.sql.Connection;

import java.util.Date;
import java.text.SimpleDateFormat;

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
	
	public Date dayLength(Date checkin, Date checkout) {
		Date totalDays = null;
		
		
		
		return totalDays;
	}
	
	public double roomPrice(String roomName) {
		double totalCost = 0;
		double roomCost = 0;
		
		if(roomName == "Two Twin Beds"){
			totalCost= roomCost + 110.00;
		}
		else if(roomName == "One Queen Bed"){
			totalCost= roomCost + 125.00;
		}
		else if(roomName == "Two Queen Beds"){
			totalCost= roomCost + 150.00;
		}
		else {
			totalCost= roomCost + 165.00;
		}
		
		return totalCost;
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