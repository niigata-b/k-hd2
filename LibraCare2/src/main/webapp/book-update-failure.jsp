<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書個数変更失敗画面</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>
<%
	BookBean book = (BookBean)request.getAttribute("book");
%>
<h2>図書管理</h2>
<h1>図書個数変更失敗画面</h1><br>
図書個数変更に失敗しました。
<form action ="bookdetail" method ="POST">
<input type ="hidden" name ="isbn" value ="<%=book.getIsbn() %>">
<input type ="submit" value="図書詳細画面に戻る">
</form>
</body>
</html>