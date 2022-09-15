<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Provisio - Reservation</title>
    	<link href="provisio.css" type="text/css" rel="stylesheet"/>
    	<meta charset="UTF-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<meta http-equiv="Content-Type" content="text/html">
        <div class="navbar">
        	<img src="logo.png" class="navimg">
       		<div class="navtext">Provisio</div>
            <a class="navbarButton" href="index.html">Home</a>
            <a class="navbarButton" href="AboutUs.html">About Us</a>
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
        <%
        if (session.getAttribute("sessionID") == null) {
            %>
                <div class="response">
        			<h3 class="responseHeader">You are not logged in. Please login to continue.</h3><br />
        			<a class="highlight" href="Login.jsp">Login</a>
        		</div>
            <%
        }
        else {
            %>
                <div width="98%">
                    <form class="Reservation" method='GET' action='ReservationSummary.jsp'>   
                        <h1 class="formHeading">Reservation Options</h1> <hr /><br />
                            <fieldset>
                                <legend>Reservation Details</legend>
                                <div class="boxes">
                                    <p>
                                        <label>Destination<br />
                                            <select name="City">
                                                <option value="Denver">Denver</option>
                                                <option value="Los Angeles">Los Angeles</option>
                                                <option value="Omaha">Omaha</option>
                                            </select>
                                        </label>
                                    </p>
                                    <p>
                                        <label>Room Size<br />
                                              <select name="RoomSize">
                                                <option value="Double Room">$110.00 - Two Twin Beds</option>
                                                <option value="Queen Room">$125.00 - One Queen Bed</option>
                                                <option value="Double Queen Room">$150.00 - Two Queen Beds</option>
                                                <option value="King Room">$165.00 - One King Bed</option>
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
                                        <label>Check-in Date:<input id="CheckInField" type="date" min="1899-01-01" max="2024-01-01" name="CheckIn" required="required"></label>
                                    </p>
                                    <p>
                                        <label>Check-out Date:<input id="CheckOutField" type="date" name="CheckOut" required="required"></label>
                                    </p>
                                    <script>
                                        var today = new Date();
                                        var dd = today.getDate();
                                        var ddd = today.getDate() + 1;
                                        var mm = today.getMonth() + 1; //January is 0!
                                        var yyyy = today.getFullYear();

                                        if (dd < 10) {
                                        dd = '0' + dd;
                                        }

                                        if (mm < 10) {
                                        mm = '0' + mm;
                                        } 
                                                
                                        today = yyyy + '-' + mm + '-' + dd;
                                        nextDay = yyyy + '-' + mm + '-' + ddd;
                                        document.getElementById("CheckInField").setAttribute("min", today);
                                        document.getElementById("CheckOutField").setAttribute("min", nextDay);
                                    </script>
                                </div>
                            </fieldset>
                        </div>
                        <div class="center">
                            <button type='submit'>Reserve</button><br />
                        </div>
                    </form>  
                </div>
            <%
        }
        %>
    </body>
</html>