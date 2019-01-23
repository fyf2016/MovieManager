package com.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.Comments;
import com.entity.CommentsUtil;
import com.service.CommentsService;
import com.service.impl.CommentsServiceImpl;

public class QueryCommentsAction extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		String movieId = request.getParameter("movieId");
		
		int id = Integer.parseInt(movieId);
		
		CommentsService commentsService = new CommentsServiceImpl();
		String update = request.getParameter("update");
		
		if("add".equals(update)) {
		
			String userId = request.getParameter("userId");
			String NewComments = request.getParameter("NewComments");
			Comments comments = new Comments();
			comments.setUser_id(Integer.parseInt(userId));
			comments.setComments(NewComments);
			comments.setMovie_id(id);
			boolean addComments = commentsService.addComments(comments);
			
		}else if("delete".equals(update)) {
			
			String commentsId = request.getParameter("commentsId");
			boolean deleteComments = commentsService.deleteComments(Integer.parseInt(commentsId));
		}else if("update".equals(update)) {
			
			String commentsId = request.getParameter("commentsId");
			
			String NewComments = request.getParameter("NewComments");
			
			boolean updateComments = commentsService.updateComments(Integer.parseInt(commentsId), NewComments);
			
		}
		
		List<CommentsUtil> queryThreeTableData = commentsService.queryThreeTableData(id);
		
		session.setAttribute("comments", queryThreeTableData);
		
		response.sendRedirect("/MovieManager/movieDetail.jsp");
	}
	
}
