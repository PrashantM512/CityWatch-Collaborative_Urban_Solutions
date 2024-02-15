package com.city.watch.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;

import com.city.watch.dao.DevelopmentDaoImpl;
import com.city.watch.db.ConnectionProvider;
import com.city.watch.entity.Development;
import com.city.watch.file.Helper;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@MultipartConfig
public class UpdateDevelopmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateDevelopmentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
	        int pid = Integer.parseInt(request.getParameter("pid"));
	        String title = request.getParameter("title");
	        String description = request.getParameter("description");
	        String location = request.getParameter("address"); // Use consistent name
	        String startDate = request.getParameter("sdate");
	        String endDate = request.getParameter("edate");
	        String status = request.getParameter("status");
	        String need = request.getParameter("need");
	        Part photoPart = request.getPart("photo"); // Handle null case
	        String photoName = photoPart != null ? photoPart.getSubmittedFileName() : "";
	        String redirect = request.getParameter("rd");

		
		System.out.println(pid+" "+title+" "+description+" "+location+" "+startDate+" "+endDate+" "+status+" "+need+" "+photoName);
	    Development dev = new Development(title, description, location, startDate, endDate, status, need, photoName);
	        try {
			DevelopmentDaoImpl dao=new DevelopmentDaoImpl(ConnectionProvider.getConnection());
	        boolean f=dao.updateDevelopmentById(pid, dev);
	        
	        if(f){
	        	String path = getServletContext().getRealPath("/") + "developments_img" + File.separator + photoName;
				Helper.saveFile(photoPart.getInputStream(), path);
				session.setAttribute("alertMessage","Development Updated SuccessFully...");
				session.setAttribute("alertClass", "alert-success");
				if (redirect != null && redirect.equals("dept")) {
					response.sendRedirect("department/manage_devlopments.jsp");
				} else {
					response.sendRedirect("admin/manage_devlopments.jsp");
				}
				
			} else {
				session.setAttribute("alertMessage","Development Update Failed...");
				session.setAttribute("alertClass", "alert-danger");
				if (redirect != null && redirect.equals("dept")) {
					response.sendRedirect("department/manage_devlopments.jsp");
				} else {
					response.sendRedirect("admin/manage_devlopments.jsp");
				}
			}
			
		} catch (Exception e) {
		    e.printStackTrace();
		    session.setAttribute("alertMessage","Something Went Wrong...");
			session.setAttribute("alertClass", "alert-danger");
			if (redirect != null && redirect.equals("dept")) {
				response.sendRedirect("department/manage_devlopments.jsp");
			} else {
				response.sendRedirect("admin/manage_devlopments.jsp");
			}
		}
		doGet(request, response);
	}

}
