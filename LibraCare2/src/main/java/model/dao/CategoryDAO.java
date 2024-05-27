package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.entity.BookBean;

public class CategoryDAO {
	public List<BookBean> bookSearch(BookBean book) throws SQLException, ClassNotFoundException {
		List<BookBean> bookList = new ArrayList<BookBean>();

		
		String sql = "select * from book where category_name = ?";

try (Connection con = ConnectionManager.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql)){

	pstmt.setString(1, book.getCategoryName());
	

	// SQLの実行
	ResultSet res = pstmt.executeQuery();

	// 実行結果を行単位で参照するループ
	while (res.next()) {
		// 結果を変数に格納
		String isbn = res.getString("isbn");
		String book_name = res.getString("book_name");
		String category_name = res.getString("category_name");
		int book_count = res.getInt("book_count");
		String lending_flag = res.getString("lending_flag");

		// 変数の値をBeanに格納
		BookBean bookbean = new BookBean();
		bookbean.setIsbn(isbn);
		bookbean.setBookName(book_name);
		bookbean.setCategoryName(category_name);
		bookbean.setBookCount(book_count);
		bookbean.setLendingFlag(lending_flag);

		// Beanをリストに格納
		bookList.add(bookbean);
	}
	// リストを戻す
	return bookList;
}
	} 
}

	


	
