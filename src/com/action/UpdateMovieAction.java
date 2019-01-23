package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.Movie;
import com.service.MovieService;
import com.service.impl.MovieServiceImpl;

public class UpdateMovieAction extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		MovieService movieService = new MovieServiceImpl();
		String update = request.getParameter("update");	
		Movie m = new Movie();
		HttpSession session = request.getSession();
		String name = request.getParameter("name");
		String picture = request.getParameter("picture");
		String type = request.getParameter("type");
		String detail = request.getParameter("detail");
		
		
		m.setName(name);
		m.setPicture(picture);
		m.setType(type);
		m.setDetail(detail);
		
		if("modify".equals(update)) {
			String id = request.getParameter("movieid");
			int movieId = Integer.parseInt(id);
			m.setId(movieId);
			boolean modifyMovie = movieService.modifyMovie(m);
			session.setAttribute("modifyMovie", modifyMovie);
		} else if("delete".equals(update)) {
			String id = request.getParameter("movieid");
			int movieId = Integer.parseInt(id);
			
			boolean deleteMovie = movieService.deleteMovie(movieId);
			
		}else if("add".equals(update)) {
			
			boolean addMovie = movieService.addMovie(m);
		}
		response.sendRedirect("/MovieManager/MovieAction?update=manager");
	}

	
}
