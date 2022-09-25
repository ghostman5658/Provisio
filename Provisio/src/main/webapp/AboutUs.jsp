<!DOCTYPE html>
<html lang="en">
<head>
	<title>Provisio - About Us</title>
    <link href="provisio.css" type="text/css" rel="stylesheet"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html">
    
    <div class="navbar">
        <img src="logo.png" class="navimg">
        <div class="navtext">Provisio</div>
        <a class="navbarButton" href="index.html">Home</a>
        <a class="navbarButtonActive" href="AboutUs.jsp">About Us</a>
        <a class="navbarButton" href="Locations.jsp">Locations</a>
        <a class="navbarButton" href="Registration.jsp">Register</a>
        <a class="navbarButton" href="Login.jsp">Login</a>
        <a class="navbarButton" href="Reservation.jsp">Reservations</a>
        <a class="navbarButton" href="LookUp.jsp">Look Up</a>
        <a class="navbarButton" href="LoyaltyPoints.jsp">Loyalty Points</a>
        <a class="navbarButtonLogOut" href="LogOut.jsp">Log Out</a>
    </div>
</head>
    <body>
        <h1 class="abus"> About Us </h1>
  	<%
        if(request.getMethod().equals("POST")){ 
        	String user = request.getParameter("name");
        	%>
    		<div class="response">
				<h3 class="responseHeader">Thank you <%=user %> for your submission. Someone will contact you shortly.</h3><br />
				<a class="highlight" href="index.html">Home</a>
			</div>
			<%
	}
        else {
	%>
    <div class="aboutUs" width="98%">
        <div class="box">
            <h3>Who is Provisio?</h3>
            <br />
            <p> Provisio is an innovator in the field of hotel branding and management with a focus on the highest quality customer interactions and for delivering a winning strategy to ensure proactive operational change
                while synergistically providing benefit tot he markets in which we maintain a presence.  
            </p>
        </div>
  	    <div>
            <img src="aboutusimg.png" class="aboutusimg"><br />
        </div>
    </div>
    <form class="contactForm" method='POST' action='AboutUs.jsp'>
		<h1 class="formHeading">Contact Us</h1><br /> 
		
			<table div="contactForm">
				<tr>
					<td>Name: </td>
					<td><input name="name" type="text" min="1" maxlength="30" required="required"> </td>
				</tr>
				<tr>
					<td>Email: </td>
					<td><input type="text" min="1" maxlength="30" required="required"> </td>
				</tr>
				<tr>
					<td>Phone: </td>
					<td><input type="text" min="7" maxlength="15" required="required"> </td>
				</tr>
				<tr>
					<td>Comments: </td>
					<td><input id="comments"> </td>
				</tr>
			</table>
			<div class="center">
                	<button type='submit'>Submit</button><br />  
            </div>
		</form>
	<%
        }
	%>
</body>
</html>