package com.city.watch.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
}
