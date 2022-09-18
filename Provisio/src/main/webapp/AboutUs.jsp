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
    <h1> About Us </h1>
    <div class="aboutUs" width="98%">
        <div class="box">
            <h3>Lorem Ipsum 1</h3>
            <br>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
                Felis eget nunc lobortis mattis. Feugiat pretium nibh ipsum consequat nisl vel. Morbi non arcu risus quis. 
                Eu mi bibendum neque egestas congue. Elementum eu facilisis sed odio. Condimentum vitae sapien pellentesque habitant 
                morbi tristique senectus et. Mollis aliquam ut porttitor leo a diam. Tempus imperdiet nulla malesuada pellentesque elit 
                eget gravida cum. Nascetur ridiculus mus mauris vitae ultricies leo integer malesuada. Suspendisse ultrices gravida dictum 
                fusce ut placerat. Viverra nibh cras pulvinar mattis nunc. Velit sed ullamcorper morbi tincidunt. 
                Magna eget est lorem ipsum dolor sit amet consectetur. Vel pharetra vel turpis nunc. Orci dapibus ultrices in iaculis nunc 
                sed augue lacus viverra. Aliquet bibendum enim facilisis gravida neque convallis. Pellentesque habitant morbi tristique 
                senectus et netus et. Ullamcorper velit sed ullamcorper morbi tincidunt. Viverra aliquet eget sit amet tellus.
            </p>
        </div>
   
  	<div>
    <img src="aboutusimg.png" style="width:50%" class="aboutusimg"><br />
    </div>
    </div>
    <form class="contactForm" method='POST' action='AboutUs.jsp'>
		<h1 class="formHeading">Contact Us</h1><br /> 
		
			<table>
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