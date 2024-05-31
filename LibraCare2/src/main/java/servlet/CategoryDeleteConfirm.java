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

import model.dao.CategoryDAO;
import model.entity.BookBean;

/**
 * Servlet implementation class CategoryDeleteConfirm
 */
@WebServlet("/categorydeleteconfirm")
public class CategoryDeleteConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryDeleteConfirm() {
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
		
		String url ="category-delete-confirm.jsp";
		
		int cancel = 0;
		
		List<BookBean> categoryList = null;
		
		CategoryDAO dao = new CategoryDAO(); 
		
			try {
				categoryList = dao.categoryAll();
			} catch (ClassNotFoundException e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO 自動生成された catch ブロック
					e.printStackTrace();
			}
		
			request.setAttribute("categoryList",categoryList);
			
		try {
			cancel = Integer.parseInt(request.getParameter("cancel"));
		}
		catch(Exception e)
		{
		}
		
		if (cancel == 1)
		{
			url = "categorydeleteform.jsp";
		}
		request.setAttribute("cancel", cancel);
		
		BookBean book = new BookBean();  
		
		book.setCategoryName(category_name); 
		
		request.setAttribute("book", book); 
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);

	} 
}

