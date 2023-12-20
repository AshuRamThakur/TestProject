<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/allCss.jsp" %>
</head>
<body style="background-color: #ebfcef;">
<%@include file="component/navbar.jsp" %>

<div class="container-fluid">
<div class="row p-3">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h4 class="text-center text-success">Login Page</h4>

<% 
String invalidMsg= (String)session.getAttribute("invalidMsg");
if(invalidMsg!=null)
{%>
<p class="text-danger text-center"><%=invalidMsg%></p>	
<%

session.removeAttribute("invalidMsg");
}
%>




<% 
String logMsg= (String)session.getAttribute("logMsg");
if(logMsg!=null)
{%>
<p class="text-success text-center"><%=logMsg%></p>	
<%

session.removeAttribute("logMsg");
}
%>






<form action="login" method="post">

   <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name="email" type="email" class="form-control" >
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input  name="password" type="password" class="form-control" >
  </div>
  
  <div class="text-center">
  <button type="submit" class="btn btn-primary">Login</button>
  </div>
  
  
</form>



</div>


</div>


</div>


</div>
</div>
<div style="margin-top: 368px">
<%@include file="component/footer.jsp" %>

</div>

</body>
</html>