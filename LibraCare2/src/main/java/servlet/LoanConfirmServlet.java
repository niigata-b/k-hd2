package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.entity.LendingBean;

/**
 * Servlet implementation class LoanConfirmServlet
 */
@WebServlet("/loanconfirm")
public class LoanConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoanConfirmServlet() {
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

		String user_id = request.getParameter("user_id");
		String isbn = request.getParameter("isbn");
		int lending_count = 1;
		int cancel = 0;
		try {
			cancel = Integer.parseInt(request.getParameter("cancel"));
		}
		catch(NumberFormatException e)
		{
			
		}
		
		String messageNum;
		String messageNull;
		String url = "loan-confirm.jsp";

		if(user_id.equals("") || isbn.equals(""))
		{
			messageNull = "登録する情報を入力してください。";
			url = "loan.jsp";
			request.setAttribute("messageNull",messageNull);
		}
		
		try 
		{
			lending_count = Integer.parseInt(request.getParameter("lending_count"));
		}
		catch(NumberFormatException e)
		{
			messageNum = "数字を入力してください。";
			url = "loan.jsp";
			request.setAttribute("messageNum",messageNum);
		}

		LendingBean lending = new LendingBean();
		lending.setUserId(user_id);
		lending.setIsbn(isbn);
		lending.setLendingCount(lending_count);

		// リクエストスコープへの属性の設定
		request.setAttribute("lending", lending);
		
		if(cancel == 1)
		{
			url = "loan.jsp";
		}

		// リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
