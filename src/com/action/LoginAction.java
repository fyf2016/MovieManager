package com.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.User;
import com.service.UserService;
import com.service.impl.UserServiceImpl;

public class LoginAction extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json;charset=utf-8");
		HttpSession session = request.getSession();

		String name = request.getParameter("login");
		String pwd = request.getParameter("pwd");
		UserService userService = new UserServiceImpl();
		User user = new User();
		user.setName(name);
		user.setPassword(pwd);
		
		User loginUser = userService.login(user);
		

		
		PrintWriter pw = response.getWriter();
		if(loginUser != null) {
			session.setAttribute("user", loginUser);
			String SuccessJson = "{\"url\": \"Ajax/Login\",\"status\": \"200\",\"responseTime\": 50,"
					+"\"responseText\": {\"Status\":\"ok\",\"Text\":\"登陆成功<br /><br />欢迎您   "+name+"\"}}";

			pw.println(SuccessJson);
		
		}else{
			String ErrorJson = "{\"Erro\": \"账号名或密码有误\",\"status\": \"200\",\"responseTime\": 50,"+"\"Status\":\"Erro\""
					+",\"responseText\": {\"Status\":\"Erro\",\"Erro\":\"账号名或密码有误\"}}";
			pw.println(ErrorJson);
		
		}
		pw.close();
	
	}
}
