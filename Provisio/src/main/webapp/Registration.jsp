<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="provisio.beans.*"%>


<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Register</title>
    	<link href="provisio.css" type="text/css" rel="stylesheet"/>
    	<meta charset="UTF-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<meta http-equiv="Content-Type" content="text/html">
    	
        <div id="navbar">
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
                	<div class="registerResponse">
        				<h3>That email is already in use</h3><br />
        				<a href="Registration.jsp">Try Again</a>
        			</div>
        			<%
                }
                
                else if (available == "available") {
                	newUser.setUser(fName, lName, email, password);
                    String [] user = newUser.getUser(fName, lName);
                	%>	
                	<div class="registerResponse">
                		<h3>Congratulations<%=" " + user[0] + " " + user[1] + " "%> your account was created successfully!</h3><br />
                		<a href="Login.jsp">Login</a>
                	</div>
                	<% 
                	}
        		}
        		catch(Exception e){
        			e.printStackTrace();
        			%>
        			<div class="registerResponse">
        				<h3>Oops! Something went wrong.</h3><br />
        				<a href="Registration.jsp">Try Again</a>
        			</div>
        			<%
                }
        	}
        %>
         
        <% 
        	if(request.getMethod().equals("GET")){
        %>

        <form class="randl" method='post' action='Registration.jsp'>   
                <h1 class="formHeading">Register</h1> <hr /><br />
                
                    <p> 
                        First Name:
                       <input class="formInput" name="fName" type="text" min="0" maxlength="15" required="required"> 
                    </p>
                    <p> 
                        Last Name:
                       <input class="formInput" name="lName" type="text" min="0" maxlength="15" required="required"> 
                    </p>
                    <p> 
                        Email: 
                       <input class="formInput" name="email" type="text" min="0" maxlength="30" required="required"> 
                    </p>
                    <p> 
                        Password: 
                       <input class="formInput" name="password" type="password" min="0" maxlength="20" required="required"> 
                    </p>
         
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