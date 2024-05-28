<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List,model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書詳細画面</title>
<style>
body {
text-align:center;
}
</style>
</head>
<body>
	<h2>図書管理</h2>
	<h1>図書詳細画面</h1>
	<% 
	BookBean bookdetail = (BookBean) request.getAttribute("bookDetail");
	%> 
	ISBN：
	<%=bookdetail.getIsbn() %><br>
	図書名：
	<%=bookdetail.getBookName() %><br>
	カテゴリー名：
	<%=bookdetail.getCategoryName() %><br>
	個数：
	<%=bookdetail.getBookCount() %><br>
	総個数：
	<%=bookdetail.getTotalBookCount() %><br>
	総貸出個数：
	<%=bookdetail.getTotalLendingCount() %><br>
	貸出中フラグ：
	<%=bookdetail.getLendingFlag() %> <br>

	<form action="bookupdateform" method ="POST">
		<input type="hidden" name ="isbn" value="<%=bookdetail.getIsbn() %>">
		<input type="hidden" name ="book_name" value="<%=bookdetail.getBookName() %>">
		<input type="hidden" name ="category_name" value="<%=bookdetail.getCategoryName() %>">
		<input type="hidden" name ="book_count" value="<%=bookdetail.getBookCount() %>">
		<input type="hidden" name ="total_book_count" value="<%=bookdetail.getBookCount() %>">
		<input type="hidden" name ="lending_flag" value="<%=bookdetail.getLendingFlag() %>">
		<input type="submit" value="図書詳細情報変更">
	</form>
	<form action="book-delete.jsp" metohd ="POST">
		<input type="submit" value="図書詳細情報削除">
	</form>
	<form action="booklist" method="POST">
		<input type="submit" value="図書一覧画面に戻る">
	</form>
</body>
</html>