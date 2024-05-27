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
 * Servlet implementation class LendingDetailServlet
 */
@WebServlet("/lendingdetail")
public class LendingDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LendingDetailServlet() {
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

		// Beanを
		LendingBean lending = new LendingBean();
		String isbn = request.getParameter("isbn");
		String user_id = request.getParameter("user_id");
		
		String url = null;

		LendingDAO dao = new LendingDAO();
		
		lending.setIsbn(isbn);
		lending.setUserId(user_id);

		try {
			// DAOの利用
			lending = dao.detail(lending);
			
			// リクエストスコープへの属性の設定
			request.setAttribute("lending", lending);
			
			if(lending != null)
			{
				url = "lending-detail.jsp";
			}
			else
			{
				url = "lending-detail-failure.jsp";
			}

		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		
		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
