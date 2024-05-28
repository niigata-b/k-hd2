package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.LendingDAO;
import model.entity.LendingBean;

/**
 * Servlet implementation class LoanServlet
 */
@WebServlet("/loan")
public class LoanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoanServlet() {
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
		int lending_count = Integer.parseInt(request.getParameter("lending_count"));
		String url = null;
		int book_count = 0;
		int count = 0;

		LendingBean lending = new LendingBean();
		LendingDAO dao = new LendingDAO();

		lending.setUserId(user_id);
		lending.setIsbn(isbn);
		lending.setLendingCount(lending_count);

		try {
			// DAOの利用
			book_count = dao.loanCount(lending);
			//lending = dao.detail(lending);
			lending.setBookCount(book_count);

			count = dao.loan(lending);
		}catch (SQLException | ClassNotFoundException e) {
			url = "loan-failure.jsp";
		}

		// リクエストスコープへの属性の設定
		request.setAttribute("lending", lending);

		if(count != 0)
		{
			url = "loan-result.jsp";
		}
		else
		{
			url = "loan-failure.jsp";
		}



		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
