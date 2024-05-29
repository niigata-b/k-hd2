<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書情報登録失敗画面</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>
<%
	BookBean book = (BookBean)request.getAttribute("book");
%>
<h2>図書管理</h2>
<h1>図書情報登録失敗画面</h1>
以下の内容の登録に失敗しました。<br>
<form action = "bookinsertconfirm" method="POST">
<input type="hidden" name ="isbn" value ="<%=book.getIsbn() %>">
<input type="hidden" name ="book_name" value ="<%=book.getBookName() %>">
<input type="hidden" name ="category_name" value ="<%=book.getCategoryName() %>">
<input type="hidden" name ="book_count" value ="<%=book.getBookCount() %>">
<input type="hidden" name ="cancel" value =1>
<input type="submit" value ="図書登録画面に戻る">
</form>
</body>
</html>