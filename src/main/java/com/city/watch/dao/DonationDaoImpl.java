package com.city.watch.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.city.watch.entity.Development;
import com.city.watch.entity.Donation;

public class DonationDaoImpl implements DonationDao {

	private Connection conn;

	public DonationDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean saveDonationDetails(Donation donation) {
		boolean f=false;
		try {
			String query="INSERT INTO donations(name,email,amount,mobile,aadhar,pid,orderId,paymentId,receiptId,status) VALUES(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1, donation.getName());
			stmt.setString(2, donation.getEmail());
			stmt.setDouble(3, donation.getAmount());
			stmt.setString(4, donation.getMobile());
			stmt.setString(5, donation.getAadhar());
			stmt.setInt(6, donation.getPid());
			stmt.setString(7,donation.getOrderId());
			stmt.setString(8,donation.getPaymentId());
			stmt.setString(9,donation.getReceiptId());
			stmt.setString(10,donation.getStatus());
			stmt.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	@Override
	public boolean updateDonationDetailsByOrderId(String paymentId, String status, String orderId) {
		boolean f=false;
		try {
			String query="UPDATE donations SET paymentId=? , status=? WHERE orderId=?";
			PreparedStatement stmt = conn.prepareStatement(query);
			stmt.setString(1, paymentId);
			stmt.setString(2, status);
			stmt.setString(3, orderId);
			stmt.executeUpdate();
			f=true;
			
		} catch (Exception e) {
		   e.printStackTrace();
		}
		return f;
	
	}
	 @Override
	    public List<Donation> getAllDonationsWithDevelopments() throws SQLException{
	        List<Donation> donations = new ArrayList<>();
	        String sql = "SELECT d.*, dev.title AS project_title FROM donations d " +
	                     "INNER JOIN developments dev ON d.pid = dev.pid";

	        try {
				try (PreparedStatement statement = conn.prepareStatement(sql);
				     ResultSet resultSet = statement.executeQuery()) {

				    while (resultSet.next())
						try {
							{
							    int id = resultSet.getInt("id");
							    String name = resultSet.getString("name");
							    String email = resultSet.getString("email");
							    double amount = resultSet.getDouble("amount");
							    String mobile = resultSet.getString("mobile");
							    String aadhar = resultSet.getString("aadhar");
							    Timestamp date = resultSet.getTimestamp("date");
							    int pid = resultSet.getInt("pid");
							    String paymentId = resultSet.getString("paymentId");
							    String status = resultSet.getString("status");
							    String orderId = resultSet.getString("orderId");
							    String receiptId = resultSet.getString("receiptId");
							    String projectTitle = resultSet.getString("project_title");

							    Development development = new Development();
							    development.setPid(pid);
							    development.setTitle(projectTitle);

							    Donation donation = new Donation(id, name, email, amount, mobile, aadhar, pid,date, orderId, paymentId, receiptId, status, development);

							    donations.add(donation);
							}
						} catch (SQLException e) {
							
							e.printStackTrace();
						}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	        return donations;
	    }
}
