<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="provisio.beans.RegistrationBean"%>


<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Provisio - Register</title>
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
            <a class="navbarButtonActive" href="Registration.jsp">Register</a>
            <a class="navbarButton" href="Login.jsp">Login</a>
            <a class="navbarButton" href="Reservation.jsp">Reservations</a>
            <a class="navbarButton" href="LookUp.jsp">Look Up</a>
            <a class="navbarButton" href="LoyaltyPoints.jsp">Loyalty Points</a>
            <a class="navbarButtonLogOut" href="LogOut.jsp">Log Out</a>
        </div>

	</head>
	<body>
		<div id="container">
        <%
        //get required values from parameters
        if(request.getMethod().equals("POST")){
        	try{
        		// Create new user 
                RegistrationBean newUser = new RegistrationBean();
                        			
                String fName = request.getParameter("fName"); 
                String lName = request.getParameter("lName"); 
                String email = request.getParameter("email"); 
                String password = request.getParameter("password"); 
               	
                String available = newUser.checkUser(email);
               
                if (available == "taken") {
                	%>
                	<div class="response">
        				<h3 class="responseHeader">That email is already in use</h3><br />
        				<a class="highlight" href="Registration.jsp">Try Again</a>
        			</div>
        			<%
                }
                
                else if (available == "available") {
                	newUser.setUser(fName, lName, email, password);
                    String [] user = newUser.getUser(fName, lName);
                	%>	
                	<div class="response">
                		<h3 class="responseHeader">Congratulations<%=" " + user[0] + " " + user[1] + " "%> your account was created successfully!</h3><br />
                		<a class="highlight" href="Login.jsp">Login</a>
                	</div>
                	<% 
                	}
        		}
        		catch(Exception e){
        			e.printStackTrace();
        			%>
        			<div class="response">
        				<h3 class="responseHeader">Oops! Something went wrong.</h3><br />
        				<a class="highlight" href="Registration.jsp">Try Again</a>
        			</div>
        			<%
                }
        	}
        	if(request.getMethod().equals("GET")){
        %>

        <form class="randl" method='post' action='Registration.jsp'>   
                <h1 class="formHeading">Register</h1> <hr /><br />
                
                	<table>
                		<tr>
                			<td>First Name:</td>
                			<td><input class="formInput" name="fName" type="text" min="0" maxlength="15" required="required"> </td>
                		</tr>
                		<tr>
                			<td>Last Name:</td>
                			<td><input class="formInput" name="lName" type="text" min="0" maxlength="15" required="required"> </td>
                		</tr>
                   		<tr>
                			<td>Email:</td>
                			<td><input class="formInput" name="email" type="text" min="0" maxlength="30" required="required"> </td>
                		</tr>
                		<tr>
                			<td>Password:</td>
                			<td><input class="formInput" name="password" type="password" min="0" maxlength="20" required="required"> </td>
                		</tr>
                    </table>
            	<div class="center">
                	<button type='submit'>Register</button><br />  
                	<a class="highlight" href="Login.jsp">Login</a>
            	</div>
        	
    	</form>  
    	<%
        }
    	%>
		</div>
	</body>
</html>