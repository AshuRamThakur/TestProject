<%@page import="com.entity.User"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.conn.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<%@include file="component/allCss.jsp" %>
<style type="text/css">
.back-img{
background: url("img/phone.jpg");
width: 100%;
height: 80vh;
background-repeat: no-repeat;
background-size: 1600px 700px;
}
</style>
<body>
<%@include file="component/navbar.jsp" %>
<%-- 
<%User u=(User)session.getAttribute("user");
out.println(u);

%> --%>



<div class="container-fluid back-img text-center text-success ">
<h1>Welcome to PhoneBook App</h1>



</div>
<%@include file="component/footer.jsp" %>
</body>
</html>