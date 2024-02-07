package com.city.watch.servlet;

import java.io.IOException;

import com.city.watch.dao.UserDaoImpl;
import com.city.watch.db.ConnectionProvider;
import com.city.watch.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         HttpSession session=request.getSession();
         
         String name=request.getParameter("name");
         String email=request.getParameter("email");
         String mobile=request.getParameter("mobile");
         String gender=request.getParameter("gender");;
         String aadhar=request.getParameter("aadhar");;
         String zone=request.getParameter("zone");
         String password=request.getParameter("password");
         String check=request.getParameter("check");
         
        if(check==null) {
        	  session.setAttribute("check_error","Please Accept Terms & Conditions...");
        	  response.sendRedirect("register.jsp");
        }else {
        	
        	try {
        		UserDaoImpl dao=new UserDaoImpl(ConnectionProvider.getConnection());
            	boolean f=dao.checkUserWithEmail(email);
        		if(f) {
        			session.setAttribute("exist","Email already exist... Please try another...");
                	response.sendRedirect("register.jsp");
        		}else {
        			User user=new User(name,email,mobile,gender,aadhar,zone,password);
                	dao.registerUser(user);
                	session.setAttribute("registered","Successfully Registerd...");
                	response.sendRedirect("login.jsp");
        		}
        		
			} catch (Exception e) {
				e.printStackTrace();
				session.setAttribute("failed","Something Went Wrong...");
            	response.sendRedirect("register.jsp");
			}
        	
        }
         
		doGet(request, response);
	}

}
