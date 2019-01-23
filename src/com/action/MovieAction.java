package com.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.Cinema;
import com.entity.Movie;
import com.service.CinemaService;
import com.service.MovieService;
import com.service.impl.CinemaServiceImpl;
import com.service.impl.MovieServiceImpl;

public class MovieAction extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String update = request.getParameter("update");
		HttpSession session = request.getSession();
		
		MovieService movieService = new MovieServiceImpl();
	
		List<Movie> allMovies = movieService.queryAllMovies();
		
		session.setAttribute("movie", allMovies);
		
		if("manager".equals(update)) {
			response.sendRedirect("/MovieManager/manager.jsp");
		} else {
			response.sendRedirect("/MovieManager/mainPage.jsp");
		}
		
		
	}
	
}
