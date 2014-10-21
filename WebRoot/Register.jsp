<%@ page language="java" import="ruc.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>微博注册界面</title>
<!-- Bootstrap core CSS -->
    <link href="dist/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">
    <style>
body{font-family:"ff-tisa-web-pro-1","ff-tisa-web-pro-2","Lucida Grande","Helvetica Neue",Helvetica,Arial,"Hiragino Sans GB","Hiragino Sans GB W3","WenQuanYi Micro Hei",sans-serif;}
h1, .h1, h2, .h2, h3, .h3, h4, .h4, .lead {font-family:"ff-tisa-web-pro-1","ff-tisa-web-pro-2","Lucida Grande","Helvetica Neue",Helvetica,Arial,"Hiragino Sans GB","Hiragino Sans GB W3","Microsoft YaHei UI","Microsoft YaHei","WenQuanYi Micro Hei",sans-serif;}
pre code { background: transparent; }
@media (min-width: 768px) {
    .bs-docs-home .bs-social, 
    .bs-docs-home .bs-masthead-links {
      margin-left: 0;
    }
}
</style>
</head>
<body>
 <script src="scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
 <script src="scripts/jquery.validate.js" type="text/javascript"></script>
 <script src="scripts/my.js" type="text/javascript"></script>
  <header class="navbar navbar-inverse navbar-fixed-top bs-docs-nav" role="banner">
  <div class="container">
    <div class="navbar-header">
      <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a href="#" class="navbar-brand">微博系统</a>
    </div>
    <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
      <ul class="nav navbar-nav">
        <li  class="active">
          <a href="/MicroBlog/index.jsp">广场</a>
        </li>
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
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

<div class="container">
      <form  id="RegisterForm" name="RegisterForm" class="form-signin" role="form" method="post"  action="servlet/AddUser">
        <h2 class="form-signin-heading">请注册</h2>
        <input  id="name" name="name" type="text" class="form-control" placeholder="用户名" required autofocus>
        <br> 
        <input id="password" name="password" type="password" class="form-control"  placeholder="密码">
         <br>
        <input id="confirm_password" name="confirm_password" type="password" class="form-control"  placeholder="再次确认密码">
        <br>
        <input id="email" name="email" type="text" class="form-control" placeholder="邮箱" required>
        <br>
		<input id="age" name="age" type="text" class="form-control" placeholder="年龄" required>
        <label class="checkbox">
          <input type="checkbox" value="direct_to_mainpage">转向主页
        </label>
        <button class="btn btn-lg btn-primary btn-block" type="submit">注册</button>
      </form>

    </div> <!-- /container -->
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
 
 
 
 
</body>
</html>