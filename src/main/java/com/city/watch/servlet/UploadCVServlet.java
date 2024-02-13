package com.city.watch.servlet;

import java.io.File;
import java.io.IOException;

import com.city.watch.dao.UserDaoImpl;
import com.city.watch.db.ConnectionProvider;
import com.city.watch.file.Helper;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@MultipartConfig
public class UploadCVServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UploadCVServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        int id=Integer.parseInt(request.getParameter("id"));
        Part part=request.getPart("cv");
        String cv=part.getSubmittedFileName();
       
        try {
		   UserDaoImpl dao=new UserDaoImpl(ConnectionProvider.getConnection());
		   boolean f=dao.updateCvById(id, cv);
		   
		   if(f) {
			    String path = getServletContext().getRealPath("/") + "pdf_files" + File.separator + cv;
				Helper.saveFile(part.getInputStream(), path);
				session.setAttribute("alertMessage","Your CV uploaded SuccessFully...");
				session.setAttribute("alertClass", "alert-success");
				response.sendRedirect("recruitments.jsp");
				System.out.println(path);
		   }else {
			   session.setAttribute("alertMessage","Something Went Wrong... Please try again...");
			   session.setAttribute("alertClass","alert-danger");
			   response.sendRedirect("upload_cv.jsp");
		   }
		   
		} catch (Exception e) {
		   e.printStackTrace();
		   session.setAttribute("alertMessage","Something Went Wrong... Please try again...");
		   session.setAttribute("alertClass","alert-danger");
		   response.sendRedirect("upload_cv.jsp");
		}
  
		
		doGet(request, response);
	}

}
