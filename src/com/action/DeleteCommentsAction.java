package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.CommentsService;
import com.service.impl.CommentsServiceImpl;

public class DeleteCommentsAction extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		CommentsService cs = new CommentsServiceImpl();
		String commentsId = request.getParameter("commentsId");
		boolean deleteComments = cs.deleteComments(Integer.parseInt(commentsId));
		
		response.sendRedirect("/MovieManager/movieDetail.jsp");
		
	}
	
}
