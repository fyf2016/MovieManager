package com.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.Cinema;
import com.entity.SeatUtil;
import com.service.CinemaService;
import com.service.SessionService;
import com.service.impl.CinemaServiceImpl;
import com.service.impl.SessionServiceImpl;

public class QueryMovieSessionAction extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		SessionService sessionService = new SessionServiceImpl();
		CinemaService cinemaService = new CinemaServiceImpl();
		HttpSession session = request.getSession();
		SeatUtil seat = new SeatUtil();
		int cinemaId = Integer.parseInt(request.getParameter("cinemaId"));
		int movieId = Integer.parseInt(request.getParameter("movieId"));
		seat.setCinema_Id(cinemaId);
		seat.setMovie_Id(movieId);
		
		List queryMovieSession = sessionService.queryMovieSession(seat);
		Cinema queryCinemaById = cinemaService.queryCinemaById(cinemaId);
		session.setAttribute("movieSession", queryMovieSession);
		session.setAttribute("SingleCinema", queryCinemaById);
		
		response.sendRedirect("/MovieManager/selectSeat.jsp");
	}
	
}
