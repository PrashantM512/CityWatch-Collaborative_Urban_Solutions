package com.city.watch.servlet;

import java.io.IOException;

import com.city.watch.dao.SuggestionDaoImpl;
import com.city.watch.db.ConnectionProvider;
import com.city.watch.entity.Suggestion;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class SubmitSuggestionsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public SubmitSuggestionsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        
        int uid=Integer.parseInt(request.getParameter("uid"));
        String title=request.getParameter("title");
        String description=request.getParameter("description");
        int age=Integer.parseInt(request.getParameter("age"));
        String education=request.getParameter("education");
        
        Suggestion sug=new Suggestion(uid,title,description,age,education);
        
        SuggestionDaoImpl dao=new SuggestionDaoImpl(ConnectionProvider.getConnection());
        try {
			boolean f=dao.addSuggestion(sug);
			if(f) {
				session.setAttribute("alertMessage", "Your Suggestions Send Successfully...");
				session.setAttribute("alertClass","alert-success");
				response.sendRedirect("suggestions.jsp");
			}else {
				session.setAttribute("alertMessage", "Operation failed... Please Try Agin!!!");
				session.setAttribute("alertClass","alert-danger");
				response.sendRedirect("suggestions.jsp");	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("alertMessage", "Something Went Wrong...");
			session.setAttribute("alertClass","alert-danger");
			response.sendRedirect("suggestions.jsp");	
		}

		doGet(request, response);
	}

}
