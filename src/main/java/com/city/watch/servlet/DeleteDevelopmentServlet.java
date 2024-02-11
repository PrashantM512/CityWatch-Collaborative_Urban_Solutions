package com.city.watch.servlet;

import java.io.IOException;
import com.city.watch.dao.DevelopmentDaoImpl;
import com.city.watch.db.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class DeleteDevelopmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public DeleteDevelopmentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        int pid=Integer.parseInt(request.getParameter("pid"));
         
        try {
        	DevelopmentDaoImpl dao=new DevelopmentDaoImpl(ConnectionProvider.getConnection());
            boolean f=dao.deleteDevelopmentById(pid);
            
            if(f){
    			session.setAttribute("alertMessage","Development Deleted SuccessFully...");
    			session.setAttribute("alertClass", "alert-success");
    			response.sendRedirect("admin/manage_devlopments.jsp");
    			
    		} else {
    			session.setAttribute("alertMessage","Development Delete Failed...");
    			session.setAttribute("alertClass", "alert-danger");
    			response.sendRedirect("admin/manage_devlopments.jsp");
    		}
		} catch (Exception e) {
			e.printStackTrace();
			 session.setAttribute("alertMessage","Something Went Wrong...");
			 session.setAttribute("alertClass", "alert-danger");
			 response.sendRedirect("admin/manage_devlopments.jsp");
		}
       
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
