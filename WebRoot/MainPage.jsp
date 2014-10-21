<%@ page language="java" import="java.util.*,java.util.ArrayList,ruc.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>微博主页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
   <link href="dist/css/bootstrap.css" rel="stylesheet">
      <script type="text/javascript" src="dist/js/jquery.js"></script>  
   <script type="text/javascript" src="dist/js/bootstrap.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.paginate.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css" media="screen"/>
 
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
          <a href="index.jsp">广场</a>
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
               <li>
          <a href="Register.jsp">注册</a>
        </li>
      <%  
    HttpSession mysession=request.getSession();
    User user=(User)mysession.getValue("LogInUser");  
       %>
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
    
        
           

       <h2> 有什么新鲜事想告诉大家？</h2>
       <form role="form" action="/MicroBlog/servlet/AddPost" name="postform" method="post">
  <div class="form-group">
  <textarea id="content" name="content" class="form-control" rows="4" placeholder="快把你的喜悦告诉大家吧" required></textarea>
  <br>
  <button type="submit" class="btn btn btn-info">发布</button>
  </div>
	</form>
	<hr>

    <div id="datalist">
       <%
       ArrayList circlepostlist=new ArrayList<Post>();
       ArrayList circlepostlistBypage=new ArrayList<Post>();
       UserDAO userdao=new UserDAO();
       circlepostlist = userdao.GetAllPost(user);
       circlepostlistBypage = userdao.GetAllPostByPagination(user,0,3);
       for(int i=0;i<circlepostlistBypage.size();i++){
      	   Post tmp111=(Post)(circlepostlist.get(i));
			out.println("<h3>"+((Post)(circlepostlist.get(i))).getownername()+"</h3>");
			out.println("<h4>"+((Post)(circlepostlist.get(i))).getcontent()+"</h4>");
			out.println("<p>"+((Post)(circlepostlist.get(i))).getbirthday()+"</p>");
			ArrayList commentlist=new ArrayList<Comment>();
		    PostDAO postdao=new PostDAO();
			commentlist=postdao.GetAllComment(((Post)(circlepostlist.get(i))).getidpost());
			 java.util.Random r=new java.util.Random(); 
			int tmp = r.nextInt();
			
			out.println("<div  class=\"row\">");
  			out.println("<button class=\"btn btn-link\"   data-toggle=\"collapse\" data-target=\"#comment"+tmp+"\">"+((Post)(circlepostlist.get(i))).getcomnum()+"条评论</button>");
			out.println("<div id=\"comment"+tmp+"\" class=\"collapse\">");
						 for(int j=0;j<commentlist.size();j++){
						 Comment comtmp=(Comment)(commentlist.get(j));
            out.println("<h4>"+comtmp.GetContent()+"</h4>");
            out.println("<p>"+comtmp.GetWhocommentName()+"     "+comtmp.GetBirthday()+"</p>");
            }
			out.println("</div> ");	
			out.println("</div> ");		
			
			
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
				 <div id="pageinate"></div>
	  </div>	
			

        
        <div class="col-md-4">
                         
   <%@include file="search.jsp" %>
    <%
    ArrayList FriendList=new ArrayList<User>();
    FriendList=userdao.GetFriendList(user);
    ArrayList FollowerList=new ArrayList<User>();
    FollowerList=userdao.GetFollowerList(user);
     
    out.println("<h4>关注:</h4>");
    for(int i=0;i<FriendList.size();i++){
			out.println("<a href=\"/MicroBlog/UserInfo.jsp?userid="+((User)(FriendList.get(i))).getid()+"\">"+((User)(FriendList.get(i))).getName()+"</a><br>");
		}
	out.println("<h4>粉丝:</h4>");
    for(int i=0;i<FollowerList.size();i++){
			out.println("<a href=\"/MicroBlog/UserInfo.jsp?userid="+((User)(FollowerList.get(i))).getid()+"\">"+((User)(FollowerList.get(i))).getName()+"</a><br>");
		}
		
    %>
        </div>
      </div>     
      </div>
  </body>
   <script type="text/javascript">
		$(function() {
			var circlepostlist=<%=circlepostlist.size()%>;
			var pagesize=4;
			var pageCount=Math.ceil(circlepostlist/pagesize);
			$("#pageinate").paginate({
				count 		: pageCount,
				start 		: 1,
				display     : 10,
				border					: false,
				text_color  			: '#888',
				background_color    	: '#EEE',	
				text_hover_color  		: 'black',
				background_hover_color	: '#CFCFCF',
				onChange: function (page) {
                      list(page-1,pagesize);  
                }
				
			});
			
		});
		
		function list(start,size){
			$.ajax({  
            url:"/MicroBlog/servlet/GetUserBlog",  
            type:"post",  
            data:{start:start,size:size},  
            dataType:"json",  
            timeout: 10000,  
            error: function(){alert('请求超时，请稍候再试');},  
            success: function(result){ 
           
                var s="";  
                $.each(result,function(index,value){
                console.log(value.birthday);
             	var _date = value.birthday.time;  
				var newdate = new Date(_date);  
			    var str="";       
				str+=newdate.getYear()+"-";       
				str+=(newdate.getMonth()+1)+"-";       
				str+=newdate.getDate();      
				console.log(str);
             	
                s+="<h3>"+value.ownername+"</h3>";
                s+="<h4>"+value.content+"</h4>";
                s+="<p>"+value.birthday+"</p>";
				s+="<hr>";
                });  
                $("#datalist").html(s);  
            }  
        });  
			
		}
			 
		</script>
</html>
