<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>カテゴリー登録確認画面</h2> 
	
	<% 
	BookBean book = (BookBean) request.getAttribute("book");  
	%>  
	
	<form action="categorydelete" method="post">
	以下のカテゴリ名を削除します。<br>
	よろしいですか<br>
	カテゴリー名:<input type="text" name ="category_name" value="<%=book.getCategoryName() %>" readonly><br> 
	
	
	<input type="submit" value="削除確定">
	</form> 
	
	<form action="booklist" method="post"> 
	<input type="submit" value="キャンセル">
	</form> 
</body>
</html>