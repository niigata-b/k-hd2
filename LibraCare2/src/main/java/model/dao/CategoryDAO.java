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
}

