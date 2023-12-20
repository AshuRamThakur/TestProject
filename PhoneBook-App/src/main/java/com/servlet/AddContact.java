package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnect;
import com.dao.ContactDAO;
import com.entity.Contact;

@WebServlet("/addContact")
public class AddContact extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    int userid=Integer.parseInt(req.getParameter("userid"));
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String phoneno=req.getParameter("phoneno");
		String about=req.getParameter("about");
		
	   // System.out.println(userid+" "+name+" "+email+" "+phoneno+" "+about);
		Contact c= new Contact(name,email,phoneno,about,userid);
		ContactDAO dao= new ContactDAO(DBConnect.getConn());
		
		HttpSession session= req.getSession();
		boolean f = dao.saveContact(c);
		
		if(f)
		{
			session.setAttribute("sucMsg","Your Contact Saved");
			resp.sendRedirect("addContact.jsp");
		}else {
			session.setAttribute("failedMsg","Something Went Wrong On Server");
			resp.sendRedirect("addContact.jsp");
		}
		
	}
	
	

}
