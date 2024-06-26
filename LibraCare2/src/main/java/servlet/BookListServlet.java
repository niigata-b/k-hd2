package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.BookDAO;
import model.dao.CategoryDAO;
import model.entity.BookBean;

/**
 * Servlet implementation class BookListServlet
 */
@WebServlet("/booklist")
public class BookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BookListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");  

		String url = null;

		BookBean book = (BookBean)request.getAttribute("book");
		
		List<BookBean> bookList = null;  
		List<BookBean> categoryList = null;
		
		BookDAO dao = new BookDAO(); 
		CategoryDAO daoc = new CategoryDAO();
 				try {
 					dao.lendingflagfalse();
 					dao.lendingflagtrue();
					bookList = dao.selectAll(); 
					categoryList = daoc.categoryAll();
				} catch (ClassNotFoundException e) {
					// TODO 自動生成された catch ブロック
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO 自動生成された catch ブロック
					e.printStackTrace();
				}
	
			if (bookList!=null) {

			 request.setAttribute("book", book);
			 request.setAttribute("bookList",bookList); 
			 request.setAttribute("categoryList", categoryList);
				url = "book-list.jsp"; //図書一覧へ

			} else {
				// 未認証
				url = "book-list-failure.jsp";//一覧表示失敗画面へ
			} 
	

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}




