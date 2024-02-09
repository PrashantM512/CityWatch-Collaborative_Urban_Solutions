package com.city.watch.servlet;

import java.io.IOException;
import com.city.watch.dao.SuggestionDaoImpl;
import com.city.watch.db.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class DeleteSuggestionByAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteSuggestionByAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 HttpSession session=request.getSession();
	        
	        int id=Integer.parseInt(request.getParameter("id"));
	        
	        try {
				SuggestionDaoImpl dao=new SuggestionDaoImpl(ConnectionProvider.getConnection());
				boolean f=dao.deleteSuggestionById(id);
				if(f) {
					session.setAttribute("alertMessage","Your Suggestion Deleted Successfully...");
					session.setAttribute("alertClass","alert-success");
					response.sendRedirect("admin/suggestions.jsp");
					
				}else {
					session.setAttribute("alertMessage","Operation Failed... Please Try Again!!!");
					session.setAttribute("alertClass","alert-danger");
					response.sendRedirect("admin/suggestions.jsp");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				session.setAttribute("alertMessage","Something Went Wrong...");
				session.setAttribute("alertClass","alert-danger");
				response.sendRedirect("admin/suggestions.jsp");
			}

		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
