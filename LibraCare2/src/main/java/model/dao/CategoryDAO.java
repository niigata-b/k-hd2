package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
	}
