package com.city.watch.servlet;

import java.io.IOException;

import com.city.watch.dao.IssueDaoImpl;
import com.city.watch.db.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class DeleteIssueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteIssueServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        int id=Integer.parseInt(request.getParameter("id"));
        int userId=Integer.parseInt(request.getParameter("userId"));
        
        try {
			IssueDaoImpl dao=new IssueDaoImpl(ConnectionProvider.getConnection());
			boolean f=dao.deleteIssueByIdandUserId(id, userId);
			
			if(f) {
				session.setAttribute("alertMessage","Your Issue Deleted Successfully...");
				session.setAttribute("alertClass","alert-success");
				response.sendRedirect("user_issues.jsp");
				
			}else {
				session.setAttribute("alertMessage","Operation Failed... Please Try Again!!!");
				session.setAttribute("alertClass","alert-danger");
				response.sendRedirect("user_issues.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("alertMessage","Something Went Wrong...");
			session.setAttribute("alertClass","alert-danger");
			response.sendRedirect("user_issues.jsp");
		}

		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
