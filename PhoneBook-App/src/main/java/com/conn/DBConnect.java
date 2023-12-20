package com.conn;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;

public class DBConnect {

	
	private static Connection conn;
	
	
	public static Connection getConn() {
		
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/phonebook","root","root");
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return conn;
	}
}
