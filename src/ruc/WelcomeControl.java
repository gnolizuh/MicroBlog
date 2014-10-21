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

		// �����ַ���
				response.setContentType("text/html;charset = UTF-8");
				/*
				BookDAO bookDAO = new BookDAO();
				
				// ��ѯ�����б�
				ArrayList books = bookDAO.queryNewBooks();
				
				// �������������
				request.setAttribute("newBooksName", books);
				
				// ��ѯ������Ŀ¼�б�
				BookCategoryDAO categoryDAO = new BookCategoryDAO();
				ArrayList categories = categoryDAO.queryBookCategory();
				
				// �������Ŀ¼�б�
				request.setAttribute("categories", categories);
				
				// �����������
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