package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnect;
import com.dao.UserDAO;
import com.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		
		System.out.println(email+" "+password);
		UserDAO dao = new UserDAO(DBConnect.getConn());
		
		User u = dao.loginUser(email, password);
		
		
		HttpSession session = req.getSession();
		if(u!=null)
		{
			session.setAttribute("user",u);
			resp.sendRedirect("index.jsp");
			//System.out.println("User is available"+u);
		}else {
			session.setAttribute("invalidMsg","Invalid Email & Password");
			resp.sendRedirect("login.jsp");
			//System.out.println("user is not available"+u);
		}
		
		
		
	}
	
	


}
