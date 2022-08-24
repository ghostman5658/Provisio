<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
	<title>Create Database</title>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html">
</head>
<body>
	<a href="/setup.html">Setup</a>
	<hr>
	<h1>Create Database</h1>

	<h4>Trying to create database</h4>
	<div style="border: solid 1px #CCC">
 	<%  
 		
 		//used init param from XML file
		String dbName = application.getInitParameter("dbName");
		String dbUser = application.getInitParameter("dbUser");
		String dbPass = application.getInitParameter("dbPass");
		String dbURL = application.getInitParameter("dbURL");
		String dbURLandName = application.getInitParameter("dbURLandName");
		
  		// Tries to create the Database if it does not exist.
  		Connection con = null;
  
  		try {
      		Class.forName("com.mysql.cj.jdbc.Driver");
      		con = DriverManager.getConnection(dbURLandName, dbUser, dbPass); 
      		out.println("<p>Database " + dbName + " exists.</p>");  
  		} 
  		catch (Exception e) 
  		{
      		out.println("<p>Result of initial DB check: </p>" + e);
     		out.println("<p>Creating DB now...</p>");
     		con = DriverManager.getConnection(dbURL, dbUser, dbPass); 
      		Statement stmt = con.createStatement();
      		String query = "CREATE DATABASE " + dbName;
      		stmt.executeUpdate(query);
      		out.println("<p>Database " + dbName + " created sucessfully.</p>");  
  		}
	%>
	</div>
</body>
</html>