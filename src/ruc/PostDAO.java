package ruc;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;

import ruc.DBManager;


import ruc.*;

public class PostDAO {
	private Connection connection=null;
	private ResultSet resultSet=null;
	private PreparedStatement preState=null;
	private Statement state=null;
	public PostDAO(){}
   public ArrayList SearchPost(String tmpstring) throws SQLException, IllegalAccessException, ClassNotFoundException{
	   connection = DBManager.getConnection();
		String sqlState = "SELECT * FROM post WHERE content like \"%"+tmpstring+"%\"";
		ArrayList al=new ArrayList<Post>();
			state = connection.createStatement();
			resultSet = state.executeQuery(sqlState);
			Post post=null;
			int time=0;
		  while(resultSet.next())
		  {
			  time++;
			  System.out.println(time);
			  
				post=new Post();
				post.idpost=resultSet.getInt(1);
				post.ownerid=resultSet.getInt(2);
			    post.comnum=resultSet.getInt(3);				
			    post.birthday=resultSet.getTimestamp(4);
			    post.content=resultSet.getString(5);
			    post.ownername=resultSet.getString(6);			     			     			    			     
			     al.add(post);
		  }
			   DBManager.closeAll(connection, state, resultSet);		 		
		return al;
   }
   public ArrayList GetAllComment(int postid) throws SQLException, IllegalAccessException, ClassNotFoundException{
	   connection = DBManager.getConnection();
		String sqlState = "SELECT * FROM comment WHERE  postid="+postid+" order by birthday desc";
		ArrayList al=new ArrayList<Comment>();
			state = connection.createStatement();
			resultSet = state.executeQuery(sqlState);
		  while(resultSet.next())
		  {
			  Comment comment=new Comment();
		        comment.SetIdComment(resultSet.getInt(1));
				comment.SetPostid(resultSet.getInt(2));
				comment.SetWhocommentid(resultSet.getInt(3));
				comment.SetContent(resultSet.getString(4));
				comment.SetBirthday(resultSet.getTimestamp(5));
				comment.SetWhocommentName(resultSet.getString(6));
			     al.add(comment);
		  }
			   DBManager.closeAll(connection, state, resultSet);		 		
		return al;
	   
   }
   
   final int MAX_POST_COUNT = 5;
   public ArrayList GetGlobalLatestPost(int page) throws SQLException, IllegalAccessException, ClassNotFoundException{
	   ArrayList<Post> al = new ArrayList<Post>();
	   String sqlState = "";
	   
	   if(page > 0)
	   {
		   sqlState = String.format("SELECT * FROM post order by birthday desc LIMIT %d,%d",
				   ((page - 1) * MAX_POST_COUNT),
				   MAX_POST_COUNT);
		   connection = DBManager.getConnection();
		   state = connection.createStatement();
		   resultSet = state.executeQuery(sqlState);
		   while(resultSet.next())
		   {
			   Post post=new Post();
			   post.setidpost(resultSet.getInt("idpost"));
			   post.setbirthday(resultSet.getTimestamp("birthday"));
			   post.setcomnum(resultSet.getInt("comnum"));
			   post.setcontent(resultSet.getString("content"));
			   post.setownername(resultSet.getString("ownername"));
			   post.setownid(resultSet.getInt("ownerid"));
			   al.add(post);
		   }
		   DBManager.closeAll(connection, state, resultSet);
	   }

	   return al;
   }
   
   public int GetTotalPage() throws SQLException, IllegalAccessException, ClassNotFoundException
   {
	   int count = 0;
	   connection = DBManager.getConnection();
	   String sqlState = "SELECT COUNT(*) AS post_count FROM post";
	   state = connection.createStatement();
	   resultSet = state.executeQuery(sqlState);
	   if(resultSet.next())
	   {
		   count = resultSet.getInt("post_count");
	   }
	   DBManager.closeAll(connection, state, resultSet);

	   return (count / MAX_POST_COUNT) + 1;
   }
   
	public void addpost(Post post) throws SQLException, IllegalAccessException, ClassNotFoundException
	{
		System.out.println("here is addpost");
	 
			connection=DBManager.getConnection();		
		StringBuffer SqlState=new StringBuffer();
		SqlState.append("INSERT INTO post(idpost,ownerid,comnum,content,ownername)");
		SqlState.append(" VALUES(?,?,?,?,?)");
		try{
		
		preState=connection.prepareStatement(SqlState.toString());
		preState.setInt(1, post.idpost);
		preState.setInt(2, post.ownerid);
		preState.setInt(3, post.comnum);
		preState.setString(4, post.content);
		preState.setString(5, post.ownername);
		
		//preState.execute("begin");
		preState.executeUpdate();
		//preState.execute("commit");
		//return true;
	} catch (SQLException e) {
		
		// ≤Â»Î ß∞‹‘Úªÿπˆ
		try {
			preState.execute("rollback");
		} catch (SQLException e1) {
			e1.printStackTrace();
		//	return false;
		}
		e.printStackTrace();
	} finally {
		DBManager.closeAll(connection, state, resultSet);
	}
	//return false;
		
					
	}

}
