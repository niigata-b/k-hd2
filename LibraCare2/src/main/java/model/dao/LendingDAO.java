package model.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;

import model.entity.LendingBean;

/**
 * Servlet implementation class LendingDAO
 */
@WebServlet("/LendingDAO")
public class LendingDAO {

	public List<LendingBean> selectAll() throws SQLException, ClassNotFoundException {
		List<LendingBean> lendingList = new ArrayList<LendingBean>();

		// isbn,図書名,ユーザID,ユーザ名,超過フラグを取得
		String sql = "select book.isbn,book_name,user.user_id,user_name,expired_flag from book "
				+ "inner join lending on book.isbn = lending.isbn"
				+ " inner join user on lending.user_id = user.user_id";

		//String sql2 = "select isbn, user_id, expired_flag from lending";

		// データベースへの接続の取得、Statementの取得、SQLステートメントの実行
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			// SQLの実行
			ResultSet res = pstmt.executeQuery();

			// 実行結果を行単位で参照するループ
			while (res.next()) {
				// 結果を変数に格納
				String isbn = res.getString("isbn");
				String book_name = res.getString("book_name");
				String user_id = res.getString("user_id");
				String user_name = res.getString("user_name");
				String expired_flag = res.getString("expired_flag");

				// 変数の値をBeanに格納
				LendingBean lending = new LendingBean();
				lending.setIsbn(isbn);
				lending.setBookName(book_name);
				lending.setUserId(user_id);
				lending.setUserName(user_name);
				lending.setExpiredFlag(expired_flag);

				// Beanをリストに格納
				lendingList.add(lending);
			}
			// リストを戻す
			return lendingList;
		}
	}

	public LendingBean detail(LendingBean lending) throws SQLException, ClassNotFoundException{

		// 詳細画面用SQL
		String sql = "select book.isbn,book_name,user.user_id,user_name,lending_count,"
				+ "start_date,deadline_date,expired_flag from book "
				+ "inner join lending on book.isbn = lending.isbn "
				+ "inner join user on lending.user_id = user.user_id "
				+ "where book.isbn = ? and user.user_id = ?";

		LendingBean lendingret = new LendingBean();

		// データベースへの接続の取得、Statementの取得、SQLステートメントの実行
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){


			// ?に値を格納
			pstmt.setString(1, lending.getIsbn());
			pstmt.setString(2, lending.getUserId());

			// SQLの実行
			ResultSet res = pstmt.executeQuery();

			// 実行結果を行単位で参照するループ
			while (res.next()) {
				// 結果を変数に格納
				String isbn = res.getString("isbn");
				String book_name = res.getString("book_name");
				String user_id = res.getString("user_id");
				String user_name = res.getString("user_name");
				// Stringをintに変換
				int lending_count = Integer.parseInt(res.getString("lending_count"));
				String start_date = res.getString("start_date");
				String deadline_date = res.getString("deadline_date");
				String expired_flag = res.getString("expired_flag");

				// 変数の値をBeanに格納
				lendingret.setIsbn(isbn);
				lendingret.setBookName(book_name);
				lendingret.setUserId(user_id);
				lendingret.setUserName(user_name);
				lendingret.setLendingCount(lending_count);
				lendingret.setStartDate(start_date);
				lendingret.setDeadlineDate(deadline_date);
				lendingret.setExpiredFlag(expired_flag);
			}
		}
		return lendingret;
	}

	public void updateExpired() throws SQLException, ClassNotFoundException {
		String sql = "update lending set expired_flag = '〇' where deadline_date < CURRENT_DATE";
		// データベースへの接続の取得、Statementの取得、SQLステートメントの実行
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			pstmt.executeUpdate();
		}
	}

	public int loan(LendingBean lending) throws SQLException, ClassNotFoundException {
		String sql = "insert into lending (user_id,isbn,lending_count,deadline_date) "
				+ "values(?,?,?,DATE_ADD(CURRENT_DATE,INTERVAL 7 DAY))";
		int count = 0;
		// データベースへの接続の取得、Statementの取得、SQLステートメントの実行
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			if(lending.getLendingCount() <= lending.getBookCount())
			{
				pstmt.setString(1, lending.getUserId());
				pstmt.setString(2, lending.getIsbn());
				pstmt.setInt(3, lending.getLendingCount());

				count = pstmt.executeUpdate();
			}
		}
		return count;
	}

	public int returnbook(LendingBean lending) throws SQLException, ClassNotFoundException {
		String sql = "delete from lending where user_id = ? and isbn = ?";
		int count = 0;
		// データベースへの接続の取得、Statementの取得、SQLステートメントの実行
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			// ?に値を格納
			pstmt.setString(1, lending.getUserId());
			pstmt.setString(2, lending.getIsbn());

			count = pstmt.executeUpdate();
		}
		return count;
	}

	public List<LendingBean> search(LendingBean lending) throws SQLException, ClassNotFoundException {
		List<LendingBean> lendingList = new ArrayList<LendingBean>();

		// isbn,図書名,ユーザID,ユーザ名,超過フラグを取得
		String sql = "select book.isbn,book_name,user.user_id,user_name,expired_flag from book "
				+ "inner join lending on book.isbn = lending.isbn"
				+ " inner join user on lending.user_id = user.user_id "
				+ "where book.isbn = ? and user.user_id = ?";

		// データベースへの接続の取得、Statementの取得、SQLステートメントの実行
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			pstmt.setString(1, lending.getIsbn());
			pstmt.setString(2, lending.getUserId());

			// SQLの実行
			ResultSet res = pstmt.executeQuery();

			// 実行結果を行単位で参照するループ
			while (res.next()) {
				// 結果を変数に格納
				String isbn = res.getString("isbn");
				String book_name = res.getString("book_name");
				String user_id = res.getString("user_id");
				String user_name = res.getString("user_name");
				String expired_flag = res.getString("expired_flag");

				// 変数の値をBeanに格納
				LendingBean lendingret = new LendingBean();
				lendingret.setIsbn(isbn);
				lendingret.setBookName(book_name);
				lendingret.setUserId(user_id);
				lendingret.setUserName(user_name);
				lendingret.setExpiredFlag(expired_flag);

				// Beanをリストに格納
				lendingList.add(lendingret);
			}
			// リストを戻す
			return lendingList;
		}
	} 

	public int loanCount(LendingBean lending) throws SQLException, ClassNotFoundException{

		// 詳細画面用SQL
		String sql = "select book_count from book where book.isbn = ?";
		int book_count = 0;

		// データベースへの接続の取得、Statementの取得、SQLステートメントの実行
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			// ?に値を格納
			pstmt.setString(1, lending.getIsbn());

			// SQLの実行
			ResultSet res = pstmt.executeQuery();

			// 実行結果を行単位で参照するループ
			while (res.next()) {
				// 結果を変数に格納
				book_count = res.getInt("book_count");

			}
		}
		return book_count;
	}
}