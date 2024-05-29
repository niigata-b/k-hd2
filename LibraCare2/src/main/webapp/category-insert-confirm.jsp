<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>カテゴリー登録確認画面</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>
	<h2>カテゴリー登録確認画面</h2> 
	
	<% 
	BookBean book = (BookBean) request.getAttribute("book");  
	%>  
	
	<form action="categoryinsert" method="post">
	以下のカテゴリ名を登録します。<br>
	よろしいですか<br>
	カテゴリー名:
	<input type="text" name ="category_name" value="<%=book.getCategoryName() %>" readonly><br> 
	<input type="submit" value="登録確定">
	</form> 
	
	<form action="categoryinsertconfirm" method="post"> 
	<input type="hidden" name ="category_name" value="<%=book.getCategoryName() %>">
	<input type="hidden" name ="cancel" value=1>
	<input type="submit" value="キャンセル">
	</form> 
	
</body>
</html>