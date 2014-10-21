<%@ page language="java" import="java.util.*,ruc.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Post.jsp' starting page</title>
    
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
  <%
    HttpSession mysession=request.getSession();
    out.println("你好："+"<br>");
    out.println(((User)mysession.getValue("User")).getName()+"<br>");     
     %> 
     <br>
    可以发布微博啦：<br>
    <form action="servlet/AddPost" name="post" method="post">
    <input id="content" name="content" type="text" style="width: 360px; height: 157px"></input>
    <br>
    <input id="submit" name="submit" value="发布" type="submit">
    </form>
    
    
  </body>
</html>
