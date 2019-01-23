package com.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.Cinema;
import com.entity.Page;
import com.service.CinemaService;
import com.service.impl.CinemaServiceImpl;

public class FindCinemaByPageAction extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		String pageIndex = request.getParameter("pageIndex");
	
		CinemaService cinemaService = new CinemaServiceImpl();
		
		Page page = new Page(Integer.valueOf(pageIndex),5);
		List<Cinema> queryAllCinemas = cinemaService.queryAllCinemas();
		page.setTotalRecord(queryAllCinemas.size());
		int totalPage = page.getTotalPage();
		int pageNum = page.getPageIndex();
		List<Cinema> findCinemaByPage = cinemaService.findCinemaByPage(page);
		
		if(findCinemaByPage==null) {
			System.out.println("查询结果为空!");
		}
		
		session.setAttribute("cinemaPage", findCinemaByPage);
		session.setAttribute("totalPage", totalPage);
		session.setAttribute("pageNum", pageNum);
	
		response.sendRedirect("/MovieManager/buyTickets.jsp");
	}

	
}
