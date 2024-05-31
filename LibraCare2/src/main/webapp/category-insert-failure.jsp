<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>カテゴリ登録失敗画面</title>
<link rel="stylesheet" href="insert.css">
</head>
<body>
	<%
	BookBean book = (BookBean)request.getAttribute("book"); 
	%>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>カテゴリ登録失敗</h1>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<h2>カテゴリを登録できませんでした。 </h2>  
<form action ="booklist" method="POST"> 
<input type="hidden" name ="category_name" value ="<%=book.getCategoryName() %>">
<input class ="bookdeleteform"type="submit" value="図書一覧に戻る">
</form>
</body>
</html>