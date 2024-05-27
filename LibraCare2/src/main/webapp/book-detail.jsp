<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"import="java.util.List,model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>図書詳細画面</h2> 
	<% 
	List<BookBean> bookDetail =(List<BookBean>) request.getAttribute("bookDetail");  
	%>
	<% 
	for(BookBean bookdetail : bookDetail){  
	%>
		
			ISBN<%=bookdetail.getIsbn() %>
			図書名<%=bookdetail.getBookName() %>
			カテゴリ名<%=bookdetail.getCategoryName() %>
			個数<%=bookdetail.getBookCount() %>
			貸出中フラグ<%=bookdetail.getLendingFlag() %>
	<form action="book-insert.jsp"> 
	<input type="submit" value="図書詳細情報変更">
	</form> 
	<form action="book-delete.jsp"> 
	<input type="submit" value="図書詳細情報削除">
	</form>
	<form action="bookdetailservlet" method="post">
		<input type="submit" value="図書一覧画面に戻る">
	</form>
</body>
</html>