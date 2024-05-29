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
 * Servlet implementation class BookSearchServlet
 */
@WebServlet("/booksearch")
public class BookSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BookSearchServlet() {
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

		List<BookBean> bookList = null; 
		List<BookBean> categoryList = null;

		String book_name = request.getParameter("book_name");
		String category_name = request.getParameter("category_name");
		
		String message = null;
		String url = "book-list.jsp";
		
		BookBean book = new BookBean();
		
		book.setBookName(book_name);
		book.setCategoryName(category_name);
		
		BookDAO dao = new BookDAO();
		CategoryDAO daoc = new CategoryDAO();
		
			
		try {
		
			
			bookList = dao.bookSearch(book); 
			categoryList = daoc.categoryAll();
			
			if(bookList.size() == 0)
			{
				message ="検索結果が見つかりませんでした";
				url ="booklist";
				request.setAttribute("message", message);
			}
			
			
		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		
		// リクエストスコープへの属性の設定 
		request.setAttribute("categoryList", categoryList);
		request.setAttribute("bookList", bookList);
		request.setAttribute("book",book);

			
			
		
		
		// リクエストスコープへの属性の設定
		
		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
