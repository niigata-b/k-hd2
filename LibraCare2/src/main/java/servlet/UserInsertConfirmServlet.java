package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.entity.UserBean;

/**
 * Servlet implementation class UserInsertConfirmServlet
 */
@WebServlet("/userinsertconfirm")
public class UserInsertConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserInsertConfirmServlet() {
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
		
		// リクエストオブジェクトのエンコーディング方式の指定
				request.setCharacterEncoding("UTF-8");
				
				// リクエストパラメータの取得
				String user_id = request.getParameter("user_id");
				String user_name = request.getParameter("user_name");

				int cancel = 0;
				
				try {
					cancel = Integer.parseInt(request.getParameter("cancel"));
				}
				catch(NumberFormatException e)
				{
					System.out.println("foiwe");
				}
				
				String messageNull;
				String url = "user-insert-confirm.jsp";
				
				if(user_id.equals("") || user_name.equals(""))
				{
					System.out.println("aaa");
					messageNull = "入力内容に不備があります";
					url = "user-insert.jsp";
					request.setAttribute("messageNull",messageNull);
				}
				
				
				UserBean user = new UserBean();
				user.setUserId(user_id);
				user.setUserName(user_name);
				
					// リクエストスコープへの属性の設定
				request.setAttribute("user", user);
				
				if(cancel == 1)
				{
					url = "user-insert.jsp";
				}
			
				
				// リクエストの転送
				RequestDispatcher rd = request.getRequestDispatcher(url);
				rd.forward(request, response);
	}

}
