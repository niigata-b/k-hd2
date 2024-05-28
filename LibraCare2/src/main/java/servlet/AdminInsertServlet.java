package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.AdminDAO;
import model.entity.AdminBean;



/**
 * Servlet implementation class AdminInsertServlet
 */
@WebServlet("/admininsert") 
public class AdminInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInsertServlet() {
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

		String admin_id = request.getParameter("admin_id");
		String admin_name = request.getParameter("admin_name");
		String password = request.getParameter("password");
		
		
		String url = null;
		int count = 0;

		AdminBean admin = new AdminBean();
		AdminDAO dao = new AdminDAO();

		admin.setAdmin_id(admin_id);
		admin.setAdmin_name(admin_name);
		admin.setPassword(password);

		
		try {
			// DAOの利用
			count = dao.admininsert(admin);

			// リクエストスコープへの属性の設定
			request.setAttribute("admin", admin);		
			

			if(count != 0)
			{
				url = "admin-insert-result.jsp";
			}
			else
			{
				url = "admin-insert-failure.jsp";
			}

		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			url = "admin-insert-failure.jsp";
		}
			
			
		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);	
	}

}

