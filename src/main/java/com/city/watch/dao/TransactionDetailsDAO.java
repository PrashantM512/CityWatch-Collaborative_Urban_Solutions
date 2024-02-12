package com.city.watch.dao;

import java.util.List;

import com.city.watch.entity.TransactionDetails;

public interface TransactionDetailsDAO {
	void saveTransactionDetails(TransactionDetails transactionDetails);
    TransactionDetails getTransactionDetailsById(Long id);
    List<TransactionDetails> getAllTransactionDetails();
    public boolean updateTransactionDetailsByOrderId(String paymentId,String status,String orderId);
}
