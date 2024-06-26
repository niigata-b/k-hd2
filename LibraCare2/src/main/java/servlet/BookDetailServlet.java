package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.BookDAO;
import model.entity.BookBean;

/**
 * Servlet implementation class BookDetailServlet
 */
@WebServlet("/bookdetail")
public class BookDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookDetailServlet() {
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
		
		String isbn = request.getParameter("isbn");
		
		String url = null;   
		
		BookDAO dao = new BookDAO();
		try { 
			
			BookBean bookDetail = dao.detail(isbn);
			if (bookDetail!=null) {

				url = "book-detail.jsp"; //図書詳細画面へ 
				request.setAttribute("bookDetail", bookDetail);

			} else {
				// 未認証
				url = "book-detail-failure.jsp";//図書詳細失敗画面へ
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	} 
}

	
		
		
		
		
		
		
		