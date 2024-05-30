package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.entity.AdminBean;





/**
 * Servlet implementation class AdminInsertConfirmServlet
 */
@WebServlet("/admininsertconfirm")
public class AdminInsertConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInsertConfirmServlet() {
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

		String admin_id = request.getParameter("admin_id");
		String admin_name = request.getParameter("admin_name");
		String password = request.getParameter("password");
		
		String url  = "admin-insert-confirm.jsp";

		String messageNull;
		
		AdminBean admin = new AdminBean();
		admin.setAdmin_id(admin_id);
		admin.setAdmin_name(admin_name);
		admin.setPassword(password);

		
		
		if(admin_id.equals("") || admin_name.equals("") || password.equals("")||password.length() < 8)
		{
			
			messageNull = "入力内容に不備があります";
			url = "admin-insert.jsp";
			request.setAttribute("messageNull",messageNull);
		}
		
		
		// リクエストスコープへの属性の設定
		request.setAttribute("admin", admin);



		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}

