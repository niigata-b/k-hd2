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
 * Servlet implementation class LendingSearchServlet
 */
@WebServlet("/lendingsearch")
public class LendingSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LendingSearchServlet() {
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

		List<LendingBean> lendingList = null;

		String isbn = request.getParameter("isbn");
		String user_id = request.getParameter("user_id");
		String message = null;
		String url = "lending-list.jsp";
		
		LendingBean lending = new LendingBean();
		
		lending.setIsbn(isbn);
		lending.setUserId(user_id);
		
		LendingDAO dao = new LendingDAO();

		try {
			// DAOの利用
			dao.updateExpired();
			lendingList = dao.search(lending);
			
			if(lendingList.size() == 0)
			{
				message ="入力内容に不備があります。";
				url ="lendinglist";
				request.setAttribute("message", message);
			}
			
			
		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		
		// リクエストスコープへの属性の設定
		request.setAttribute("lendingList", lendingList);
		request.setAttribute("lending",lending);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
