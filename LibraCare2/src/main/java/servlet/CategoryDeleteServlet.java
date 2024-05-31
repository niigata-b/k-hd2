package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.CategoryDAO;
import model.entity.BookBean;

/**
 * Servlet implementation class CategoryDeleteServlet
 */
@WebServlet("/categorydelete")
public class CategoryDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryDeleteServlet() {
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
		
		String category_name = request.getParameter("category_name"); 

		int count =0;
		String url =null;
		BookBean book = new BookBean(); 
		book.setCategoryName(category_name); 

		CategoryDAO dao = new CategoryDAO();  
			try {
				count = dao.categoryDelete(book);
			} catch (ClassNotFoundException e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO 自動生成された catch ブロック
				url = "category-delete-failure.jsp";
				e.printStackTrace();
			}
	
		if(count != 0) { 
			url= "categorydeleteresult.jsp";
		}
		else
		{
			url ="category-delete-failure.jsp";
		}
		
		request.setAttribute("book", book);

		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);

	


	}

}
