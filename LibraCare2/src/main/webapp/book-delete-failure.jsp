<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>削除失敗画面</title>
</head>
<body>
<%
	BookBean book = (BookBean)request.getAttribute("book");
%>
<h1>図書管理</h1>
<h1>削除失敗画面</h1>
図書情報削除出来ませんでした。
<form action ="bookdetail" method="POST">
<input type="hidden" name ="isbn" value ="<%=book.getIsbn() %>">
<input type="hidden" name ="book_name" value ="<%=book.getBookName() %>">
<input type="hidden" name ="category_name" value ="<%=book.getCategoryName() %>">
<input type="hidden" name ="book_count" value ="<%=book.getBookCount() %>">
<input type ="submit" value="貸出情報詳細画面に戻る">
</form>
</body>
</html>