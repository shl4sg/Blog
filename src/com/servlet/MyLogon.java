package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@SuppressWarnings("serial")
public class MyLogon extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String message="";
		request.setCharacterEncoding("utf-8");	
		String name = request.getParameter("userName");
		String pswd = request.getParameter("userPswd");	
		if(name.equals("mr")&&pswd.equals("mrsoft")) {
			message="{'state': '成功', 'result': '0'}";					
		}else {
			message="{'state':'失败','result':'1'}"; 
		}		
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(message);
			
	}

}
