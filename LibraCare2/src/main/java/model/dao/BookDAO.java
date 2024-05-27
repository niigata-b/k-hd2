package model.dao;

import java.sql.Connection;
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

	}



