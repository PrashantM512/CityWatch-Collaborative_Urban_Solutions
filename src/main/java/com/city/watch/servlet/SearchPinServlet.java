package com.city.watch.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.city.watch.dao.PinsDaoImpl;
import com.city.watch.db.ConnectionProvider;
import com.city.watch.entity.Pins;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class SearchPinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SearchPinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
		String key=request.getParameter("key");
        try {
			PinsDaoImpl dao=new PinsDaoImpl(ConnectionProvider.getConnection());
		    List<Pins> list=new ArrayList<Pins>();
			list=dao.getSearchedPins(key);
			session.setAttribute("SearchList", list);
			response.sendRedirect("searched_pins.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		doGet(request, response);
	}

}
