<%@ page language="java"  import="java.util.*,ruc.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.page_control{color: rgb(136, 136, 136); background-color: rgb(238, 238, 238); cursor: pointer;}
.page_show{color: rgb(136, 136, 136); background-color: rgb(238, 238, 238);}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>微博广场</title>
  <link href="/MicroBlog/dist/css/bootstrap.css" rel="stylesheet">
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

<div class="container">
<br>
<br> 
<br>
<br>
<br> 
<br>      
	<div class="row">
	<div class="col-md-8">
       <h2> 近期的热门微博:</h2>
       <hr>
        <%
        int total_page = 0;
        int rpage = 1;
		if(request.getParameter("page") != null){
			rpage = Integer.parseInt(request.getParameter("page"));
		}

        ArrayList<Post> postlist=new ArrayList<Post>();
        PostDAO postdao = new PostDAO();
        postlist = postdao.GetGlobalLatestPost(rpage);
        total_page = postdao.GetTotalPage();
        for(int i=0;i<postlist.size();i++){
			out.println("<h3>"+((Post)(postlist.get(i))).getownername()+"</h3>");
			out.println("<h4>"+((Post)(postlist.get(i))).getcontent()+"</h4>");
			out.println("<p>"+((Post)(postlist.get(i))).getbirthday()+"</p>");
			out.println("<hr>");
        }
        %>

		<div>
       	<a class="page_control" <% out.println("href=\"/MicroBlog/index.jsp?page=" + ((rpage - 1) > 1 ? (rpage - 1) : 1) + "\""); %>>
       	上一页
       	</a>
       	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       	<a class="page_show">
       	<% out.println(String.valueOf(rpage)); %>
       	</a>
       	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       	<a class="page_control" <% out.println("href=\"/MicroBlog/index.jsp?page=" + ((rpage + 1) < total_page ? (rpage + 1) : total_page) + "\""); %>>
       	下一页
       	</a>
       	</div>
        </div>

        <div class="col-md-4">
              <%@include file="search.jsp" %>
        </div>

      </div>
      </div>
</body>

</html>