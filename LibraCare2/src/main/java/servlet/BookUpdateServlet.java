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
 * Servlet implementation class BookUpdateServlet
 */
@WebServlet("/BookUpdateServlet")
public class BookUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BookUpdateServlet() {
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

		String isbn = request.getParameter("isbn");
		String book_name = request.getParameter("book_name");
		int book_count = Integer.parseInt(request.getParameter("book_count"));
		int huyasu = Integer.parseInt(request.getParameter("huyasu"));
		int herasu = Integer.parseInt(request.getParameter("herasu"));
		int count = 0;
		String url = null;

		BookBean book = new BookBean();
		BookDAO dao = new BookDAO();

		book.setIsbn(isbn);
		book.setBookName(book_name);
		book.setBookCount(book_count);
		book.setHuyasu(huyasu);
		book.setHerasu(herasu);

		// リクエストスコープへの属性の設定
		request.setAttribute("book", book);
		
		try {
			if(huyasu > 0) {
				count = dao.bookhuyasu(book);
			}
			else
			{
				count = dao.bookherasu(book);
			}

			if(count != 0)
			{
				url = "book-update-result.jsp";
			}
			else
			{
				url = "book-update-failure.jsp";
			}
		}
		catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
