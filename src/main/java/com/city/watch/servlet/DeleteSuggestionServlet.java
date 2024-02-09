package com.city.watch.servlet;

import java.io.IOException;
import com.city.watch.dao.SuggestionDaoImpl;
import com.city.watch.db.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class DeleteSuggestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public DeleteSuggestionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        
        int id=Integer.parseInt(request.getParameter("id"));
        int uid=Integer.parseInt(request.getParameter("uid"));
        
        try {
			SuggestionDaoImpl dao=new SuggestionDaoImpl(ConnectionProvider.getConnection());
			boolean f=dao.deleteSuggestionByIdandUid(id, uid);
			if(f) {
				session.setAttribute("alertMessage","Your Suggestion Deleted Successfully...");
				session.setAttribute("alertClass","alert-success");
				response.sendRedirect("user_suggestions.jsp");
				
			}else {
				session.setAttribute("alertMessage","Operation Failed... Please Try Again!!!");
				session.setAttribute("alertClass","alert-danger");
				response.sendRedirect("user_suggestions.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("alertMessage","Something Went Wrong...");
			session.setAttribute("alertClass","alert-danger");
			response.sendRedirect("user_suggestions.jsp");
		}

		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
