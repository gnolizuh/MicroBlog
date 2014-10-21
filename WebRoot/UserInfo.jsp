<%@ page language="java" import="java.util.*,java.util.ArrayList,ruc.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>微博个人主页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
   <link href="dist/css/bootstrap.css" rel="stylesheet">
      <script type="text/javascript" src="dist/js/jquery.js"></script>  
   <script type="text/javascript" src="dist/js/bootstrap.js"></script>
 
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
          <a href="about.jsp">关于</a>
        </li>
      </ul>
    </nav>
  </div>
</header>
<br>
<br>
<br>
<div class="container">
   
<div class="col-md-8">
<%
if(request.getParameter("userid") == null)
{
    out.println("<script>window.location.href='/MicroBlog/Login.jsp';</script>");
    return;
}

if(session.getAttribute("LogInUser") == null)
{
	out.println("<script>window.location.href='/MicroBlog/Login.jsp';</script>");
    return;
}

int userid = Integer.parseInt(request.getParameter("userid"));
UserDAO userdao = new UserDAO();
User user = userdao.GetUserFromId(userid);
if(user == null)
{
    out.println("<script>window.location.href='/MicroBlog/Login.jsp';</script>");
    return;
}

out.println("<h2>"+user.getName()+"最近发布的微博</h2>");
out.println("<hr>");                    
ArrayList circlepostlist=new ArrayList<Post>();
circlepostlist=userdao.GetOwnPost(user);
for(int i=0;i<circlepostlist.size();i++)
{
    out.println("<h4>"+((Post)(circlepostlist.get(i))).getcontent()+"</h4>");
    out.println("<p>"+((Post)(circlepostlist.get(i))).getbirthday()+"</p>");
    ArrayList commentlist=new ArrayList<Comment>();
    PostDAO postdao=new PostDAO();
    commentlist=postdao.GetAllComment(((Post)(circlepostlist.get(i))).getidpost());
    java.util.Random r=new java.util.Random(); 
    int tmp=r.nextInt();
    out.println("<div  class=\"row\">");
    out.println("<button class=\"btn btn-link\"   data-toggle=\"collapse\" data-target=\"#comment"+tmp+"\">"+((Post)(circlepostlist.get(i))).getcomnum()+"条评论</button>");
    out.println("<div id=\"comment"+tmp+"\" class=\"collapse\">");
    for(int j=0;j<commentlist.size();j++)
    {
        Comment comtmp=(Comment)(commentlist.get(j));
	out.println("<h4>"+comtmp.GetContent()+"</h4>");
	out.println("<p>"+comtmp.GetWhocommentName()+"     "+comtmp.GetBirthday()+"</p>");
    }
    out.println("</div> ");
    out.println("</div>");
    out.println("<div  class=\"row\">");
    out.println("<button class=\"btn btn-link\"   data-toggle=\"collapse\" data-target=\"#reply"+tmp+"\">回复</button>");
    out.println("<div id=\"reply"+tmp+"\" class=\"collapse\">");
    out.println("<form role=\"form\" action=\"/MicroBlog/servlet/AddComment\" name=\"Commentform\" method=\"post\">");
    out.println("<form type=\"hidden\" name=\"postid\" value=\""+((Post)(circlepostlist.get(i))).getidpost()+"\"> ");
    out.println("<div class=\"form-group\">");
    out.println("<textarea id=\"comment\" name=\"comment\" class=\"form-control\" rows=\"3\" placeholder=\"可以回复给小伙伴哦\" required></textarea>");
    out.println("<input type=\"hidden\" name=\"postid\" value=\""+((Post)(circlepostlist.get(i))).getidpost()+"\"> ");
    out.println("<button type=\"submit\" class=\"btn  btn-info\">回复</button>");
    out.println("</div>");
    out.println("</form>");
    out.println("</div> ");
    out.println("</div> ");
    out.println("<hr>");
}
%>
</div>
<div class="col-md-4">
<%
    out.println("<h3>"+user.getName()+":</h3>");
    out.println("<h4>注册ID:  "+user.getid()+"</h4>");
    out.println("<h4>注册邮箱:  "+user.getEmail()+"</h4>");
    out.println("<h4>年龄:  "+user.getAge()+"</h4>");
    int LogInUserId=((User)session.getAttribute("LogInUser")).getid();
    int BeViewedUserId=user.getid();
    if(LogInUserId!=BeViewedUserId)
    {
        if(userdao.IsExistFriendShip(LogInUserId, BeViewedUserId))
	{
	    out.print("<a href=\"servlet/DoFriendShip?Remove=1&FriendId="+BeViewedUserId+"\">取消关注"+"</a><br>");
	}
	else
	{
	    out.print("<a href=\"servlet/DoFriendShip?FriendId="+BeViewedUserId+"\">关注"+"</a><br>");
	}
    }
%>
<hr>
<%
    ArrayList FriendList=new ArrayList<User>();
    FriendList=userdao.GetFriendList(user);
    ArrayList FollowerList=new ArrayList<User>();
    FollowerList=userdao.GetFollowerList(user);
    out.println("<h4>关注:</h4>");
    for(int i=0;i<FriendList.size();i++)
    {
        out.println("<a href=\"/MicroBlog/UserInfo.jsp?userid="+((User)(FriendList.get(i))).getid()+"\">"+((User)(FriendList.get(i))).getName()+"</a><br>");
    }
    out.println("<h4>粉丝:</h4>");
    for(int i=0;i<FollowerList.size();i++)
    {
        out.println("<a href=\"/MicroBlog/UserInfo.jsp?userid="+((User)(FollowerList.get(i))).getid()+"\">"+((User)(FollowerList.get(i))).getName()+"</a><br>");
    }
%>
<hr>                 
<%@include file="search.jsp" %>
  
</div>
</div>
      
      
      
      
      
      
 
      
      
      
      
      
      
      
      

  </body>
</html>
