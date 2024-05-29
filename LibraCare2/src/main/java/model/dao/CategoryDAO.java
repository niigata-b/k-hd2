package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.entity.BookBean;

public class CategoryDAO {
	


		public int categoryInsert(BookBean book) throws SQLException,ClassNotFoundException{  
			int count = 0;
			try (Connection con = ConnectionManager.getConnection();
					PreparedStatement pstmt = con.prepareStatement("insert into category values(?)")) {

				// DTOからのデータの取り出し
				String category_name = book.getCategoryName();

				// プレースホルダへの値の設定
				pstmt.setString(1, category_name);

				// SQLステートメントの実行
				count = pstmt.executeUpdate();
			}

			return count;

		}
		public List<BookBean> categoryAll() throws SQLException,ClassNotFoundException{ 

			List<BookBean> categoryList = new ArrayList<BookBean>(); 

			try(Connection con = ConnectionManager.getConnection(); 
					Statement stmt = con.createStatement();
					ResultSet res = stmt.executeQuery("SELECT * FROM category")) {

				// 結果の操作
				while (res.next()) {
					
					String category_name = res.getString("category_name"); 
					
					BookBean book = new BookBean();
					
					book.setCategoryName(category_name);
					
					categoryList.add(book);
				}
			}
			return categoryList;

		} 
		public int categoryDelete(BookBean book) throws SQLException,ClassNotFoundException{ 
			String sql = "delete from category where  category_name = ?"; 
			
				int count = 0;
				// データベースへの接続の取得、Statementの取得、SQLステートメントの実行
				try (Connection con = ConnectionManager.getConnection();
						PreparedStatement pstmt = con.prepareStatement(sql)){

					// ?に値を格納
					pstmt.setString(1, book.getCategoryName());
					

					count = pstmt.executeUpdate();//わお
				}
				return count;
			} 
		public List<BookBean> categorySearch(BookBean book) throws SQLException, ClassNotFoundException {
			List<BookBean> bookList = new ArrayList<BookBean>();


			String sql = "select * from book where category_name = ?";

			try (Connection con = ConnectionManager.getConnection();
					PreparedStatement pstmt = con.prepareStatement(sql)){

				pstmt.setString(1, book.getCategoryName());


				// SQLの実行
				ResultSet res = pstmt.executeQuery();

				while (res.next()) {
					// 結果を変数に格納
					String isbn = res.getString("isbn");
					String book_name = res.getString("book_name");
					String category_name = res.getString("category_name");
					int book_count = res.getInt("book_count");
					String lending_flag = res.getString("lending_flag");

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
			
			
			
			
			
			
			
			
			

