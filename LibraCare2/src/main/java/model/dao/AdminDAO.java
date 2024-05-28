package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.entity.AdminBean;



public class AdminDAO {

	public boolean loginCheck(String admin_id, String password) throws ClassNotFoundException, SQLException {

		String sql = "SELECT * FROM admin WHERE admin_id = ? AND password = ?";

		// データベースへの接続の取得、PreparedStatementの取得
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			// プレースホルダへの値の設定
			pstmt.setString(1, admin_id);
			pstmt.setString(2, password);

			// SQLステートメントの実行
			ResultSet res = pstmt.executeQuery();

			// 結果の操作
			if (res.next()) {
				return true;
			}
		}
		return false;
	}

	
	
	public List<AdminBean> selectAll() throws SQLException, ClassNotFoundException {

		List<AdminBean> adminList = new ArrayList<AdminBean>();

		try (Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				ResultSet res = stmt.executeQuery("SELECT * FROM admin")) {

			// 結果の操作
			while (res.next()) {
				String admin_id = res.getString("admin_id");
				String admin_name = res.getString("admin_name");
				String password = res.getString("password");

				AdminBean admin = new AdminBean();
				admin.setAdmin_id(admin_id);
				admin.setAdmin_name(admin_name);
				admin.setPassword(password);
				

				adminList.add(admin);
			}
		}
		return adminList;

	}
	public int admininsert(AdminBean admin) throws SQLException, ClassNotFoundException {
		String sql = "insert into admin (admin_id,admin_name,password) "
				+ "values(?,?,?)";
				
		int count = 0;
		// データベースへの接続の取得、Statementの取得、SQLステートメントの実行
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			// ?に値を格納
			pstmt.setString(1, admin.getAdmin_id());
			pstmt.setString(2, admin.getAdmin_name());
			pstmt.setString(3, admin.getPassword());

			
			count = pstmt.executeUpdate();
		}
		return count;
	}

}
