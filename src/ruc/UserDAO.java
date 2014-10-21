package ruc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;

import ruc.User;
 
import ruc.DBManager;

public class UserDAO {
	/**
	 * Statement对象 
	 */
	private Statement state = null;

	/**
	 * PreparedStatement对象
	 */
	private PreparedStatement preState = null;

	/**
	 * 结果集对象
	 */
	private ResultSet resultSet = null;

	/** 
	 * 数据库连接类对象
	 */
	private Connection connection = null;

	/**
	 * 数据库连接的包装类对象
	 */
	private DBManager dbManager = null;

	public UserDAO(){}
	public int CheckUser(String name,String password) throws SQLException, IllegalAccessException, ClassNotFoundException{
		connection = DBManager.getConnection();
		
		String sqlState = "SELECT id FROM USER WHERE name = '" + name + "'"+"AND password='"+password+"'";

			state = connection.createStatement();
			resultSet = state.executeQuery(sqlState);
		   if(resultSet.next())
		   {
			   int temp=resultSet.getInt("id"); 
			   DBManager.closeAll(connection, state, resultSet);
			   return temp;
		   }
		   else 
		   {
			   DBManager.closeAll(connection, state, resultSet);
			   return -1;
		   }
	
					
		
	}
	public User GetUserFromId(int id) throws SQLException, IllegalAccessException, ClassNotFoundException{
		User user = new User();
		connection = DBManager.getConnection();
		String sqlState = "SELECT * FROM USER WHERE id =" + id;
		state = connection.createStatement();
		resultSet = state.executeQuery(sqlState);
		if(resultSet.next())
		{
			System.out.println("this is getuserfromid result");
			System.out.println(resultSet.getInt(1)); 
			System.out.println(resultSet.getString(2));
			System.out.println(resultSet.getString(3));
			System.out.println(resultSet.getString(4));
			System.out.println(resultSet.getString(5));
			user.id=resultSet.getInt(1);
			user.name=resultSet.getString(2);
			user.password=resultSet.getString(3);
			user.email=resultSet.getString(4);
			user.age=resultSet.getString(5);
		}
		else
		{
			user = null;
		}

		DBManager.closeAll(connection, state, resultSet);		 		
		return user;
	}
	public ArrayList SearchUserName(String name) throws SQLException, IllegalAccessException, ClassNotFoundException{
		//select * from user where name like "%fe%"
		ArrayList al = new ArrayList<User>();

		connection = DBManager.getConnection();
		String sqlState = "SELECT * FROM USER WHERE name like \'%"+name+"%\'";
			state = connection.createStatement();
			resultSet = state.executeQuery(sqlState);
		  while(resultSet.next())
		  {
				User user=new User();
			      user.id=resultSet.getInt(1);
			      user.name=resultSet.getString(2);
			     user.password=resultSet.getString(3);
			     user.email=resultSet.getString(4);
			     user.age=resultSet.getString(5);
			     al.add(user);
		  }
			   DBManager.closeAll(connection, state, resultSet);		 		
		return al;
		
		
	}
	public void RemoveFriendShip(int RelationFrom,int RelationTo) throws SQLException, IllegalAccessException, ClassNotFoundException{
		connection = DBManager.getConnection();		
		String sqlState = "DELETE FROM friendship WHERE relationfrom= '" + RelationFrom+ "'"+"AND relationto='"+RelationTo+"'";
			state = connection.createStatement();
			state.executeUpdate(sqlState);
		 DBManager.closeAll(connection, preState, resultSet);		   
	}
	public void AddFriendShip(int RelationFrom,int RelationTo) throws SQLException, IllegalAccessException, ClassNotFoundException{
		connection= DBManager.getConnection(); // 得到数据库连接
		StringBuffer sqlState = new StringBuffer();
		sqlState.append("INSERT INTO FriendShip(relationfrom,relationto)");
		sqlState.append(" VALUES(?,?)");
		//System.out.println(sqlState);
		try {

			preState = connection.prepareStatement(sqlState.toString()); // 采用预处理方式
			preState.setInt(1,RelationFrom); // 设置每个要插入的的属性
			preState.setInt(2,RelationTo);
		preState.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();

			//try {
		//		preState.execute("rollback"); // 回滚
		//	} catch (SQLException e1) {
		//		e1.printStackTrace();
		//	}
		//	e.printStackTrace();
		} finally {
			DBManager.closeAll(connection, preState, resultSet);
		}
	   
	}
	public boolean IsExistFriendShip(int RelationFrom, int RelationTo) throws SQLException, IllegalAccessException, ClassNotFoundException{
		connection = DBManager.getConnection();		
		String sqlState = "SELECT idfriendship FROM friendship WHERE relationfrom= '" + RelationFrom+ "'"+"AND relationto='"+RelationTo+"'";
			state = connection.createStatement();
			resultSet = state.executeQuery(sqlState);
		   if(resultSet.next())
		   {			   
			   DBManager.closeAll(connection, state, resultSet);
			   return true;
		   }
		   else 
		   {
			   DBManager.closeAll(connection, state, resultSet);
			   return false;
		   }
	}
	public void AddUser(User user) throws SQLException, IllegalAccessException, ClassNotFoundException
	{
		
		connection= DBManager.getConnection(); // 得到数据库连接
          
		StringBuffer sqlState = new StringBuffer();
		sqlState.append("INSERT INTO USER(name,password,age,email)");
		sqlState.append(" VALUES(?,?,?,?)");
		//System.out.println(sqlState);
		try {

			preState = connection.prepareStatement(sqlState.toString()); // 采用预处理方式
			preState.setString(1, user.getName()); // 设置每个要插入的的属性
			preState.setString(2, user.getPassword());
			preState.setString(3,user.getAge());
			preState.setString(4, user.getEmail());

		preState.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();

			//try {
		//		preState.execute("rollback"); // 回滚
		//	} catch (SQLException e1) {
		//		e1.printStackTrace();
		//	}
		//	e.printStackTrace();
		} finally {
			DBManager.closeAll(connection, preState, resultSet);
		}
		
		
		
		
	}
    public ArrayList GetFollowerList(User user) throws SQLException, IllegalAccessException, ClassNotFoundException{
    	ArrayList al = new ArrayList<User>();					
			connection=DBManager.getConnection();
			state=connection.createStatement();
			String sqlStr="select * from friendship where relationto="+user.id;
			resultSet=state.executeQuery(sqlStr);
			
			while(resultSet.next()){
				User friend=new User();
				int tmpID=resultSet.getInt("relationfrom");
				UserDAO userdao=new UserDAO();
				friend=userdao.GetUserFromId(tmpID);				
				al.add(friend); // 加到容器
			}
            return al;

	
    }
    public ArrayList GetFriendList(User user) throws SQLException, IllegalAccessException, ClassNotFoundException{
    	ArrayList al = new ArrayList<User>();					
			connection=DBManager.getConnection();
			state=connection.createStatement();
			String sqlStr="select * from friendship where relationfrom="+user.id;
			resultSet=state.executeQuery(sqlStr);
			
			while(resultSet.next()){
				User friend=new User();
				int tmpID=resultSet.getInt("relationto");
				UserDAO userdao=new UserDAO();
				friend=userdao.GetUserFromId(tmpID);				
				al.add(friend); // 加到容器
			}
			DBManager.closeAll(connection,state,resultSet);
            return al;
            
	
    }
    
