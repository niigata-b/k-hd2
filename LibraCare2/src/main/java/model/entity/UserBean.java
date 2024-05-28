package model.entity;

import java.io.Serializable;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/**
 * Servlet implementation class UserBean
 */
@WebServlet("/UserBean")
public class UserBean implements Serializable {
	/**
	 * @see HttpServlet#HttpServlet()
	 */

	// 利用者ID
	private String user_id;
	// 利用者名
	private String user_name;


	public UserBean() {
		super();
		// TODO Auto-generated constructor stub

	}

	// ゲッター
	public String getUserId()
	{
		return user_id;
	}

	public String getUserName()
	{
		return user_name;
	}

	// セッター
	public void setUserId(String user_id)
	{
		this.user_id = user_id;
	}

	public void setUserName(String user_name)
	{
		this.user_name = user_name;
	}


}
