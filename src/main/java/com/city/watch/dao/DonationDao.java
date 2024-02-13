package com.city.watch.dao;

import com.city.watch.entity.Donation;

public interface DonationDao {
       public boolean saveDonationDetails(Donation donation);
       public boolean updateDonationDetailsByOrderId(String paymentId, String status, String orderId);
}
