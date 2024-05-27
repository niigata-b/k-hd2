package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.entity.BookBean;

public class BookDAO { 
	
	public List<BookBean> selectAll() throws SQLException,ClassNotFoundException{ 
		
		List<BookBean> bookList = new ArrayList<BookBean>(); 
		
		try(Connection con = ConnectionManager.getConnection(); 
						Statement stmt = con.createStatement();
						ResultSet res = stmt.executeQuery("SELECT * FROM book")) {

					// 結果の操作
					while (res.next()) {
						String isbn = res.getString("isbn");
						String book_name = res.getString("book_name");
						String category_name = res.getString("category_name"); 
						int book_count = res.getInt("book_count"); 
						String lending_flag = res.getString("lending_flag");

						BookBean book = new BookBean();
						book.setIsbn(isbn);
						book.setBookName(book_name);
						book.setCategoryName(category_name);
						book.setBookCount(book_count);
						book.setLendingFlag(lending_flag); 
						
						bookList.add(book);
					}
				}
				return bookList;
			
	}


	public BookBean detail(String isbn) throws SQLException,ClassNotFoundException{ 
		BookBean book = new BookBean();
		
		String sql = "SELECT * FROM book where isbn =?";
		try(Connection con = ConnectionManager.getConnection(); 
				PreparedStatement pstmt = con.prepareStatement(sql)){
				
			
			pstmt.setString(1,isbn); 
			
			ResultSet res = pstmt.executeQuery(); 
			
			while(res.next()) { 
				book.setIsbn(res.getString("isbn"));
				book.setBookName(res.getString("book_name"));
				book.setCategoryName(res.getString("category_name"));
				book.setBookCount(res.getInt("book_count"));
				book.setLendingFlag(res.getString("lending_flag")); 
				
				
			}
	} 
		return book;

	} 
	public int bookinsert(BookBean book) throws SQLException, ClassNotFoundException {
		String sql = "insert into book (isbn,book_name,category_name,book_count,total_book_count) "
				+ "values(?,?,?,?,?)";
				
		int count = 0;
		// データベースへの接続の取得、Statementの取得、SQLステートメントの実行
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			// ?に値を格納
			pstmt.setString(1, book.getIsbn());
			pstmt.setString(2, book.getBookName());
			pstmt.setString(3, book.getCategoryName());
			pstmt.setInt(4, book.getBookCount());
			pstmt.setInt(5, book.getTotalBookCount());
			
			count = pstmt.executeUpdate();
		}
		return count;
	}
	
	public int bookdelete(BookBean book) throws SQLException, ClassNotFoundException {
		String sql = "delete from book where isbn = ? book_name = ? category_name = ? book_count = ? book_total_count = ?";
		int count = 0;
		// データベースへの接続の取得、Statementの取得、SQLステートメントの実行
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			// ?に値を格納
			pstmt.setString(1, book.getIsbn());
			pstmt.setString(2, book.getBookName());
			pstmt.setString(3, book.getCategoryName());
			pstmt.setInt(4, book.getBookCount());
			pstmt.setInt(5, book.getTotalBookCount());
			
			count = pstmt.executeUpdate();//わお
		}
		return count;
	}
	
}

	


