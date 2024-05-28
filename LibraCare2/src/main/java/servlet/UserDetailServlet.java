package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDAO;
import model.entity.UserBean;


/**
 * Servlet implementation class UserDetailServlet
 */
@WebServlet("/userdetail")
public class UserDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDetailServlet() {
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
		
		UserBean user = new UserBean();
		String user_id = request.getParameter("user_id");
		String user_name = request.getParameter("user_name");
		
		String url = null;

		UserDAO dao = new UserDAO();
		
		user.setUserId(user_id);
		user.setUserName(user_name);
		
		try {
			// DAOの利用
			user = dao.detail(user);
			
			// リクエストスコープへの属性の設定
			request.setAttribute("user", user);
			
			if(user != null)
			{
				url = "user-detail.jsp";
			}
			else
			{
				url = "user-detail-failure.jsp";
			}

		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		// リクエストの転送
				RequestDispatcher rd = request.getRequestDispatcher(url);
				rd.forward(request, response);
	}

}
