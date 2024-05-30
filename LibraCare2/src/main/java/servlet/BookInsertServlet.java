package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.BookDAO;
import model.entity.BookBean;

/**
 * Servlet implementation class BookInsertServlet
 */
@WebServlet("/bookinsert")
public class BookInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BookInsertServlet() {
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
		// TODO Auto-generated method stub
		// aa
		request.setCharacterEncoding("UTF-8");

		String isbn = request.getParameter("isbn");
		String book_name = request.getParameter("book_name");
		String category_name = request.getParameter("category_name");
		int book_count = Integer.parseInt(request.getParameter("book_count"));

		String url = null;
		int count = 0;

		BookBean book = new BookBean();
		BookDAO dao = new BookDAO();

		book.setIsbn(isbn);
		book.setBookName(book_name);
		book.setCategoryName(category_name);
		book.setBookCount(book_count);

		// リクエストスコープへの属性の設定
		request.setAttribute("book", book);
		
		try {
			// DAOの利用
			count = dao.bookinsert(book);
			
		}catch (SQLException | ClassNotFoundException e) {
			url = "book-insert-failure.jsp";
		}

		if(count != 0)
		{
			url = "book-insert-result.jsp";
		}
		else
		{
			url = "book-insert-failure.jsp";
		}



		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);	
	}

}
