package model.entity;

import java.io.Serializable;

import javax.servlet.annotation.WebServlet;

/**
 * Servlet implementation class LendingBean
 */
@WebServlet("/LendingBean")
public class LendingBean implements Serializable {
       
	// 利用者ID
    private String user_id;
    // 利用者名
    private String user_name;
    // 図書の識別番号
    private String isbn;
    // 図書名
    private String book_name;
    // 貸出個数
    private int lending_count;
    // 図書個数
    private int book_count;
    // 貸出開始日
    private String start_date;
    // 返却期限日
    private String deadline_date;
    // 期限超過フラグ
    private String expired_flag;
    
    public LendingBean() {
        super();
        // TODO Auto-generated constructor stub
    }
    // ゲッター
    public String getUserId()
    {
    	return user_id;
    }
    
    public String getUserName()
    {
    	return user_name;
    }
    
    public String getIsbn()
    {
    	return isbn;
    }
    
    public String getBookName()
    {
    	return book_name;
    }
    
    public int getLendingCount()
    {
    	return lending_count;
    }
    
    public int getBookCount()
    {
    	return book_count;
    }
    
    public String getStartDate()
    {
    	return start_date;
    }
    
    public String getDeadlineDate()
    {
    	return deadline_date;
    }
    
    public String getExpiredFlag()
    {
    	return expired_flag;
    }
    
    // セッター
    public void setUserId(String user_id)
    {
    	this.user_id = user_id;
    }
    
    public void setUserName(String user_name)
    {
    	this.user_name = user_name;
    }
    
    public void setIsbn(String isbn)
    {
    	this.isbn = isbn;
    }
    
    public void setBookName(String book_name)
    {
    	this.book_name = book_name;
    }
    
    public void setLendingCount(int lending_count)
    {
    	this.lending_count = lending_count;
    }
    
    public void setBookCount(int book_count)
    {
    	this.book_count = book_count;
    }
    
    public void setStartDate(String start_date)
    {
    	this.start_date = start_date;
    }
    
    public void setDeadlineDate(String deadline_date)
    {
    	this.deadline_date = deadline_date;
    }
    
    public void setExpiredFlag(String expired_flag)
    {
    	this.expired_flag = expired_flag;
    }
}
