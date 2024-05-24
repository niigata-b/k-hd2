package model.entity;

public class BookBean { 
	
	private String isbn; 
	
	private String book_name; 
	
	private String category_name; 
	
	private int book_count; 
	
	private int book_total_count; 
	
	private int total_lending_count; 
	
	private String lending_flag; 
	
	public  BookBean() {}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getBookName() {
		return book_name;
	}

	public void setBookName(String book_name) {
		this.book_name = book_name;
	}

	public String getCategoryName() {
		return category_name;
	}

	public void setCategoryName(String category_name) {
		this.category_name = category_name;
	}

	public int getBookCount() {
		return book_count;
	}

	public void setBookCount(int book_count) {
		this.book_count = book_count;
	}

	public int getTotalBookCount() {
		return book_total_count;
	}

	public void setTotalBookCount(int book_total_count) {
		this.book_total_count = book_total_count;
	}

	public int getTotalLendingCount() {
		return total_lending_count;
	}

	public void setTotalLendingCount(int total_lending_count) {
		this.total_lending_count = total_lending_count;
	}

	public String getLendingFlag() {
		return lending_flag;
	}

	public void setLendingFlag(String lending_flag) {
		this.lending_flag = lending_flag;
	};

}
