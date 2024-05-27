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
 * Servlet implementation class BookUpdateConfirmServlet
 */
@WebServlet("/bookupdateconfirm")
public class BookUpdateConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BookUpdateConfirmServlet() {
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

		int huyasu = 0;
		int herasu = 0;
		String messageNull;
		String messageNum;
		String messageDupli;
		String messageZero;
		String url = "book-update-confirm.jsp";

		try {
			huyasu = Integer.parseInt(request.getParameter("huyasu"));
			herasu = Integer.parseInt(request.getParameter("herasu"));
		} 
		catch(NumberFormatException e)
		{
			System.out.println("num");
			messageNum = "数値を入力してください。";
			url = "book-update.jsp";
			request.setAttribute("messageNum", messageNum);
		}
		catch(NullPointerException e)
		{
			System.out.println("null");
			messageNull = "値が入力されていません。";
			url = "book-update.jsp";
			request.setAttribute("messageNull", messageNull);
		}
		
		if(huyasu > 0 && herasu > 0)
		{
			System.out.println("dupli");
			messageDupli = "どちらかのみに入力してください。";
			url = "book-update.jsp";
			request.setAttribute("messageDupli", messageDupli);
		}
		else if(huyasu == 0 && herasu == 0)
		{
			System.out.println("zero");
			messageZero = "1以上の値を入力してください。";
			url = "book-update.jsp";
			request.setAttribute("messageZero", messageZero);
		}

		String isbn = request.getParameter("isbn");
		String book_name = request.getParameter("book_name");
		int book_count = Integer.parseInt(request.getParameter("book_count"));
		int total_book_count = Integer.parseInt(request.getParameter("total_book_count"));
		int cancel = 0;
		
		try {
			cancel = Integer.parseInt(request.getParameter("cancel"));
		}
		catch(NumberFormatException e)
		{

		}

		BookBean book = new BookBean();
		book.setIsbn(isbn);
		book.setBookName(book_name);
		book.setBookCount(book_count);
		book.setTotalBookCount(total_book_count);
		book.setHuyasu(huyasu);
		book.setHerasu(herasu);

		// リクエストスコープへの属性の設定
		request.setAttribute("book", book);

		if(cancel == 1)
		{
			url = "book-update.jsp";
			System.out.println("cancel");
		}

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
