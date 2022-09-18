<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*, java.util.Date, java.text.*, java.util.ArrayList, java.text.SimpleDateFormat, java.util.concurrent.TimeUnit, java.util.Calendar, java.text.ParseException, java.math.BigDecimal, java.math.RoundingMode, java.sql.*" %>
<%@ page import="provisio.beans.ReservationSummaryBean"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Provisio - Past Reservation Lookup</title>
        <link href="provisio.css" type="text/css" rel="stylesheet" />
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html">
        <div class="navbar">
            <img src="logo.png" class="navimg">
            <div class="navtext">Provisio</div>
            <a class="navbarButton" href="index.html">Home</a> <a
                class="navbarButton" href="AboutUs.jsp">About Us</a> <a
                class="navbarButton" href="Locations.jsp">Locations</a> <a
                class="navbarButton" href="Registration.jsp">Register</a> <a
                class="navbarButton" href="Login.jsp">Login</a> <a
                class="navbarButton" href="Reservation.jsp">Reservations</a> <a
                class="navbarButtonActive" href="LookUp.jsp">Look Up</a> <a
                class="navbarButton" href="LoyaltyPoints.jsp">Loyalty Points</a> <a
                class="navbarButtonLogOut" href="LogOut.jsp">Log Out</a>
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
            String dbUser = "root";
            String dbPass = "password";
            String dbURLandName = "jdbc:mysql://localhost:3306/provisio";
                    
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            
            String email = (String)session.getAttribute("sessionID");
            String query = "SELECT * FROM reservation WHERE Email = '" + email + "'";

            ReservationSummaryBean summary = new ReservationSummaryBean();
            %>
            
            <%
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
                    String id = rs.getString("ReservationId");
                    String bDate = rs.getString("BookingDate"); 
                    String aDate = rs.getString("ArrivalDate");
                    String dDate = rs.getString("DepartureDate");
                    String pEarn = rs.getString("PointsEarned");
                    String nOfG = rs.getString("NumberOfGuests");
                    String selAmen = rs.getString("SelectedAmenities"); 
                    double cost = Double.parseDouble(rs.getString("Cost"));
                    String hId = rs.getString("HotelId");
                    String Email = rs.getString("Email");
                    String rId = rs.getString("RoomId");

                    Date holi1 = new SimpleDateFormat("yyyy-MM-dd").parse("2023-07-04");
                    Date holi2 = new SimpleDateFormat("yyyy-MM-dd").parse("2022-12-24");
                    Date holi3 = new SimpleDateFormat("yyyy-MM-dd").parse("2022-12-31");
                    Date holiStart = new SimpleDateFormat("yyyy-MM-dd").parse(aDate);
                    Date holiEnd = new SimpleDateFormat("yyyy-MM-dd").parse(dDate);

                    double totalDays = summary.dayLength(aDate, dDate);

                    double amenCost = 0.0;
                    double pCost = totalDays * 19.99;;
                    double wCost = 12.99;
                    double bCost = totalDays * 8.99;
                    double uCost = cost * 1.05;
                    double hCost = cost * 1.1;

                    if (selAmen.contains("wifi") && selAmen.contains("breakfast") && selAmen.contains("parking")) {
                        amenCost = pCost + wCost + bCost;
                    }
                    else if (selAmen.contains("wifi") && selAmen.contains("breakfast") && !selAmen.contains("parking")) {
                        amenCost = wCost + bCost;
                    }
                    else if (selAmen.contains("wifi") && !selAmen.contains("breakfast") && selAmen.contains("parking")) {
                        amenCost = pCost + wCost;
                    }
                    else if (!selAmen.contains("wifi") && selAmen.contains("breakfast") && selAmen.contains("parking")) {
                        amenCost = pCost + bCost;
                    }
                    else if (!selAmen.contains("wifi") && !selAmen.contains("breakfast") && selAmen.contains("parking")) {
                        amenCost = pCost;
                    }
                    else if (!selAmen.contains("wifi") && selAmen.contains("breakfast") && !selAmen.contains("parking")) {
                        amenCost = bCost;
                    }

                    double tCost = uCost + amenCost;
                    double tTax = tCost * 0.1;
                    double tTotal = tCost + tTax;
                    
                    double htCost = hCost + amenCost;
                    double htTax = htCost * 0.1;
                    double htTotal = htCost + htTax;
                    %>
                    <div width="98%" class="randl">
                    <h1 class="formHeading">Reservation Summary</h1><hr /><br />
                    <table>
                        <tr>
                            <td>Booking Date: </td>
                            <td>
                            <% 
                                out.println(bDate);
                            %>
                            </td>
                        </tr>
                        <tr>
                            <td>Check-In Date: </td>
                            <td>
                            <% ;
                            out.print(aDate);
                            %>
                            </td>
                        </tr>
                        <tr>
                            <td>Check-out Date: </td>
                            <td>
                            <% 
                                out.print(dDate);
                            %>
                            </td>
                        </tr>
                        <tr>
                            <td>Destination: </td>
                            <td>
                            <%
                                if (hId.contains("1")) {
                                    out.print("Omaha");
                                }
                                else if(hId.contains("2")) {
                                    out.print("Denver");
                                }
                                else if (hId.contains("3")) {
                                    out.print("Los Angeles");
                                }
                            %> 
                            </td>
                        </tr>
                        <tr>
                            <td>Room Size: </td>
                            <td>
                            <%
                                if (rId.contains("1") && !rId.contains("10") && !rId.contains("11") && !rId.contains("12")) {
                                    out.print("  Queen Room");
                                }
                                else if (rId.contains("2") && !rId.contains("12")) {
                                    out.print("  Double Room");
                                }
                                else if (rId.contains("3")) {
                                    out.print("  King Room");
                                }
                                else if (rId.contains("4")) {
                                    out.print("  Double Queen Room");
                                }
                                else if (rId.contains("5")) {
                                    out.print("  Queen Room");
                                }
                                else if (rId.contains("6")) {
                                    out.print("  Double Room");
                                }
                                else if (rId.contains("7")) {
                                    out.print("  King Room");
                                }
                                else if (rId.contains("8")) {
                                    out.print("  Double Queen Room");
                                }
                                else if (rId.contains("9")) {
                                    out.print("  Queen Room");
                                }
                                else if (rId.contains("10")) {
                                    out.print("  Double Room");
                                }
                                else if (rId.contains("11")) {
                                    out.print("  King Room");
                                }
                                else if (rId.contains("12")){
                                    out.print("  Double Queen Room");
                                }
                            %> 
                            </td>
                        </tr>
                        <tr>
                            <td>Points Earned: </td>
                            <td>
                            <%
                                out.print(pEarn);
                            %>
                            </td>
                        </tr>
                        <tr>
                            <td>Number of Guests: </td>
                            <td>
                            <%
                                out.print(nOfG);
                            %>
                            </td>
                        </tr>
                        <tr>
                            <td>Amenities Requested: </td>
                            <td>
                            <%
                                out.print("  " + selAmen);					
                            %>
                            </td>
                        </tr>
                        <tr>
                            <td>Room Cost: </td>
                            <td>
                            <%
                                out.print(NumberFormat.getCurrencyInstance(new Locale("en", "US")).format(uCost));
                            %>				
                            </td>
                        </tr>
                        <tr>
                            <td>Amenities Cost: </td>
                            <td>
                            <%
                                out.print(NumberFormat.getCurrencyInstance(new Locale("en", "US")).format(amenCost));
                            %>				
                            </td>
                        </tr>
                        <tr>
                            <td>Sub-Total: </td>
                            <td>
                            <%
                                out.print(NumberFormat.getCurrencyInstance(new Locale("en", "US")).format(uCost + amenCost));
                            %>				
                            </td>
                        </tr>
                        <tr>
                            <td>Taxes (10%): </td>
                            <td>
                            <%
                                out.print(NumberFormat.getCurrencyInstance(new Locale("en", "US")).format(tTax));
                            %> 
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Total Cost: </strong></td>
                            <td><strong>
                            <%
                                if (holi1.before(holiEnd) && holi1.after(holiStart)) {
                                    out.print(NumberFormat.getCurrencyInstance(new Locale("en", "US")).format(htTotal));
                                }
                                else if (holi2.before(holiEnd) && holi2.after(holiStart)){
                                    out.print(NumberFormat.getCurrencyInstance(new Locale("en", "US")).format(htTotal));
                                }
                                else if (holi3.before(holiEnd) && holi3.after(holiStart)){
                                    out.print(NumberFormat.getCurrencyInstance(new Locale("en", "US")).format(htTotal));
                                }
                                else {
                                    out.print(NumberFormat.getCurrencyInstance(new Locale("en", "US")).format(tTotal));
                                }
                            %>		
                            </strong></td>
                        </tr>
                    </table>
                </div>
            <%
            }
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
    }
    %>
    </body>
</html>