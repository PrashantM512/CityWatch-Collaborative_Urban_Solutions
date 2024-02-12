package com.city.watch.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.city.watch.dao.TransactionDetailsDAOImpl;
import com.city.watch.db.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UpdateDatabaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateDatabaseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
	   	String paymentId = request.getParameter("paymentId");
	     String status = request.getParameter("status");
	     String orderId=(String)session.getAttribute("orderId");
	    
	     System.out.println(paymentId+" "+status+" "+orderId);

	        // Update the database with the payment ID and status
	        boolean success = updateDatabase(paymentId, status);
	        TransactionDetailsDAOImpl dao=new TransactionDetailsDAOImpl(ConnectionProvider.getConnection());
	       boolean f= dao.updateTransactionDetailsByOrderId(paymentId, status, orderId);
	        session.removeAttribute("orderId");

	        
	        response.setContentType("text/html");
	        PrintWriter out = response.getWriter();

	        if (success) {
	            out.println("Database updated successfully");
	            response.setStatus(HttpServletResponse.SC_OK);
	            if(f) {
	            	response.sendRedirect("payment_success.jsp");
	            }
	        } else {
	            out.println("Database update failed");
	            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	        }
	        
  
		doGet(request, response);
	}
	 private boolean updateDatabase(String paymentId, String status) {
	        try {
	            return true;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        }
	    }
	}