    public ArrayList GetOwnPost(User user) throws SQLException, IllegalAccessException, ClassNotFoundException{
    	ArrayList al = new ArrayList();
				

			connection=DBManager.getConnection();
			state=connection.createStatement();
			String sqlStr="select * from post where ownerid="+user.id+" order by birthday desc";
			resultSet=state.executeQuery(sqlStr);
			
			while(resultSet.next()){
				Post ps=new Post();
				ps.setbirthday(resultSet.getTimestamp("birthday"));
				ps.setcomnum(resultSet.getInt("comnum"));
				ps.setcontent(resultSet.getString("content"));
				ps.setidpost(resultSet.getInt("idpost"));
				ps.setownid(resultSet.getInt("ownerid"));
				
				al.add(ps); // 加到容器
			}
			DBManager.closeAll(connection,state,resultSet);
            return al;
		
		
    }
	public ArrayList GetAllPost(User user)
	{
		//select * from post where ownerid in(select relationto from friendship where relationfrom=12) order by birthday desc
			ArrayList al = new ArrayList();						
			try{				
				connection=DBManager.getConnection();
				state=connection.createStatement();
				
				String sqlStr="select * from post where ownerid in(select relationto from friendship where relationfrom="+user.getid()+") order by birthday desc ";
				resultSet=state.executeQuery(sqlStr);
				
				while(resultSet.next()){
					Post ps=new Post();
					ps.setbirthday(resultSet.getTimestamp("birthday"));
					ps.setcomnum(resultSet.getInt("comnum"));
					ps.setcontent(resultSet.getString("content"));
					ps.setidpost(resultSet.getInt("idpost"));
					ps.setownid(resultSet.getInt("ownerid"));
					ps.setownername(resultSet.getString("ownername"));
					
					al.add(ps); // 加到容器
				}
	            return al;
			}catch(Exception e){
				
				e.printStackTrace();
				return null;
			}finally{
				try {
					DBManager.closeAll(connection,state,resultSet);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		
		
	}
	
	public ArrayList GetAllPostByPagination(User user,int pagenum,int pagesize)
	{
		int fromnum=pagenum*pagesize;
			ArrayList al = new ArrayList();						
			try{				
				connection=DBManager.getConnection();
				state=connection.createStatement();
				
				String sqlStr="select * from post where ownerid in(select relationto from friendship where relationfrom="+user.getid()+") order by birthday desc limit "+fromnum+","+pagesize;
				resultSet=state.executeQuery(sqlStr);
				
				while(resultSet.next()){
					Post ps=new Post();
					ps.setbirthday(resultSet.getTimestamp("birthday"));
					ps.setcomnum(resultSet.getInt("comnum"));
					ps.setcontent(resultSet.getString("content"));
					ps.setidpost(resultSet.getInt("idpost"));
					ps.setownid(resultSet.getInt("ownerid"));
					ps.setownername(resultSet.getString("ownername"));
					
					al.add(ps); // 加到容器
				}
	            return al;
			}catch(Exception e){
				
				e.printStackTrace();
				return null;
			}finally{
				try {
					DBManager.closeAll(connection,state,resultSet);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		
		
	}

}
