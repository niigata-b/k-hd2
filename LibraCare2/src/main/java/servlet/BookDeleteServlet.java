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
 * Servlet implementation class BookDeleteServlet
 */
@WebServlet("/bookdelete")
public class BookDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BookDeleteServlet() {
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

		request.setCharacterEncoding("UTF-8");

		BookBean book = new BookBean();
		String isbn = request.getParameter("isbn");
		String book_name = request.getParameter("book_name");
		String category_name = request.getParameter("category_name");
		int book_count = Integer.parseInt(request.getParameter("book_count"));


		BookDAO dao = new BookDAO();

		book.setIsbn(isbn);
		book.setBookName(book_name);
		book.setCategoryName(category_name);
		book.setBookCount(book_count);

		String url = null;

		int count = 0;

		// リクエストスコープへの属性の設定
		request.setAttribute("book", book);

		try {
			// DAOの利用
			count = dao.bookdelete(book);
		}catch (SQLException | ClassNotFoundException e) {
			url = "book-delete-failure.jsp";
		}

		if(count != 0)
		{
			url = "book-delete-result.jsp";
		}
		else
		{
			url = "book-delete-failure.jsp";
		}



		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
