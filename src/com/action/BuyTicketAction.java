package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.Ticket;
import com.service.TicketService;
import com.service.impl.TicketServiceImpl;

public class BuyTicketAction extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String userId = request.getParameter("userId");
		String sessionId = request.getParameter("sessionId");
		String hallId = request.getParameter("hallId");
		String seat = request.getParameter("seat");
		Ticket t = new Ticket();
		t.setUserId(Integer.parseInt(userId));
		t.setSessionId(Integer.parseInt(sessionId));
		t.setHallId(Integer.parseInt(hallId));
		t.setSeat(seat);
		TicketService ticketService = new TicketServiceImpl();
		boolean addTicket = ticketService.addTicket(t);
	
		response.sendRedirect("/MovieManager/mainPage.jsp");
	}

	

}
