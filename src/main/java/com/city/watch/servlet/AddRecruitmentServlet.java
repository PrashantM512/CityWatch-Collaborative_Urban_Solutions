package com.city.watch.servlet;

import java.io.IOException;

import com.city.watch.dao.RecruitmentDaoImpl;
import com.city.watch.db.ConnectionProvider;
import com.city.watch.entity.Recruitment;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AddRecruitmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public AddRecruitmentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session=request.getSession();
	    String title=request.getParameter("title");
	    String description=request.getParameter("description");
	    String eDate=request.getParameter("edate");
	    String criteria=request.getParameter("criteria");
	    String cv_need=request.getParameter("need");
	    
	    Recruitment rc=new Recruitment(title,description,eDate,criteria,cv_need);
	    try {
	    	RecruitmentDaoImpl dao=new RecruitmentDaoImpl(ConnectionProvider.getConnection());
	    	boolean f=dao.addRecruitment(rc);
	    	
	    	if(f) {
	    		 session.setAttribute("alertMessage","Recruitment Added Successfully...");
	    		 session.setAttribute("alertClass","alert-success");
	    		 response.sendRedirect("admin/add_recruitment.jsp");
	    	}else {
	    		 session.setAttribute("alertMessage","Failed To Add Recruitment...");
	    		 session.setAttribute("alertClass","alert-danger");
	    		 response.sendRedirect("admin/add_recruitment.jsp");	
	    	}
	    	
		} catch (Exception e) {
			e.printStackTrace();
			 session.setAttribute("alertMessage","Something Went Wrong...");
    		 session.setAttribute("alertClass","alert-danger");
    		 response.sendRedirect("admin/add_recruitment.jsp");
		}
		
		doGet(request, response);
	}

}
