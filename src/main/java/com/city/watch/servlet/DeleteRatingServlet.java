package com.city.watch.servlet;

import java.io.IOException;

import com.city.watch.dao.RatingsDaoImpl;
import com.city.watch.db.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class DeleteRatingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteRatingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        int rid=Integer.parseInt(request.getParameter("rid"));
        
        try {
		    RatingsDaoImpl dao=new RatingsDaoImpl(ConnectionProvider.getConnection());
		    boolean f=dao.deleteRatingById(rid);
		    
		    if(f) {
				session.setAttribute("alertMessage", "Rating Delete Successfully...");
				session.setAttribute("alertClass","alert-success");
				response.sendRedirect("admin/rating_feedbacks.jsp");
			}else {
				session.setAttribute("alertMessage", "Operation failed... Please Try Agin!!!");
				session.setAttribute("alertClass","alert-danger");
				response.sendRedirect("admin/rating_feedbacks.jsp");
			}
		    
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("alertMessage", "Something Went Wrong...");
			session.setAttribute("alertClass","alert-danger");
			response.sendRedirect("admin/rating_feedbacks.jsp");
		}

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
