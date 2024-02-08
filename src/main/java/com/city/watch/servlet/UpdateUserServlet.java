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

public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public UpdateUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        int uid=Integer.parseInt(request.getParameter("uid"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String enteredPass = request.getParameter("password");
        String gender = request.getParameter("gender");
        String mobile = request.getParameter("mobile");
        String wardNo = request.getParameter("wardNo");
        String propertyId = request.getParameter("propertyId");
        String aadhar = request.getParameter("aadhar");
        String houseId = request.getParameter("houseId");
        String zone = request.getParameter("zone");
        User updatedUser=new User(name,email,mobile,gender,address,aadhar,zone,houseId,wardNo,propertyId);
        
        try {
        	UserDaoImpl dao=new UserDaoImpl(ConnectionProvider.getConnection());
        	User user=dao.getUserById(uid);
        	String originalPass=user.getPassword();
        	if(enteredPass.equals(originalPass)) {
        		boolean f=dao.updateUserById(uid, updatedUser);
        		if(f) {
        			session.setAttribute("alertMessage","Your profile details updated successfully...");
              	    session.setAttribute("alertClass","alert-success");
            		response.sendRedirect("update_profile.jsp");
        		}else {
        			session.setAttribute("alertMessage","Something Went Wrong...");
        			session.setAttribute("alertClass","alert-danger");
            		response.sendRedirect("update_profile.jsp");
        		}
        		
        	}else {
        		session.setAttribute("alertMessage","Your Enterd Password is Incorrect... Please Enter Valid Password!!!");
        		session.setAttribute("alertClass","alert-danger");
        		response.sendRedirect("update_profile.jsp");
        	}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		doGet(request, response);
	}

}
