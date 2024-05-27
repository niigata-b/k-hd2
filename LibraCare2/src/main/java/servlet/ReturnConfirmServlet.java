package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.entity.LendingBean;

/**
 * Servlet implementation class ReturnConfirmServlet
 */
@WebServlet("/returnconfirm")
public class ReturnConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReturnConfirmServlet() {
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
		
		String user_id = request.getParameter("user_id");
		String isbn = request.getParameter("isbn");
		String book_name = request.getParameter("book_name");
		String user_name = request.getParameter("user_name");
		int lending_count = Integer.parseInt(request.getParameter("lending_count"));
		String start_date = request.getParameter("start_date");
		String deadline_date = request.getParameter("deadline_date");
		String expired_flag = request.getParameter("expired_flag");
		
		String url = "return-confirm.jsp";

		LendingBean lending = new LendingBean();

		lending.setUserId(user_id);
		lending.setIsbn(isbn);
		lending.setBookName(book_name);
		lending.setUserName(user_name);
		lending.setLendingCount(lending_count);
		lending.setStartDate(start_date);
		lending.setDeadlineDate(deadline_date);
		lending.setExpiredFlag(expired_flag);

		// リクエストスコープへの属性の設定
		request.setAttribute("lending", lending);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
