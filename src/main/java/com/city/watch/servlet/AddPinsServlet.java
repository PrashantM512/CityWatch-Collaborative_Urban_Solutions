package com.city.watch.servlet;

import java.io.IOException;
import com.city.watch.dao.PinsDaoImpl;
import com.city.watch.db.ConnectionProvider;
import com.city.watch.entity.Pins;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class AddPinsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public AddPinsServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           HttpSession session=request.getSession();   
		
		   String name=request.getParameter("name");
           String category=request.getParameter("category");
           String location=request.getParameter("location");
           String link=request.getParameter("link");
           
          Pins pin=new Pins(name,category,location,link);
         try {
        	 PinsDaoImpl dao=new PinsDaoImpl(ConnectionProvider.getConnection());
	         boolean f= dao.addPin(pin);
	         if(f) {
					session.setAttribute("alertMessage", "Pin Added Successfully...");
					session.setAttribute("alertClass","alert-success");
					response.sendRedirect("admin/add_pins.jsp");
				}else {
					session.setAttribute("alertMessage", "Operation failed... Please Try Agin!!!");
					session.setAttribute("alertClass","alert-danger");
					response.sendRedirect("admin/add_pins.jsp");
				}

		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("alertMessage", "Something Went wrong...");
			session.setAttribute("alertClass","alert-danger");
			response.sendRedirect("admin/add_pins.jsp");
		}

		doGet(request, response);
	}

}
