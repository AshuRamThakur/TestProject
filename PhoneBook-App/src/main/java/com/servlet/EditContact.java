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

@WebServlet("/editContact")
public class EditContact extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		    
		    int cid=Integer.parseInt(req.getParameter("cid"));	
		    String name=req.getParameter("name");
			String email=req.getParameter("email");
			String phoneno=req.getParameter("phoneno");
			String about=req.getParameter("about");
		
			Contact c= new Contact();
			c.setId(cid);
			c.setName(name);;
			c.setEmail(email);
			c.setPhone(phoneno);
			c.setAbout(about);
			ContactDAO dao= new ContactDAO(DBConnect.getConn());

			HttpSession session= req.getSession();
			boolean f=dao.updateContact(c);
		    if(f)
			{
				session.setAttribute("sucMsg","Your Contact Updated Successfully..");
				resp.sendRedirect("viewContact.jsp");
			}else {
				session.setAttribute("failedMsg","Something Went Wrong On Server");
				resp.sendRedirect("editContact.jsp?cid="+cid);
			}
	}

	
}
