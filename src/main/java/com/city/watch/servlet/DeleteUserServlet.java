package com.city.watch.servlet;

import java.io.IOException;
import com.city.watch.dao.UserDaoImpl;
import com.city.watch.db.ConnectionProvider;
import com.city.watch.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public DeleteUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		HttpSession session=request.getSession();
		int uid=Integer.parseInt(request.getParameter("uid"));
        
		try {
			UserDaoImpl dao=new UserDaoImpl(ConnectionProvider.getConnection());
	        boolean f=dao.deleteUserById(uid);
	        if(f) {
	             session.setAttribute("alertMessage","User Delete Successfully...");
	             session.setAttribute("alertClass", "alert-success");
	             response.sendRedirect("admin/users.jsp");
	        }else {
	        	session.setAttribute("alertMessage","Operation Failed... Try again!!!");
	            session.setAttribute("alertClass", "alert-danger");
	            response.sendRedirect("admin/users.jsp");
	        }
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("alertMessage","Something Went Wrong...");
            session.setAttribute("alertClass", "alert-danger");
            response.sendRedirect("admin/users.jsp");
		}

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
