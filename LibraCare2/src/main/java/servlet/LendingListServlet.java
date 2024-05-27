package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.LendingDAO;
import model.entity.LendingBean;

/**
 * Servlet implementation class LendingListServlet
 */
@WebServlet("/lendinglist")
public class LendingListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LendingListServlet() {
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

		List<LendingBean> lendingList = null;
		String url = null;

		LendingDAO dao = new LendingDAO();

		try {
			// DAOの利用
			dao.updateExpired();
			lendingList = dao.selectAll();
			
			if(lendingList.size() != 0)
			{
				url = "lending-list.jsp";
			}
			else
			{
				url = "lending-list-failure.jsp";
			}
			
		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		
		// リクエストスコープへの属性の設定
		request.setAttribute("lendingList", lendingList);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
