package com.city.watch.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.PreparedStatement;

import com.city.watch.dao.RatingsDaoImpl;
import com.city.watch.db.ConnectionProvider;
import com.city.watch.entity.Rating;
import com.city.watch.file.Helper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class RatingsAndFeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RatingsAndFeedbackServlet() {
        super(); 
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		HttpSession session=request.getSession();
	    int stars=Integer.parseInt(request.getParameter("rate"));
	    String feedback=request.getParameter("feedback");
	    int pid=Integer.parseInt(request.getParameter("pid"));
	    int uid=Integer.parseInt(request.getParameter("uid"));
	    
	    Rating rate=new Rating(stars,feedback,pid,uid);
	    
	    try {
			RatingsDaoImpl dao=new RatingsDaoImpl(ConnectionProvider.getConnection());
			boolean f=dao.giveRatings(rate);
			
			if (f) {
				response.sendRedirect("rating_thnx_msg.jsp");
            } else {
				session.setAttribute("alertMessage","Failed To Submit Feedback... Try again!!!");
				session.setAttribute("alertClass", "alert-danger");
				response.sendRedirect("rating_thnx_msg.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("alertMessage","Failed To Submit Feedback... Try again!!!");
			session.setAttribute("alertClass", "alert-danger");
			response.sendRedirect("rating_thnx_msg.jsp");
		}
	   
		doGet(request, response);
	}

}
