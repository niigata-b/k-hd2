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
 * Servlet implementation class AdminDetailServlet
 */
@WebServlet("/admindetail") 
public class AdminDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDetailServlet() {
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

		System.out.println(admin_id);
		System.out.println("aa");
		String url = null;   
		
		AdminBean adminDetail = new AdminBean();
		AdminDAO dao = new AdminDAO();
		
		
		
		try { 
			
			adminDetail = dao.detail(admin_id);
			
			if (adminDetail!=null) {

				url = "admin-detail.jsp"; 
				

			} else {
				// 
				url = "admin-detail-failure.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("adminDetail", adminDetail);
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	} 
}
