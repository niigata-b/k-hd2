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
 * Servlet implementation class BookInsertConfirmServlet
 */
@WebServlet("/bookinsertconfirm")
public class BookInsertConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookInsertConfirmServlet() {
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

		String isbn = request.getParameter("isbn");
		String book_name = request.getParameter("book_name");
		String category_name = request.getParameter("category_name");
		int book_count = 1;
		
		int cancel = 0;
		try {
			cancel = Integer.parseInt(request.getParameter("cancel"));
		}
		catch(NumberFormatException e)
		{
			System.out.println("foiwe");
		}
		
		String messageNum;
		String messageNull;
		String url = "book-insert-confirm.jsp";

		if(isbn.equals("") || book_name.equals(""))
		{
			System.out.println("aaa");
			messageNull = "入力内容に不備があります";
			url = "book-insert.jsp";
			request.setAttribute("messageNull",messageNull);
		}
		else if(category_name.equals(""))
		{
			System.out.println("bbbb");
			messageNull = "入力内容に不備があります";
			url = "book-insert.jsp";
			request.setAttribute("messageNull",messageNull);
		}
		
		try 
		{
			book_count = Integer.parseInt(request.getParameter("book_count"));
		}
		catch(NumberFormatException e)
		{
			messageNum = "数字を入力してください。";
			url = "book-insert.jsp";
			request.setAttribute("messageNum",messageNum);
		}

		BookBean book = new BookBean();
		book.setIsbn(isbn);
		book.setBookName(book_name);
		book.setCategoryName(category_name);
		book.setBookCount(book_count);

		// リクエストスコープへの属性の設定
		request.setAttribute("book", book);
		
		if(cancel == 1)
		{
			url = "book-insert.jsp";
		}

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
