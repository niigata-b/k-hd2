<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>カテゴリ登録失敗画面</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>
	<h2>カテゴリ登録失敗画面</h2>
	<%
	BookBean book = (BookBean)request.getAttribute("book"); 
	%>
	以下のカテゴリ名は既に登録されています。  
	<form action ="booklist" method="POST"> 
	<input type="hidden" name ="category_name" value ="<%=book.getCategoryName() %>">
	<input type="submit" value="図書一覧に戻る">
	</form>
</body>
</html>