package com.city.watch.servlet;

import java.io.IOException;
import com.city.watch.dao.IssueDaoImpl;
import com.city.watch.db.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class IssueProgressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public IssueProgressServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
       int id=Integer.parseInt(request.getParameter("id"));
       String progress=request.getParameter("prg");
       String redirect=request.getParameter("rd");
        
        try {
			IssueDaoImpl dao=new IssueDaoImpl(ConnectionProvider.getConnection());
			boolean f=dao.updateIssueProgrss(id, progress);
			
			if(f) {
				session.setAttribute("alertMessage","Operation Successful...");
				session.setAttribute("alertClass","alert-success");
				
				if (redirect != null && redirect.equals("dept")) {
					response.sendRedirect("department/issues.jsp");
				} else {
					response.sendRedirect("admin/issues.jsp");
				}
			
			}else {
				session.setAttribute("alertMessage","Operation Failed... Please Try Again!!!");
				session.setAttribute("alertClass","alert-danger");
				if (redirect != null && redirect.equals("dept")) {
					response.sendRedirect("department/issues.jsp");
				} else {
					response.sendRedirect("admin/issues.jsp");
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("alertMessage","Something Went Wrong...");
			session.setAttribute("alertClass","alert-danger");
			if (redirect != null && redirect.equals("dept")) {
				response.sendRedirect("department/issues.jsp");
			} else {
				response.sendRedirect("admin/issues.jsp");
			}
		}

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
