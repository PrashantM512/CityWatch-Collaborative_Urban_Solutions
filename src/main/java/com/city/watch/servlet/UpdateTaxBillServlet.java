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

public class UpdateTaxBillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateTaxBillServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String updt=request.getParameter("updt");
		User user=(User)session.getAttribute("user");
		String propertyTaxId=user.getProperty_id();
		String houseId=user.getHouse_id();
		int amount=0;
		
		System.out.println(updt+" "+propertyTaxId+" "+houseId);
		
		try {
			UserDaoImpl dao=new UserDaoImpl(ConnectionProvider.getConnection());
			
			if(updt.equals("p")) {
			   
				boolean f=dao.updateBillByPropertyTaxId(amount,propertyTaxId);
				if(f) {
					session.setAttribute("alertMessage","Property Tax Bill Updated Successfully...");
					session.setAttribute("alertClass","alert-success");
					response.sendRedirect("payment_success.jsp");
				}else {
					session.setAttribute("alertMessage","Property Tax Bill Update Failed...");
					session.setAttribute("alertClass","alert-danger");
					response.sendRedirect("payment_success.jsp");
				}
				
			}else {
				
				boolean f=dao.updateBillByWaterTaxId(amount, houseId);
				if(f) {
					session.setAttribute("alertMessage","Water Tax Bill Updated Successfully...");
					session.setAttribute("alertClass","alert-success");
					response.sendRedirect("payment_success.jsp");
				}else {
					session.setAttribute("alertMessage","Water Tax Bill Update Failed...");
					session.setAttribute("alertClass","alert-danger");
					response.sendRedirect("payment_success.jsp");
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("alertMessage","Something Went Wrong...");
			session.setAttribute("alertClass","alert-danger");
			response.sendRedirect("payment_success.jsp");
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}