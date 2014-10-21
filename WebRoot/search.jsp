<%@ page language="java" contentType="text/html; charset=utf-8"%>

<form  class="form-signin" role="form" id="searchuser"  action="/MicroBlog/SearchResult.jsp" method="post">
    <h4>搜索用户</h4>
    <input id="SearUser" name="SearUser" type="text"  class="form-control" placeholder="请输入要搜索的用户名" required >
    <br>
   <button type="submit" class="btn btn-sm btn-primary">搜索</button>
    </form>
    
<hr>
  
       <form  class="form-signin" role="form" id="searchblog" action="/MicroBlog/SearchResult.jsp" method="post">
    <h4>搜索微博</h4>
    <input id="SearBlog" name="SearBlog" type="text"  class="form-control" placeholder="请输入要搜索的微博" required >
    <br>
   <button type="submit" class="btn btn-sm btn-primary">搜索</button>
    </form>