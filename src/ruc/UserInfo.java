package ruc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserInfo
 */
@WebServlet("/UserInfo")
public class UserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//System.out.println("hello");
		//response.setContentType("text/html");
	    int UserId= Integer.parseInt(request.getParameter("userid"));
	    User user=new User();
	    UserDAO userdao=new UserDAO();
	    try {
			user=userdao.GetUserFromId(UserId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    ArrayList FriendList=new ArrayList<User>();
	    try {
			FriendList=userdao.GetFriendList(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    ArrayList postlist=new ArrayList<Post>();
	    try {
			postlist=userdao.GetOwnPost(user);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IllegalAccessException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	    ArrayList circlepostlist=new ArrayList<Post>();
	    circlepostlist=userdao.GetAllPost(user);
	    
	    
	    
	    System.out.println("UserId is  "+UserId);
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>�û���ҳ</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("�û���Ϊ<br>");
		out.print(user.getName()+"<br>");
		out.print("�û�����Ϊ<br>");
		out.print(user.getEmail()+"<br>");
		out.print("**************************************<br>");
		out.print("�û��ĺ�������:<br>");
		for(int i=0;i<FriendList.size();i++){
			out.println("<a href=\"UserInfo?userid="+((User)(FriendList.get(i))).getid()+"\">"+((User)(FriendList.get(i))).getName()+"</a><br>");
		}
		out.print("**************************************<br>");
		out.print("���û��������΢����:<br>");
		for(int i=0;i<postlist.size();i++){
			out.println("΢������"+((Post)(postlist.get(i))).getcontent()+"<br>");
			out.println("����ʱ��:"+((Post)(postlist.get(i))).getbirthday()+"<br>");
			out.println("����������:"+((Post)(postlist.get(i))).getownername()+"<br>");
			out.print("******<br>");
		}
		out.print("**************************************<br>");
		out.print("**************************************<br>");
		out.print("**************************************<br>");
		out.print("**************************************<br>");
		out.print("**************************************<br>");
		out.print("**************************************<br>");
		out.print("���û�����Ȧ������΢����:<br>");
		for(int i=0;i<circlepostlist.size();i++){
			out.println("΢������:"+((Post)(circlepostlist.get(i))).getcontent()+"<br>");
			out.println("����ʱ��:"+((Post)(circlepostlist.get(i))).getbirthday()+"<br>");
			out.println("����������:"+((Post)(circlepostlist.get(i))).getownername()+"<br>");
		    
		    ArrayList commentlist=new ArrayList<Comment>();
		    PostDAO postdao=new PostDAO();
		    try {
				commentlist=postdao.GetAllComment(((Post)(circlepostlist.get(i))).getidpost());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    out.println("��������:<br>");
		    for(int j=0;j<commentlist.size();j++){
		    	out.print("####<br>");
		    	out.println("��������:"+((Comment)commentlist.get(j)).GetContent()+"<br>");
		    	out.println("������:"+((Comment)commentlist.get(j)).GetWhocommentName()+"<br>");
		    	out.println("����ʱ��:"+((Comment)commentlist.get(j)).GetBirthday()+"<br>");
		    }
			out.println("<form  name=\"commentform\" action=\"AddComment?postid="+((Post)circlepostlist.get(i)).getownid()+"\"  method=\"post\">");
			out.println("<input id=\"comment\" name=\"comment\" type=\"text\">");
			out.println("<input value=\"����\" type=\"submit\">");
			out.println("</form>");
					
			out.println("******<br>");
		}
		out.print("**************************************<br>");
		HttpSession session=request.getSession();
		int LogInUserId=((User)session.getAttribute("LogInUser")).getid();
		int BeViewedUserId=user.getid();
		try {
			if(LogInUserId!=BeViewedUserId){
			if(userdao.IsExistFriendShip(LogInUserId, BeViewedUserId)){
				out.print("<a href=\"DoFriendShip?Remove=1&FriendId="+BeViewedUserId+"\">ȡ����ע"+"</a><br>");	
			}
			else{
				out.print("<a href=\"DoFriendShip?FriendId="+BeViewedUserId+"\">��ע"+"</a><br>");
			}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}
