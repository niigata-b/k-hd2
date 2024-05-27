<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書個数変更画面</title>
</head>
<body>
<% 
	BookBean book = (BookBean) request.getAttribute("book");
%> 
<h2>図書管理</h2>
<h1>図書個数変更画面</h1>
ISBN：<%=book.getIsbn() %>
図書名：<%=book.getBookName() %>
個数：<%=book.getBookCount() %>
総個数：<%=book.getTotalBookCount() %>

<form action ="bookupdateconfirm" method ="POST">
増やす：<input type ="text" name="huyasu">
減らす：<input type ="text" name="herasu">
<input type="hidden" name ="isbn" value="<%=book.getIsbn() %>">
<input type="hidden" name ="book_name" value="<%=book.getBookName() %>">
<input type="hidden" name ="book_count" value="<%=book.getBookCount() %>">
<input type="hidden" name ="total_book_count" value="<%=book.getTotalBookCount() %>">
<input type="submit" value="変更">
</form>

<form action ="bookdetail" method ="POST">
<input type="hidden" name ="isbn" value="<%=book.getIsbn() %>">
<input type="submit" value ="キャンセル">
</form>
</body>
</html>