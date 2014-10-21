<%@ page language="java"  import="java.util.*,ruc.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>微博广场</title>
<!-- Bootstrap core CSS
   
 -->
  <link href="dist/css/bootstrap.css" rel="stylesheet">
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
      <a href="#" class="navbar-brand">微博系统</a>
    </div>
    <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
      <ul class="nav navbar-nav">
        <li class="active">
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
          <a href="about.jsp">关于</a>
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
        <% 
        if((String)request.getParameter("SearBlog")!=null){
        	PostDAO postdao = new PostDAO();
	    	String SearchBlog = (String)request.getParameter("SearBlog");	     
	    	ArrayList al = new ArrayList<Post>();
			al = postdao.SearchPost(SearchBlog);
       		out.println("<h2> 符合条件的微博:</h2>");
       		out.println("<hr>");
        	for(int i=0;i<al.size();i++){
				out.println("<h3>"+((Post)(al.get(i))).getownername()+"</h3>");
				out.println("<h4>"+((Post)(al.get(i))).getcontent()+"</h4>");
				out.println("<p>"+((Post)(al.get(i))).getbirthday()+"</p>");
				out.println("<hr>");
        	}  
        }
        else
        {
        	UserDAO userdao=new UserDAO();
     		String SearchName=(String)request.getParameter("SearUser");
     
     		ArrayList al=new ArrayList<User>();
			al=userdao.SearchUserName(SearchName);
			out.println("<h2> 符合条件的用户:</h2>");
       		out.println("<hr>");
       		for(int i=0;i<al.size();i++){
				out.println("<a href=\"/MicroBlog/UserInfo.jsp?userid="+((User)al.get(i)).getid()+"\" class=\"btn btn-info\" role=\"button\">"+((User)al.get(i)).getName()+"</a>");
    			out.println("<h4>注册Id:  "+((User)al.get(i)).getid()+"</h4>");
    			out.println("<h4>注册邮箱:  "+((User)al.get(i)).getEmail()+"</h4>");
    			out.println("<h4>年龄:  "+((User)al.get(i)).getAge()+"</h4>");
    
    			int BeViewedUserId=((User)al.get(i)).getid();
				if(request.getSession().getAttribute("LogInUser") == null)
				{
					out.print("<a href=\"servlet/DoFriendShip?FriendId="+BeViewedUserId+"\"  class=\"btn btn-success\" role=\"button\">关注"+"</a><br>");
				}
				else
				{
					int LogInUserId = ((User)request.getSession().getAttribute("LogInUser")).getid();
					if(LogInUserId != BeViewedUserId)
					{
						if(userdao.IsExistFriendShip(LogInUserId, BeViewedUserId))
						{
							out.print("<a href=\"servlet/DoFriendShip?Remove=1&FriendId="+BeViewedUserId+"\" class=\"btn btn-success\" role=\"button\">取消关注"+"</a><br>");	
						}
						else
						{
							out.print("<a href=\"servlet/DoFriendShip?FriendId="+BeViewedUserId+"\"  class=\"btn btn-success\" role=\"button\">关注"+"</a><br>");
						}
					}
				}
    			out.println("<hr>");
    		}
        }     
        %>
        </div>
        <div class="col-md-4">
        	<%@include file="search.jsp"%>
        </div>
      </div>     
      </div>
</body>
</html>