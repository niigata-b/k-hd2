package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.AdminDAO;
import model.entity.AdminBean;

/**
 * Servlet implementation class AdminUpdateFormServlet
 */
@WebServlet("/adminupdateform")
public class AdminUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminUpdateFormServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String admin_id = request.getParameter("admin_id");


String url = null;   
		
		AdminBean admin = new AdminBean();
		AdminDAO dao = new AdminDAO();
		
	
		try { 
			
			admin = dao.detail(admin_id);
			
			if (admin!=null) {

				url = "admin-update.jsp"; 
				

			} else {
				// 
				url = "admin-update.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("admin", admin);
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	} 
}