<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.io.*" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>Insert Records</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html">
</head>
<body>
	<a href="/setup.html">Setup</a>
	<hr>
    <h1>Insert Records</h1>
        
    <%
    
  		//used init param from XML file
  		String dbName = application.getInitParameter("dbName");
  		String dbUser = application.getInitParameter("dbUser");
  		String dbPass = application.getInitParameter("dbPass");
  		String dbURL = application.getInitParameter("dbURL");
  		String dbURLandName = application.getInitParameter("dbURLandName");
  		
 		
    	// Tries to insert data into the table 
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
            stmt.executeUpdate("INSERT INTO HOTEL()"); 
           
            
            out.println("<b>Data Inserted</b><br />");
        }
        catch(SQLException e){
            out.println("<b>Error inserting data</b><br />");
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