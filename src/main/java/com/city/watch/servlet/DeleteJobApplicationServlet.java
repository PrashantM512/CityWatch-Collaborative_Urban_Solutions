package com.city.watch.servlet;

import java.io.IOException;

import com.city.watch.dao.JobApplicationDaoImpl;
import com.city.watch.db.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class DeleteJobApplicationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteJobApplicationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          HttpSession session=request.getSession();
          String redirect=request.getParameter("rd");
          int id=Integer.parseInt(request.getParameter("id"));
          
          try {
        	  JobApplicationDaoImpl dao=new JobApplicationDaoImpl(ConnectionProvider.getConnection());
        	  boolean f=dao.deleteJobApplicationById(id);
        	  if(f) {
   				session.setAttribute("alertMessage","Job Application Deleted Successfully...");
   				session.setAttribute("alertClass", "alert-success");
   				if(redirect.equals("us")) {
   					response.sendRedirect("user_job_applications.jsp");
   				}else {
   					response.sendRedirect("admin/applied_applications.jsp");
   				}
   				
   		   }else {
   			   session.setAttribute("alertMessage","Something Went Wrong... Please try again...");
   			   session.setAttribute("alertClass","alert-danger");
   			   if(redirect.equals("us")) {
					response.sendRedirect("user_job_applications.jsp");
				}else {
					response.sendRedirect("admin/applied_applications.jsp");
				}
        	  
		   }
          }catch (Exception e) {
			e.printStackTrace();
			if(redirect.equals("us")) {
					response.sendRedirect("user_job_applications.jsp");
				}else {
					response.sendRedirect("admin/applied_applications.jsp");
				}
		}

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
