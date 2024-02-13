package com.city.watch.servlet;

import java.io.File;
import java.io.IOException;

import com.city.watch.dao.JobApplicationDaoImpl;
import com.city.watch.db.ConnectionProvider;
import com.city.watch.entity.JobApplication;
import com.city.watch.file.Helper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class ApplyJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ApplyJobServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        int recruitmentId=Integer.parseInt(request.getParameter("rid"));
        int userId=Integer.parseInt(request.getParameter("uid"));
        
        JobApplication app=new JobApplication(recruitmentId,userId);
        try {
        	JobApplicationDaoImpl dao=new JobApplicationDaoImpl(ConnectionProvider.getConnection());
        	boolean f=dao.applayForJob(recruitmentId, userId);
        	
        	 if(f) {
 				session.setAttribute("alertMessage","Applied Successfully...");
 				session.setAttribute("alertClass", "alert-success");
 				response.sendRedirect("recruitments.jsp");
 				
 		   }else {
 			   session.setAttribute("alertMessage","Something Went Wrong... Please try again...");
 			   session.setAttribute("alertClass","alert-danger");
 			   response.sendRedirect("recruitments.jsp");
 		   }
        	
		} catch (Exception e) {
			e.printStackTrace();
			   session.setAttribute("alertMessage","Something Went Wrong... Please try again...");
			   session.setAttribute("alertClass","alert-danger");
			   response.sendRedirect("recruitments.jsp");
		}
         
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
