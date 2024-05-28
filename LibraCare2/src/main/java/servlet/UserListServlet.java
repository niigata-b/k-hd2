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

import model.dao.UserDAO;
import model.entity.UserBean;

/**
 * Servlet implementation class UserListServlet
 */
@WebServlet("/userlist")
public class UserListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserListServlet() {
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
		
		List<UserBean> userList = null;
		String url = null;
		
		UserDAO dao = new UserDAO();
		
		try {
			// DAOの利用
			
			userList = dao.selectAll();
			
			if(userList.size() != 0)
			{
				url = "user-list.jsp";
			}
			else
			{
				url = "user-list-failure.jsp";
			}
			
		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		// リクエストスコープへの属性の設定
				request.setAttribute("userList", userList);
		
				// リクエストの転送
				RequestDispatcher rd = request.getRequestDispatcher(url);
				rd.forward(request, response);
		
	}

}
