<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書個数変更失敗画面</title>
<link rel="stylesheet" href="insert.css">
</head>
<body>
<%
	BookBean book = (BookBean)request.getAttribute("book");
%>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>図書個数変更失敗</h1>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<h2>図書個数を変更できませんでした。 </h2>
<form action ="bookdetail" method ="POST">
<input type ="hidden" name ="isbn" value ="<%=book.getIsbn() %>">
<input class ="bookdeleteform"type ="submit" value="図書詳細画面に戻る">
</form>
</body>
</html>