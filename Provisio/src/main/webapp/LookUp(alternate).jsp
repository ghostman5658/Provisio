<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*, java.util.Date, java.util.ArrayList" %>

<%@ page import="provisio.beans.ReservationLookupBean"%>

<%-- ****Calendar and Dates**** --%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.util.Calendar" %>

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
                class="navbarButton" href="AboutUs.html">About Us</a> <a
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
            ReservationLookupBean summary = new ReservationLookupBean();
            ArrayList res = new ArrayList();
            
            if (session.getAttribute("sessionID") == null) {
            %>
            <h1>You are not logged in. Please log in to continue.</h1>
            <a class="highlight" href="Login.jsp">Login</a>
            <%
            } 
            else {
                String email = (String)session.getAttribute("sessionID");
                res = summary.getReservation(email);

                Object[] display = res.toArray();

                for (int i = 0; i < res.size(); i++)
                    out.println(display[i] + "<br> ");
            }
        %>
    </body>
</html>


