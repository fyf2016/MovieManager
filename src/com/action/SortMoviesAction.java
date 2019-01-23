package com.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.Movie;
import com.service.MovieService;
import com.service.impl.MovieServiceImpl;

public class SortMoviesAction extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
	
		String order = request.getParameter("order");
		String type  = request.getParameter("type");
		
		HttpSession session = request.getSession();
		MovieService movieService = new MovieServiceImpl();
	
		if(type==null) {
			List<Movie> queryMoviesByCondition = movieService.queryMoviesByOrder(order);
			session.setAttribute("ContidionMovie", queryMoviesByCondition);
		}else{
			List<Movie> queryMoviesByType = movieService.queryMovieByType(type, order);
			session.setAttribute("ContidionMovie", queryMoviesByType);
		}
		
		session.setAttribute("sortOrder", order);
		session.setAttribute("sortType", type);
		
		response.sendRedirect("/MovieManager/movieList.jsp");
	}

}
