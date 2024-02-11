package com.city.watch.servlet;

import java.io.IOException;

import com.city.watch.dao.NotificationDaoImpl;
import com.city.watch.db.ConnectionProvider;
import com.city.watch.entity.Notification;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class SendNotificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SendNotificationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        String redirect=request.getParameter("rd");
        String title=request.getParameter("title");
        String description=request.getParameter("description");
        String from=request.getParameter("from");
        String target=request.getParameter("target");
        
        Notification noti=new Notification(title,description,from,target);
        
        try {
			NotificationDaoImpl dao=new NotificationDaoImpl(ConnectionProvider.getConnection());
			boolean f=dao.sendNotification(noti);
			
			if(f) {
				session.setAttribute("alertMessage", "Notification Sent Successfully...");
				session.setAttribute("alertClass","alert-success");
				if (redirect != null && redirect.equals("dept")) {
				    response.sendRedirect("department/notifications.jsp");
				} else {
				    response.sendRedirect("admin/notifications.jsp");
				}
				
			}else {
				session.setAttribute("alertMessage", "Operation failed... Please Try Agin!!!");
				session.setAttribute("alertClass","alert-danger");
				if (redirect != null && redirect.equals("dept")) {
				    response.sendRedirect("department/notifications.jsp");
				} else {
				    response.sendRedirect("admin/notifications.jsp");
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("alertMessage", "Something Went Wrong...");
			session.setAttribute("alertClass","alert-danger");
			if (redirect != null && redirect.equals("dept")) {
			    response.sendRedirect("department/notifications.jsp");
			} else {
			    response.sendRedirect("admin/notifications.jsp");
			}
		}

		doGet(request, response);
	}

}
