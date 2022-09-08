<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Register</title>
    	<link href="provisio.css" type="text/css" rel="stylesheet"/>
    	<meta charset="UTF-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<meta http-equiv="Content-Type" content="text/html">
        <div class="navbar">
        	<img src="logo.png" class="navimg">
       		<div class="navtext">Provisio</div>
            <a class="navbarButton" href="index.html">Home</a>
            <a class="navbarButton" href="AboutUs.jsp">About Us</a>
            <a class="navbarButton" href="Locations.jsp">Locations</a>
            <a class="navbarButton" href="Registration.jsp">Register</a>
            <a class="navbarButton" href="Login.jsp">Login</a>
            <a class="navbarButtonActive" href="Reservation.jsp">Reservations</a>
            <a class="navbarButton" href="LookUp.jsp">Look Up</a>
            <a class="navbarButton" href="LoyaltyPoints.jsp">Loyalty Points</a>
            <a class="navbarButtonLogOut" href="LogOut.jsp">Log Out</a>
        </div>
	</head>
	<body>
		<div width="98%">
            <form class="Reservation" method='post' action='ReservationConfirm.jsp'>   
                <h1 class="formHeading">Reservation Options</h1> <hr /><br />
                    <fieldset>
                        <legend>Reservation Details</legend>
                        <div class="boxes">
                            <p>
                                <label>Destination<br />
                                    <select name="City">
                                        <option value="Omaha">Omaha</option>
                                        <option value="Denver">Denver</option>
                                        <option value="LosAngeles">Los Angeles</option>
                                    </select>
                                </label>
                            </p>
                            <p>
                                <label>Room Size<br />
                                    <select name="RoomSize">
                                        <option value="Queen">One Queen Bed</option>
                                        <option value="Double">Two Twin Beds</option>
                                        <option value="King">One King Bed</option>
                                        <option value="TwoQueen">Two Queen Beds</option>
                                    </select>
                                </label>
                            </p>
                            <p>
                                <label>Number of Guests<br />
                                    <select name="Guests">
                                        <option value=1>1</option>
                                        <option value=2>2</option>
                                        <option value=3>3</option>
                                        <option value=4>4</option>
                                        <option value=5>5</option>
                                    </select>
                                </label>
                            </p>
                        </div>
                        <div class="boxes">
                            <p>
                                <label>Amenities<br />
                                    <input type="checkbox" id="Wifi" name="Wifi" value="Wifi">
                                    <label for="vehicle1"> Purchase Wi-Fi for a $12.99 one time fee?</label><br>
                                    <input type="checkbox" id="Breakfast" name="Breakfast" value="Breakfast">
                                    <label for="vehicle2"> Purchase Breakfast for $8.99 per person per night?</label><br>
                                    <input type="checkbox" id="Parking" name="Parking" value="Parking">
                                    <label for="vehicle3"> Purchase Parking for $19.99 per night?</label>
                                    </select>
                                </label>
                            </p>
                        </div>
                        <div class="boxes">
                            <p>
                                <label>Check-in Date:<input type="date" name="Checkin"></label>
                            </p>
                            <p>
                                <label>Check-out Date:<input type="date" name="CheckOut"></label>
                            </p>
                        </div>
                    </fieldset>
                </div>
            	<div class="center">
                	<button type='submit'>Reserve</button><br />
            	</div>
    	    </form>  
		</div>
	</body>
</html>