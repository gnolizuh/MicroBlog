<%@ page language="java"  import="java.util.*,ruc.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>关于</title>
<!-- Bootstrap core CSS
   
 -->
  <link href="/MicroBlog/dist/css/bootstrap.css" rel="stylesheet">
    <!-- Custom styles for this template -->
  <!-- <link href="signin.css" rel="stylesheet"> 
    <link href="square.css" rel="stylesheet">
-->  
</head>
<body>
<header class="navbar navbar-inverse navbar-fixed-top bs-docs-nav" role="banner">
  <div class="container">
    <div class="navbar-header">
      <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a href="#" class="navbar-brand disabled">微博系统</a>
    </div>
    <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
      <ul class="nav navbar-nav">
        <li  class="active">
          <a href="/MicroBlog/index.jsp">广场</a>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
               <li>
          <a href="/MicroBlog/Register.jsp">注册</a>
        </li>
      <%
      if((request.getSession()).getValue("LogInUser")!=null){
      out.println("<li>");
      out.println("<a href=\"/MicroBlog/UserInfo.jsp?userid="+((User)(request.getSession()).getValue("LogInUser")).getid()+"\">您好,"+((User)(request.getSession()).getValue("LogInUser")).getName()+"</a>");
      out.println("</li>");
      out.println("<li>");
	  out.println("<a href=\"/MicroBlog/MainPage.jsp\">朋友圈</a>");
	  out.println("</li>");
      out.println("<li>");
      out.println("<a href=\"/MicroBlog/servlet/LogOut\">注销</a>");
      out.println("</li>");
      }
      else{
      out.println("<li>");
      out.println("<a href=\"/MicroBlog/Login.jsp\">登录</a>");
      out.println("</li>");
      }     
       %>
                <li>
          <a href="/MicroBlog/about.jsp">关于</a>
        </li>
      </ul>
    </nav>
  </div>
</header>

<br>
<br>
<br>
<br>
<br>
<br>
<h1 align="center">关于</h1>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<h5 align="center">姓名: 胡子龙</h5>
<br>
<h5 align="center">学号: 2014160033</h5>
<br>
<h4 align="center">功能优化: </h4>
<h5 align="center">&nbsp;&nbsp;&nbsp;&nbsp;1. 广场微博分页功能 </h5>
<h5 align="center">&nbsp;&nbsp;&nbsp;&nbsp;2. "关于"页面修改 </h5>
<h5 align="center">&nbsp;&nbsp;&nbsp;&nbsp;3. 未登录时访问UserInfo.jsp会跳转到登录页面</h5>
<h5 align="center">&nbsp;&nbsp;&nbsp;&nbsp;4. 评论微博功能优化</h5>
<h5 align="center">&nbsp;&nbsp;&nbsp;&nbsp;5. 修复未登录时搜索用户会报错</h5>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<h6 align="center">中国人民大学信息学院</h6>
</body>
</html>
