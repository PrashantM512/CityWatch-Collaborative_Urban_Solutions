package com.city.watch.servlet;

import java.io.IOException;
import com.city.watch.dao.UserDaoImpl;
import com.city.watch.db.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class ManageAdminsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public ManageAdminsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		HttpSession session=request.getSession();
		String email=request.getParameter("email");
		String action=request.getParameter("action");
		
		try {
			UserDaoImpl dao=new UserDaoImpl(ConnectionProvider.getConnection());
			boolean f=dao.updateUserByEmail(email, action);
			if(f) {
				session.setAttribute("alertMessage","Operation successful...");
				session.setAttribute("alertClass","alert-success");
				response.sendRedirect("department/admin.jsp");
			}else {
				session.setAttribute("alertMessage","Operation Failed...");
				session.setAttribute("alertClass","alert-danger");
				response.sendRedirect("department/admin.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("alertMessage","Something Went Wrong...");
			session.setAttribute("alertClass","alert-danger");
			response.sendRedirect("department/admin.jsp");
		}
		doGet(request, response);
	}

}
