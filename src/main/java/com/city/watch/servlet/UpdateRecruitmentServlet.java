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

public class UpdateRecruitmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateRecruitmentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session=request.getSession();
		    int id=Integer.parseInt(request.getParameter("id"));
		    String title=request.getParameter("title");
		    String description=request.getParameter("description");
		    String eDate=request.getParameter("edate");
		    String criteria=request.getParameter("criteria");
		    String cv_need=request.getParameter("need");
		    
		    Recruitment rc=new Recruitment(title,description,eDate,criteria,cv_need);
		    try {
		    	RecruitmentDaoImpl dao=new RecruitmentDaoImpl(ConnectionProvider.getConnection());
		    	boolean f=dao.updateRecruitmentById(id, rc);
		    	
		    	if(f) {
		    		 session.setAttribute("alertMessage","Recruitment Updated Successfully...");
		    		 session.setAttribute("alertClass","alert-success");
		    		 response.sendRedirect("admin/add_recruitment.jsp");
		    	}else {
		    		 session.setAttribute("alertMessage","Failed To Update Recruitment...");
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
