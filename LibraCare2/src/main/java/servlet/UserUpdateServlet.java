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
 * Servlet implementation class UserUpdateServlet
 */
@WebServlet("/userupdate")
public class UserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdateServlet() {
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
		
		String user_id = request.getParameter("user_id");
		String user_name = request.getParameter("user_name");
		
		int count = 0;
		String url = null;
		
		UserBean user = new UserBean();
		UserDAO dao = new UserDAO();
		
		user.setUserId(user_id);
		user.setUserName(user_name);
		
		// リクエストスコープへの属性の設定
				request.setAttribute("user", user);
				
			try {
				count = dao.userupdate(user);
			} catch(SQLException | ClassNotFoundException e) {
				e.printStackTrace();
			}
			
				if(count != 0)
				{
					url = "user-update-result.jsp";
				}
				else
				{
					url = "user-update-failure.jsp";
				}
				
				// リクエストの転送
				RequestDispatcher rd = request.getRequestDispatcher(url);
				rd.forward(request, response);
	}

}
