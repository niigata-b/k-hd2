<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>削除失敗画面</title>
<link rel="stylesheet" href="insert.css">
</head>
<body>
<%
	BookBean book = (BookBean)request.getAttribute("book");
%>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>図書削除失敗</h1>
<br>
<br>
<br>
<h2>図書情報を削除出来ませんでした。</h2>
<form action ="bookdetail" method="POST">
<input type="hidden" name ="isbn" value ="<%=book.getIsbn() %>">
<input type="hidden" name ="book_name" value ="<%=book.getBookName() %>">
<input type="hidden" name ="category_name" value ="<%=book.getCategoryName() %>">
<input type="hidden" name ="book_count" value ="<%=book.getBookCount() %>">
<input class ="bookdeleteform"type ="submit" value="貸出情報詳細画面に戻る">
</form>
</body>
</html>