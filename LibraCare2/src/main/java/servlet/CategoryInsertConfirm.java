package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.entity.BookBean;

/**
 * Servlet implementation class CategoryInsertConfirm
 */
@WebServlet("/categoryinsertconfirm")
public class CategoryInsertConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryInsertConfirm() {
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
		
		
		String messageNull;
		String url = "category-insert-confirm.jsp";

		if(category_name.equals(""))
		{
			messageNull = "入力内容に不備があります";
			url = "category-insert.jsp";
			request.setAttribute("messageNull",messageNull);
		}
		
	

		BookBean book = new BookBean();
		book.setCategoryName(category_name);
		

		// リクエストスコープへの属性の設定
		request.setAttribute("book", book);

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	} 
}
