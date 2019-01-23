package com.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.Movie;
import com.service.MovieService;
import com.service.impl.MovieServiceImpl;

public class FindMovieByIdAction extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("utf-8");
		String update = request.getParameter("update");
		String movieId = request.getParameter("movieId");
		MovieService movieService = new MovieServiceImpl();
		Movie SingleMovie = movieService.findMovieById(Integer.parseInt(movieId));
		HttpSession session = request.getSession();
		session.setAttribute("SingleMovie", SingleMovie);
		
		if("modify".equals(update)) {
			response.sendRedirect("/MovieManager/modify.jsp");
		}else if("detail".equals(update)){
			response.sendRedirect("/MovieManager/QueryCommentsAction?movieId="+movieId);
		}else {
			response.sendRedirect("/MovieManager/FindCinemaByPageAction?pageIndex=0");
		}
		
		
		
		
		
		
	}

	

}
