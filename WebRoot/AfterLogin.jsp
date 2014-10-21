<%@ page language="java" import="java.util.*,ruc.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AfterLogin.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    登录成功！！！ <br>
    <%
    HttpSession mysession=request.getSession();
    out.println("用户名是："+"<br>");
    out.println(((User)mysession.getValue("User")).getName()+"<br>");     
     %> 
     <br>
     <a href="servlet/IsUserLogin"> 发微博？  </a> 
  </body>
</html>
