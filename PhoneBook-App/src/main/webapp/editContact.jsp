<%@page import="com.entity.Contact"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.ContactDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/allCss.jsp" %>
</head>
<body>
<%@include file="component/navbar.jsp" %>

<% 
if(user==null)
{
	session.setAttribute("invalidMsg","Login Please..");
	response.sendRedirect("login.jsp");
	
}

%>



<div class="container-fluid">
<div class="row p-3">
<div class="col-md-6 offset-md-3">
<div class="card">
<div class="card-body">
<h4 class="text-center text-success">Edit Contact Page</h4>

<% 
//String sucMsg =(String)session.getAttribute("sucMsg");
String failedMsg=(String)session.getAttribute("failedMsg");

if(failedMsg!=null)
{
	%>
	<p class="text-danger text-center"><%=failedMsg %></p>
	<%	
	session.removeAttribute("failedMsg");
}
%>

<form action="editContact" method="post">
<% 
int cid=Integer.parseInt(request.getParameter("cid"));
ContactDAO dao= new ContactDAO(DBConnect.getConn());
Contact c =dao.getContactById(cid);

%>
<input type="hidden" value="<%=cid%>" name="cid">

  <div class="form-group">
    <label>Enter Name</label>
    <input name ="name" type="text" class="form-control" value="<%=c.getName() %>" >
  </div>
   <div class="form-group">
    <label>Email address</label>
    <input  name ="email" type="email" class="form-control"  value="<%=c.getEmail()%>">
  </div>
   <div class="form-group">
    <label for="exampleInputEmail1" >Phone No</label>
    <input name="phoneno" type="text" class="form-control" value="<%=c.getPhone()%>">
  </div>
  
  
  <div class="form-group">
  <textarea  name="about" rows="3" cols="" placeholder="Enter About" class="form-control"><%=c.getAbout()%></textarea>
  </div>
  
  
  <div class="text-center mt-2">
  <button type="submit" class="btn btn-primary">Update Contact</button>
  </div>
  
  
</form>



</div>


</div>


</div>


</div>
</div>
</body>
</html>