package com.city.watch.servlet;

import java.io.IOException;
import com.city.watch.dao.TransactionDetailsDAO;
import com.city.watch.dao.TransactionDetailsDAOImpl;
import com.city.watch.db.ConnectionProvider;
import com.city.watch.entity.TransactionDetails;
import com.razorpay.*;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import java.util.UUID;

public class PaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TransactionDetailsDAO transactionDetailsDAO;

    public PaymentServlet() {
        super();
        // Initialize the DAO here
        this.transactionDetailsDAO = new TransactionDetailsDAOImpl(ConnectionProvider.getConnection());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("uid");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String propertyTaxId = request.getParameter("ptan");
        String propertyType = request.getParameter("ptype");
        String amountStr = request.getParameter("amount");
        System.out.println(amountStr);
        if (amountStr == null || amountStr.isEmpty()) {
            System.err.println("Amount parameter is missing or empty");
            return; 
        }
        double amount = Double.parseDouble(amountStr);
        System.out.println(userId + " " + mobile + " " + email + " " + propertyTaxId + " " + propertyType + " " + amount);

        try {
            RazorpayClient razorpay = new RazorpayClient("rzp_test_f3AsciOhTsBdEO", "KU4m2UtM0OOeW2tqQbLPGtIP");
            JSONObject options = new JSONObject();
            options.put("amount", amount * 100);
            options.put("currency", "INR");
            options.put("receipt", "txn_" + UUID.randomUUID().toString());
            Order order = razorpay.orders.create(options);
            String orderId = order.get("id");

            TransactionDetails transactionDetails = new TransactionDetails();
            transactionDetails.setUserId(userId);
            transactionDetails.setMobile(mobile);
            transactionDetails.setEmail(email);
            transactionDetails.setPropertyTaxId(propertyTaxId);
            transactionDetails.setPropertyType(propertyType);
            transactionDetails.setAmount(amount);
            transactionDetails.setOrderId(orderId);
            transactionDetailsDAO.saveTransactionDetails(transactionDetails);

            response.sendRedirect("https://checkout.razorpay.com/v1/payment/" + orderId);
        } catch (RazorpayException e) {
            e.printStackTrace();
        }
    }
}
