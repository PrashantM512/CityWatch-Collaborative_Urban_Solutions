package com.city.watch.db;

import java.sql.Connection;

public class TestConnection {
    
    public static void main(String[] args) {
        Connection con = ConnectionProvider.getConnection();
        if (con != null) {
            System.out.println("Connection successful!");
            try {
                con.close(); 
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("Failed to establish connection!");
        }
    }
}
