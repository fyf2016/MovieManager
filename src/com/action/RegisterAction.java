package com.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.User;
import com.service.UserService;
import com.service.impl.UserServiceImpl;

public class RegisterAction extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json;charset=utf-8");
		
		User user = new User();
		UserService userService = new UserServiceImpl();
		String uname = request.getParameter("login");
		String upass = request.getParameter("pwd");
		String email = request.getParameter("code");
		
		user.setName(uname);
		user.setPassword(upass);
		user.setEmail(email);
		user.setRole(0);
		
		boolean register = userService.register(user);
		
		PrintWriter pw = response.getWriter();
		if(register==true) {
			
			String SuccessJson = "{\"url\": \"Ajax/Login\",\"status\": \"200\",\"responseTime\": 50,"
					+"\"responseText\": {\"Status\":\"ok\",\"Text\":\"注册成功<br /><br />恭喜您您   "+uname+"\"}}";

			pw.println(SuccessJson);
		
		}else{
			String ErrorJson = "{\"Erro\": \"注册失败\",\"status\": \"200\",\"responseTime\": 50,"+"\"Status\":\"Erro\""
					+",\"responseText\": {\"Status\":\"Erro\",\"Erro\":\"注册失败\"}}";
			pw.println(ErrorJson);
		
		}
		pw.close();
		
		
		
	}

	

}
