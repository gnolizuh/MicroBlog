package ruc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import com.bsw.book.BookDAO;
//import com.bsw.bookcategory.BookCategoryDAO;

public class WelcomeControl extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public WelcomeControl() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 设置字符集
				response.setContentType("text/html;charset = UTF-8");
				/*
				BookDAO bookDAO = new BookDAO();
				
				// 查询新书列表
				ArrayList books = bookDAO.queryNewBooks();
				
				// 设置新书的名称
				request.setAttribute("newBooksName", books);
				
				// 查询书的类别目录列表
				BookCategoryDAO categoryDAO = new BookCategoryDAO();
				ArrayList categories = categoryDAO.queryBookCategory();
				
				// 设置类别目录列表
				request.setAttribute("categories", categories);
				
				// 设置新书类别
				request.setAttribute("newBooks", books);
				*/
				request.getRequestDispatcher("welcome.jsp").forward(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
