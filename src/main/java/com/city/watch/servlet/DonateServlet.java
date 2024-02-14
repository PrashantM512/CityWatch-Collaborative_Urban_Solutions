package com.city.watch.servlet;

import java.io.IOException;

import com.city.watch.dao.DonationDao;
import com.city.watch.dao.DonationDaoImpl;
import com.city.watch.db.ConnectionProvider;
import com.city.watch.entity.Donation;
import com.razorpay.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.json.JSONObject;
import java.util.UUID;


public class DonateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DonationDao donationDao;

    public DonateServlet() {
        super();
        this.donationDao = new DonationDaoImpl(ConnectionProvider.getConnection());
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session=request.getSession();
	      	
		    String name = request.getParameter("name");
	        String mobile = request.getParameter("mobile");
	        String email = request.getParameter("email");
	        String amountStr = request.getParameter("amount");
	        String aadhar = request.getParameter("aadhar");
	        int pid = Integer.parseInt(request.getParameter("pid"));
	        String paymentId = request.getParameter("razorpay_payment_id");
	       
	        if (amountStr == null || amountStr.isEmpty()) {
	            System.err.println("Amount parameter is missing or empty");
	            return; 
	        }
	        double amount = Double.parseDouble(amountStr);
	        System.out.println(name + " " +mobile + " " + email + " " + amount+" "+paymentId+" "+aadhar+" "+pid);

	        try {
	            RazorpayClient razorpay = new RazorpayClient("rzp_test_f3AsciOhTsBdEO", "KU4m2UtM0OOeW2tqQbLPGtIP");
	            JSONObject options = new JSONObject();
	            options.put("amount", amount * 100);
	            options.put("currency", "INR");
	            options.put("receipt", "txn_" + UUID.randomUUID().toString());
	            Order order = razorpay.orders.create(options);
	            String orderId = order.get("id");
	            String receipt=order.get("receipt");
	            
	            Donation d=new Donation(name,email,amount,mobile,aadhar,pid,orderId,paymentId,receipt,"created");
                donationDao.saveDonationDetails(d); 
                session.setAttribute("orderId",orderId);

	            response.sendRedirect("https://checkout.razorpay.com/v1/payment/" + orderId);
	        } catch (RazorpayException e) {
	            e.printStackTrace();
	        }
	    }
	
}
