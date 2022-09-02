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
                			
                newUser.setUser(fName, lName, email, password);
                String [] user = newUser.getUser(fName, lName);
                String fn = user[0];
                String ln = user[1];
                
                %>	
        	<div class="loginSummary">
        		<h2>Congratulations<%=" " + fn + " " + ln + " "%> your account was created successfully!</h2>
        	</div>
        
        <% 
        		}
        		catch(Exception e){
        			%>
        			<b>Something went wrong.</b><br />
        			<a href="Registration.jsp">Register</a>
        		<%
                }
        	}
        %>
         
        <% 
        	if(request.getMethod().equals("GET")){
        %>

        <form class="login" method='post' action='Registration.jsp'>   
                <h1 class="formHeading">Registration</h1> 
                
                    <p class="formInput"> 
                        First Name:
                       <input name="fName" type="text" min="0" maxlength="15" required="required"> 
                    </p>
                    <p class="formInput"> 
                        Last Name:
                       <input name="lName" type="text" min="0" maxlength="15" required="required"> 
                    </p>
                    <p class="formInput"> 
                        Email: 
                       <input name="email" type="text" min="0" maxlength="30" required="required"> 
                    </p>
                    <p class="formInput"> 
                        Password 
                       <input name="password" type="password" min="0" maxlength="20" required="required"> 
                    </p>
         
            	<div class="center">
                	<button type='submit'>Register</button><br />  
                	<a href="Login.jsp">Login</a>
            	</div>
        	
    	</form>  
    	<%
        	}
    	%>
		</div>
	</body>
</html>