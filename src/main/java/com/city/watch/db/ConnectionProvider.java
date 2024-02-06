package com.city.watch.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {

	public static Connection con;

	public static Connection getConnection() {

		try {
			if (con == null) {

				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/city_watch?useSSL=false", "root", "");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return con;
	}
}

