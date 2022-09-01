<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Registration</title>
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<link rel="stylesheet" type="text/css" href="provisio.css" />
    	<link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;700&display=swap" rel="stylesheet">
        
        <div id="navbar">
            <a class="navbarButtonActive" href="Home.html">Home</a>
            <a class="navbarButton" href="AboutUs.jsp">About Us</a>
            <a class="navbarButton" href="Locations.jsp">Locations</a>
            <a class="navbarButton" href="Registration.jsp">Register</a>
            <a class="navbarButton" href="Login.jsp">Login</a>
            <a class="navbarButton" href="Reservation.jsp">Reservation</a>
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
        			
        			
        %>	
        	<div class="">
        		<div class="">
        			<h1 class=""></h1>
        			
        		</div>	
        	</div>
        
        <% 
        		}
        		catch(Exception e){
        			out.println("<b>Something went wrong.</b><br />");
                }
        	}
        %>
         
        <% 
        	if(request.getMethod().equals("GET")){
        %>

        <form class="" method='post' action='Registration.jsp'>   
            <div class="" id="">
                <h1 class="formHeading">Registration</h1> 
                
                    <p> 
                        First Name:
                       <input name="fName" type="text" min="0" maxlength="15" required="required"> 
                    </p>
                    <p> 
                        Last Name:
                       <input name="lName" type="text" min="0" maxlength="15" required="required"> 
                    </p>
                    <p> 
                        Email: 
                       <input name="email" type="text" min="0" maxlength="30" required="required"> 
                    </p>
                    <p> 
                        Password 
                       <input name="password" type="password" min="0" maxlength="20" required="required"> 
                    </p>
         
            	</div>
            	<div class="center">
                	<button type='submit'>Register</button><br />  
                	<a href="Login.jsp">Login</a>
            	</div>
        	</div> 
    	</form>  
    	<%
        	}
    	%>

	</body>
</html>