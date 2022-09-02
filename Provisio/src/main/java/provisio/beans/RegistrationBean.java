package provisio.beans;

import java.sql.*;

public class RegistrationBean {
		
	public void setUser(String fName, String lName, String email, String password) {
		
		// Create variables for database connection
  		String dbUser = "root";
  		String dbPass = "password";
  		String dbURLandName = "jdbc:mysql://localhost:3306/provisio";
  		
 		
    	// Tries to insert data into the table 
    	Connection con = null;
        Statement stmt = null;
            
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = dbURLandName + "?";
                
            con = DriverManager.getConnection(url + "user=" + dbUser + "&" + "password=" + dbPass);             
            stmt = con.createStatement();  
            System.out.println("Connection Successful");
        }
        catch(Exception e){
            System.out.println("Error connecting to the database.");
            e.printStackTrace();
        }
        
        //Attempt to insert user data into table
        try{
            stmt.execute("INSERT INTO user(Email, Password, FirstName, LastName, LoyaltyPoints) VALUES ('"+ email + "', '" + password + "', '" + fName + "', '" + lName + "', 0)"); 
            
        }
        catch(SQLException e){
            System.out.println("Error inserting data");
            e.printStackTrace();
            
        }
        
        try{
            stmt.close();
            con.close();
        }
        catch(SQLException e){
            System.out.println("Connection close failed");
            e.printStackTrace();
        }
	}
	
public String[] getUser(String fName, String lName) throws SQLException {
		
		// Create variables for database connection
  		String dbUser = "root";
  		String dbPass = "password";
  		String dbURLandName = "jdbc:mysql://localhost:3306/provisio";
  		
  		//initialize variables 
  		String [] user = new String[2];
  		ResultSet fn = null;
  		ResultSet ln = null;
    	Connection con = null;
        Statement stmt = null;
            
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = dbURLandName + "?";
                
            con = DriverManager.getConnection(url + "user=" + dbUser + "&" + "password=" + dbPass);             
            stmt = con.createStatement();  
        }
        catch(Exception e){
            System.out.println("Error connecting to the database.");
            e.printStackTrace();
        }
        
        //Attempt to retrieve user data from the table
        try{

            fn = stmt.executeQuery("SELECT FirstName FROM user WHERE FirstName = '" + fName + "';");
            ln = stmt.executeQuery("SELECT LastName FROM user WHERE LastName = '" + lName + "';");
        }
        catch(SQLException e){
            System.out.println("Error retrieving data");
            e.printStackTrace();
        }
        
        try{
            stmt.close();
            con.close();
        }
        catch(SQLException e){
            System.out.println("Connection close failed");
            e.printStackTrace();
        }
        String firstName = fn.getString("FirstName");
        String lastName = ln.getString("LastName");
        
        user[0] = firstName;
        user[1] = lastName;
        return user;
	}
}
  