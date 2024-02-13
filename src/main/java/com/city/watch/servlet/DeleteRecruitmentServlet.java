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

public class DeleteRecruitmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteRecruitmentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        int id=Integer.parseInt(request.getParameter("id"));
        try {
			RecruitmentDaoImpl dao=new RecruitmentDaoImpl(ConnectionProvider.getConnection());
		    boolean f=dao.deleteRecruitmentById(id);
		    
		    if(f) {
	    		 session.setAttribute("alertMessage","Recruitment Deleted Successfully...");
	    		 session.setAttribute("alertClass","alert-success");
	    		 response.sendRedirect("admin/add_recruitment.jsp");
	    	}else {
	    		 session.setAttribute("alertMessage","Failed To Delete Recruitment...");
	    		 session.setAttribute("alertClass","alert-danger");
	    		 response.sendRedirect("admin/add_recruitment.jsp");	
	    	}
			
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("alertMessage","Something Went Wrong...");
   		    session.setAttribute("alertClass","alert-danger");
   	    	 response.sendRedirect("admin/add_recruitment.jsp");	
		}
        
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
