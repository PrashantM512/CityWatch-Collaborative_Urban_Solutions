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

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public LoginServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          HttpSession session=request.getSession();
          String email=request.getParameter("email");
          String password=request.getParameter("password");
          String check=request.getParameter("check");
          
          if(check==null) {
        	  session.setAttribute("alertMessage","Please Fill Captcha...");
        	  session.setAttribute("alertClass","alert-warning");
        	  response.sendRedirect("login.jsp");
          }else {
        	  
          
        	 try {
        		 UserDaoImpl dao=new UserDaoImpl(ConnectionProvider.getConnection());
           	  User user=new User();
           	  user=dao.loginUser(email, password);
           	  if(user==null) {
           		  session.setAttribute("alertMessage","Invalid Email or Password...");
   	        	  session.setAttribute("alertClass","alert-danger");
              	      response.sendRedirect("login.jsp");
           	  }else {
           		  session.setAttribute("user", user);
               	  response.sendRedirect("index.jsp");
           	  }
			} catch (Exception e) {
				e.printStackTrace();
				session.setAttribute("alertMessage","Something Went Wrong...");
 	        	 session.setAttribute("alertClass","alert-danger");
			}
        	 
          }

		doGet(request, response);
	}

}
