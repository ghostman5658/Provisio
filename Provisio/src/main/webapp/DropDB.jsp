<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>                
<!DOCTYPE html>
<html>
<head>
	<title>Drop Database</title>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html">
</head>
<body>
	<a href="setup.html">Setup</a>
	<hr>
	<h1>Drop Database</h1>

	<h4>Trying to drop database</h4>

	<p>output</p>
	<div style="border: solid 1px #CCC">
 	<%
 
		//used init param from XML file
 		String dbName = application.getInitParameter("dbName");
 		String dbUser = application.getInitParameter("dbUser");
 		String dbPass = application.getInitParameter("dbPass");
 		String dbURL = application.getInitParameter("dbURL");
 		String dbURLandName = application.getInitParameter("dbURLandName"); 
 
		// Tries to drop the database
 		Connection con = null;
 		try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
     		con = DriverManager.getConnection(dbURLandName, dbUser, dbPass);
     		Statement stmt = con.createStatement();
     		String sql = "DROP DATABASE " + dbName; 
     		stmt.executeUpdate(sql);
     		out.println("Database " + dbName + " was dropped...");
 		} 
 		catch (Exception e) 
 		{
     		out.println("Result: " + e);
 		}
	%>
	</div>
</body>
</html>