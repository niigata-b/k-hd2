package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;

import model.entity.UserBean;


/**
 * Servlet implementation class UserDAO
 */
@WebServlet("/UserDAO")
public class UserDAO {
	//一覧表示
	public List<UserBean> selectAll() throws SQLException,ClassNotFoundException{
		
		List<UserBean> userList = new ArrayList<UserBean>();
		
		try(Connection con = ConnectionManager.getConnection(); 
				Statement stmt = con.createStatement();
				ResultSet res = stmt.executeQuery("SELECT * FROM user")) {
			
			
			// 結果の操作
			while (res.next()) {
				String user_id = res.getString("user_id");
				String user_name = res.getString("user_name");


				UserBean user = new UserBean();
				user.setUserId(user_id);
				user.setUserName(user_name);
				
				
				userList.add(user);
			}
		}
		return userList;

	}
	
	//詳細表示
	public UserBean detail(UserBean user) throws SQLException, ClassNotFoundException{
		
		UserBean userdetail = new UserBean();
		
		String sql = "SELECT * FROM user where user_id =?";
		try(Connection con = ConnectionManager.getConnection(); 
				PreparedStatement pstmt = con.prepareStatement(sql)){
				
			// ?に値を格納
						pstmt.setString(1, user.getUserId());

						// SQLの実行
						ResultSet res = pstmt.executeQuery();

						// 実行結果を行単位で参照するループ
						while (res.next()) {
							// 結果を変数に格納
							String user_id = res.getString("user_id");
							String user_name = res.getString("user_name");
							
							// 変数の値をBeanに格納
							
							userdetail.setUserId(user_id);
							userdetail.setUserName(user_name);
							
						}
					}
					return userdetail;
				}
	

	//ユーザ登録
	public int userinsert(UserBean user) throws SQLException, ClassNotFoundException{

		//UserBean userinsert = new UserBean();
		
		String sql = "insert into user (user_id,user_name) "
				+ "values(?,?)";
		
		int count = 0;
		
		try(Connection con = ConnectionManager.getConnection(); 
				PreparedStatement pstmt = con.prepareStatement(sql)){
    
			// ?に値を格納
						pstmt.setString(1, user.getUserId());
						pstmt.setString(2, user.getUserName());
						
						count = pstmt.executeUpdate();
					}
					return count;
				}

	
	//ユーザ削除
	public int userdelete(UserBean user) throws SQLException, ClassNotFoundException {
		String sql = "delete from user where user_id = ? and user_name = ?";
		int count = 0;
		
		// データベースへの接続の取得、Statementの取得、SQLステートメントの実行
				try (Connection con = ConnectionManager.getConnection();
						PreparedStatement pstmt = con.prepareStatement(sql)){
					
					// ?に値を格納
					pstmt.setString(1, user.getUserId());
					pstmt.setString(2, user.getUserName());
					
					count = pstmt.executeUpdate();
				}
				return count;
			}
	
	

	//ユーザ変更
	public int userupdate(UserBean user) throws SQLException, ClassNotFoundException {
		
		String sql = "update user set user_id = ?, user_name = ? where user_id = ?";
		int count = 0;
		
		// データベースへの接続の取得、Statementの取得、SQLステートメントの実行
				try (Connection con = ConnectionManager.getConnection();
						PreparedStatement pstmt = con.prepareStatement(sql)){

					pstmt.setString(1, user.getUserId());
					pstmt.setString(2, user.getUserName());
					pstmt.setString(3, user.getUserId());

					count = pstmt.executeUpdate();
					System.out.println("huyasu"+count);
				}
				return count;
		}
	}