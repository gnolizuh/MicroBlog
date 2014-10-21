package ruc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CommentDAO {
	/**
	 * Statement���� 
	 */
	private Statement state = null;

	/**
	 * PreparedStatement����
	 */
	private PreparedStatement preState = null;

	/**
	 * ���������
	 */
	private ResultSet resultSet = null;

	/** 
	 * ���ݿ����������
	 */
	private Connection connection = null;

	/**
	 * ���ݿ����ӵİ�װ�����
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

					preState = connection.prepareStatement(sqlState.toString()); // ����Ԥ����ʽ
					preState.setInt(1,comment.GetWhocommentid()); // ����ÿ��Ҫ����ĵ�����
					preState.setInt(2,comment.GetPostid());
					preState.setString(3,comment.GetContent());
					preState.setString(4,comment.GetWhocommentName());
				preState.executeUpdate();

				} catch (SQLException e) {
					e.printStackTrace();

				}
				//postid�е�comnum++;
				//update post set comnum=comnum+1 where idpost=13
				String sqlStr="update post set comnum=comnum+1 where idpost="+comment.GetPostid();
				state=connection.createStatement();
				state.executeUpdate(sqlStr);
				DBManager.closeAll(connection, preState, resultSet);
	}

}
