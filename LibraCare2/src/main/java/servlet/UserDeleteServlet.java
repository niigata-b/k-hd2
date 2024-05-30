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
 * Servlet implementation class UserDeleteServlet
 */
@WebServlet("/userdelete")
public class UserDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDeleteServlet() {
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
		int count = 0;
		
		
		user.setUserId(user_id);
		user.setUserName(user_name);
		
		UserDAO dao = new UserDAO();
		
		// リクエストスコープへの属性の設定
		request.setAttribute("user", user);
		
		try {
			// DAOの利用
			count = dao.userdelete(user);
			if(count != 0)
			{
				url = "user-delete-result.jsp";
			}
			else
			{
				url = "user-delete-failure.jsp";
			}
		}catch (SQLException | ClassNotFoundException e) {
			url = "user-delete-failure.jsp";
		}
		
			// リクエストの転送
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		}
	}
