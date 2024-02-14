package com.city.watch.servlet;

import java.io.IOException;
import com.city.watch.dao.UserDaoImpl;
import com.city.watch.db.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class SendTaxBillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SendTaxBillServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String updt=request.getParameter("updt");
		String taxid=request.getParameter("taxid");
		int amount=Integer.parseInt(request.getParameter("amount"));
		
		try {
			UserDaoImpl dao=new UserDaoImpl(ConnectionProvider.getConnection());
			
			if(updt.equals("p")) {
			   
				boolean f=dao.updateBillByPropertyTaxId(amount, taxid);
				if(f) {
					session.setAttribute("alertMessage","Property Tax Bill Updated Successfully...");
					session.setAttribute("alertClass","alert-success");
					response.sendRedirect("admin/tax_bills.jsp");
				}else {
					session.setAttribute("alertMessage","Property Tax Bill Update Failed... Please Check Tax Id again...");
					session.setAttribute("alertClass","alert-danger");
					response.sendRedirect("admin/tax_bills.jsp");
				}
				
			}else {
				
				boolean f=dao.updateBillByWaterTaxId(amount, taxid);
				if(f) {
					session.setAttribute("alertMessage","Water Tax Bill Updated Successfully...");
					session.setAttribute("alertClass","alert-success");
					response.sendRedirect("admin/tax_bills.jsp");
				}else {
					session.setAttribute("alertMessage","Water Tax Bill Update Failed... Please Check Tax Id again...");
					session.setAttribute("alertClass","alert-danger");
					response.sendRedirect("admin/tax_bills.jsp");
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("alertMessage","Something Went Wrong...");
			session.setAttribute("alertClass","alert-danger");
			response.sendRedirect("admin/tax_bills.jsp");
		}
		
		doGet(request, response);
	}

}
