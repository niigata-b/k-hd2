package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.entity.BookBean;

/**
 * Servlet implementation class BookUpdateFormServlet
 */
@WebServlet("/bookupdateform")
public class BookUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookUpdateFormServlet() {
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
		String category_name = request.getParameter("category_name");
		int book_count = Integer.parseInt(request.getParameter("book_count"));
		int total_book_count = Integer.parseInt(request.getParameter("total_book_count"));
		String lending_flag = request.getParameter("lending_flag");

		BookBean book = new BookBean();
		book.setIsbn(isbn);
		book.setBookName(book_name);
		book.setCategoryName(category_name);
		book.setBookCount(book_count);
		book.setTotalBookCount(total_book_count);
		book.setLendingFlag(lending_flag);

		request.setAttribute("book", book);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("book-update.jsp");
		rd.forward(request, response);
	}

}
