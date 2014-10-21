package ruc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CommentDAO {
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
	public CommentDAO(){
		
	}
	public void  AddComment(Comment comment) throws SQLException, IllegalAccessException, ClassNotFoundException{
				connection= DBManager.getConnection(); 
				StringBuffer sqlState = new StringBuffer();
				sqlState.append("INSERT INTO COMMENT(whocommentid,postid,content,whocommentname)");
				sqlState.append(" VALUES(?,?,?,?)");
				//System.out.println(sqlState);
				try {

					preState = connection.prepareStatement(sqlState.toString()); // 采用预处理方式
					preState.setInt(1,comment.GetWhocommentid()); // 设置每个要插入的的属性
					preState.setInt(2,comment.GetPostid());
					preState.setString(3,comment.GetContent());
					preState.setString(4,comment.GetWhocommentName());
				preState.executeUpdate();

				} catch (SQLException e) {
					e.printStackTrace();

				}
				//postid中的comnum++;
				//update post set comnum=comnum+1 where idpost=13
				String sqlStr="update post set comnum=comnum+1 where idpost="+comment.GetPostid();
				state=connection.createStatement();
				state.executeUpdate(sqlStr);
				DBManager.closeAll(connection, preState, resultSet);
	}

}
