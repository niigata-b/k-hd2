package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.entity.BookBean;

/**
 * Servlet implementation class BookListServlet
 */
@WebServlet("/booklistsevlet")
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

		HttpSession session = request.getSession();

		BookDAO dao = new BookDAO(); 
		List<BookBean> bookList = dao.selectAll(); 
		try {
			if (bookList!=null) {


				session.setAttribute("bookList",bookList);
				url = "book-list.jsp"; //図書一覧へ

			} else {
				// 未認証
				url = "book-list-failure.jsp";//一覧表示失敗画面へ
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}


		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}




