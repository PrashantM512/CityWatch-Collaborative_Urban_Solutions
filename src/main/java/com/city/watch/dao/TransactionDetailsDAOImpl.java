package com.city.watch.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.city.watch.entity.TransactionDetails;

public class TransactionDetailsDAOImpl implements TransactionDetailsDAO {

	 private Connection connection; 
     public TransactionDetailsDAOImpl(Connection connection) {
	        this.connection = connection;
	   }
	
     @Override
     public void saveTransactionDetails(TransactionDetails transactionDetails) {
         String query = "INSERT INTO transaction_details (userId, mobile, email, propertyTaxId, propertyType, orderId, amount, paymentId, receiptId, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
         try (PreparedStatement statement = connection.prepareStatement(query)) {
             statement.setString(1, transactionDetails.getUserId());
             statement.setString(2, transactionDetails.getMobile());
             statement.setString(3, transactionDetails.getEmail());
             statement.setString(4, transactionDetails.getPropertyTaxId());
             statement.setString(5, transactionDetails.getPropertyType());
             statement.setString(6, transactionDetails.getOrderId());
             statement.setDouble(7, transactionDetails.getAmount());
             statement.setString(8, transactionDetails.getPaymentId());
             statement.setString(9, transactionDetails.getReceiptId());
             statement.setString(10, transactionDetails.getStatus());

             statement.executeUpdate();
         } catch (SQLException e) {
             e.printStackTrace();
         }
     }


    @Override
    public TransactionDetails getTransactionDetailsById(Long id) {
        String query = "SELECT * FROM transaction_details WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return extractTransactionDetailsFromResultSet(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<TransactionDetails> getAllTransactionDetails() {
        List<TransactionDetails> transactionDetailsList = new ArrayList<>();
        String query = "SELECT * FROM transaction_details";
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {
            while (resultSet.next()) {
                TransactionDetails transactionDetails = extractTransactionDetailsFromResultSet(resultSet);
                transactionDetailsList.add(transactionDetails);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return transactionDetailsList;
    }

    private TransactionDetails extractTransactionDetailsFromResultSet(ResultSet resultSet) throws SQLException {
        TransactionDetails transactionDetails = new TransactionDetails();
        transactionDetails.setId(resultSet.getLong("id"));
        transactionDetails.setUserId(resultSet.getString("userId"));
        transactionDetails.setMobile(resultSet.getString("mobile"));
        transactionDetails.setEmail(resultSet.getString("email"));
        transactionDetails.setPropertyTaxId(resultSet.getString("propertyTaxId"));
        transactionDetails.setPropertyType(resultSet.getString("propertyType"));
        transactionDetails.setOrderId(resultSet.getString("orderId"));
        transactionDetails.setAmount(resultSet.getDouble("amount"));
        transactionDetails.setPaymentId(resultSet.getString("paymentId"));
        transactionDetails.setReceiptId(resultSet.getString("receiptId"));
        transactionDetails.setStatus(resultSet.getString("status"));
        return transactionDetails;
    }

	@Override
	public boolean updateTransactionDetailsByOrderId(String paymentId, String status, String orderId) {
		boolean f=false;
		try {
			String query="UPDATE transaction_details SET paymentId=? , status=? WHERE orderId=?";
			PreparedStatement stmt = connection.prepareStatement(query);
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


