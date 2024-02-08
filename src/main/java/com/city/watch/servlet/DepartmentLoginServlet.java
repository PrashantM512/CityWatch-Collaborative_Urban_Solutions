package com.city.watch.servlet;

import java.io.IOException;
import com.city.watch.dao.DepartmentDaoImpl;
import com.city.watch.dao.UserDaoImpl;
import com.city.watch.db.ConnectionProvider;
import com.city.watch.entity.Department;
import com.city.watch.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class DepartmentLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DepartmentLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

         HttpSession session=request.getSession();
         String dept_id=request.getParameter("dept_id");
         String password=request.getParameter("password");
         String check=request.getParameter("check");
         
         if (check == null) {
        	    session.setAttribute("check", "Please Fill Captcha");
        	    response.sendRedirect("department/signin.jsp");
        	} else {
        	    try {
        	        DepartmentDaoImpl dao = new DepartmentDaoImpl(ConnectionProvider.getConnection());
        	        Department dept = dao.loginDepartment(dept_id, password);

        	        if (dept == null) {
        	            session.setAttribute("invalid", "Invalid Department Id or Password");
        	            response.sendRedirect("department/signin.jsp");
        	        } else {
        	            session.setAttribute("dept", dept);
        	            response.sendRedirect("department/index.jsp");
        	        }
        	    } catch (Exception e) {
        	        e.printStackTrace();
        	        session.setAttribute("invalid", "Something Went Wrong");
        	        response.sendRedirect("department/signin.jsp");
        	    }
        	}


		doGet(request, response);
	}

}
