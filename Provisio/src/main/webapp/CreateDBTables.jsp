<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.io.*" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>

<html>
<head>
	<title>Create DB Table</title>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html">
</head>
<body>
	<a href="/setup.html">Setup</a>
	<h1>Create EXP Table</h1>
	
	<%
	
		//used init param from XML file
		String dbName = application.getInitParameter("dbName");
		String dbUser = application.getInitParameter("dbUser");
		String dbPass = application.getInitParameter("dbPass");
		String dbURL = application.getInitParameter("dbURL");
		String dbURLandName = application.getInitParameter("dbURLandName");
			
     		
        // Tries to create the table if it does not exist
        Connection con = null;
        Statement stmt = null;
            
        try{
        	Class.forName("com.mysql.cj.jdbc.Driver");
            String url = dbURLandName + "?";
                
            con = DriverManager.getConnection(url + "user=" + dbUser + "&" + "password=" + dbPass);                 
            stmt = con.createStatement();
        }
        catch(Exception e){
            out.println("<h1>Error connection to database.</h1>");
        }
            
        try{                
            stmt.executeUpdate("DROP TABLE amenities");
            out.println("<b>Table amenities Dropped</b><br />");
        }
        catch(SQLException e){                
            out.println("<b>Table amenities does not exist</b><br />");
        }
            
        try{
            String query = "CREATE TABLE amenities(amenities_id not null int, name not null varchar(15), " +
                    "cost not null double, chargeFrequency not null varchar(15), room_id not null int, primary key(amenities_id), foreign key (room_id));";
            	
            stmt.executeUpdate(query);
            out.println("<b>Table amenities Created</b><br />");
        }
        catch(SQLException e){
            out.println("<b>Table amenities Creation failed</b><br />");
        }
            
        try{
            stmt.close();
            con.close(); 
            out.println("<b>Database connections closed</b><br />");
        }
        catch(SQLException e){
            out.println("<b>Connection close failed</b><br />");
        }
    %>    
</body>
</html>