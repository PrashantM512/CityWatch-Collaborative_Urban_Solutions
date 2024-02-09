package com.city.watch.servlet;

import java.io.File;
import java.io.IOException;

import com.city.watch.dao.IssueDaoImpl;
import com.city.watch.db.ConnectionProvider;
import com.city.watch.entity.Issue;
import com.city.watch.file.Helper;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;


@MultipartConfig
public class SubmitIssueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SubmitIssueServlet() {
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
		Part part=request.getPart("photo");
		String photoName=part.getSubmittedFileName();
		String type=request.getParameter("type");
		int userId=Integer.parseInt(request.getParameter("uid"));
		
		Issue issue=new Issue(title,description,photoName,type,userId);
		
		try {
			IssueDaoImpl dao=new IssueDaoImpl(ConnectionProvider.getConnection());
			boolean f=dao.addIssue(issue);
			if (f) {
				String path = getServletContext().getRealPath("/") + "issues_img" + File.separator + photoName;
				Helper.saveFile(part.getInputStream(), path);
				session.setAttribute("alertMessage","Your Issue Subbmitted SuccessFully...");
				session.setAttribute("alertClass", "alert-success");
				response.sendRedirect("issues.jsp");
				System.out.println(path);
			} else {
				session.setAttribute("alertMessage","Issue Submission Failed...");
				session.setAttribute("alertClass", "alert-danger");
				response.sendRedirect("issues.jsp");
			}
		
			
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("alertMessage","Issue Submission Failed...");
			session.setAttribute("alertClass", "alert-danger");
			response.sendRedirect("issues.jsp");
		}
		
		
		doGet(request, response);
	}

}
