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
            System.out.println();
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
	
	public String[] getUser(String fName, String lName) {
		
		// Create variables for database connection
  		String dbUser = "root";
  		String dbPass = "password";
  		String dbURLandName = "jdbc:mysql://localhost:3306/provisio";
  		
  		//initialize variables 
  		String [] user = new String[2];
    	Connection con = null;
        Statement stmt = null;
        ResultSet fn = null;
        ResultSet ln = null;
            
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
        	
            fn = stmt.executeQuery("SELECT FirstName FROM user WHERE FirstName = '" + fName + "'");
            while (fn.next()) {
            	String firstName = fn.getString("FirstName");
            	user[0] = firstName;
            }
            
            ln = stmt.executeQuery("SELECT LastName FROM user WHERE LastName = '" + lName + "'");
            while (ln.next()) {
            	String lastName = ln.getString("LastName");
            	user[1] = lastName;
            }
        }
        catch(SQLException e){
            System.out.println("Error retrieving data");
            e.printStackTrace();
        }
        finally {
        	try{
        		if (fn != null && ln != null) {
        			fn.close();
        			ln.close();
        		}
        		if (stmt != null) {
                    stmt.close();
                }
                if (con != null) {
                    con.close();
                }
        	}
        	catch(SQLException e){
        		System.out.println("Connection close failed");
        		e.printStackTrace();
        	}
        }
        return user;
	} 
	
	public String checkUser(String email) {
	
		// Create variables for database connection
		String dbUser = "root";
		String dbPass = "password";
		String dbURLandName = "jdbc:mysql://localhost:3306/provisio";
		
		//initialize variables 
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String check = "";
        
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
    	
			rs = stmt.executeQuery("SELECT Email FROM user WHERE Email = '" + email + "'");
			if (rs.next()) {
				check = "taken";
			}
			else {
				check = "available";
			}
		
		}
		catch(SQLException e){
			System.out.println("Error retrieving data");
			e.printStackTrace();
		}
		finally {
			try{
				rs.close();
				stmt.close();
				con.close();
			}
			catch(SQLException e){
				System.out.println("Connection close failed");
				e.printStackTrace();
			}
		}
		return check;
	} 
}
  