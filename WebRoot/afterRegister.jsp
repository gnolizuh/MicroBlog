<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="user" scope="page" class="ruc.User" />
<jsp:setProperty name="user" property="*" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册界面</title>
    
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
  
  恭喜您：
 
注册成功！<br><br>

  您的注册信息如下：<br><br>

登录账号:<jsp:getProperty property="name" name="user"/><br><br>
登录密码:<jsp:getProperty property="password" name="user"/><br><br>
电子邮箱:<jsp:getProperty property="email" name="user"/><br><br>



  </body>
</html>
