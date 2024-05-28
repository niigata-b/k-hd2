<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>削除確認画面</title>
</head>
<body>
<%
	BookBean book = (BookBean)request.getAttribute("book");
%>
<h1>図書管理</h1>
<h1>削除確認画面</h1>
以下の図書を返却します。
よろしいですか？
<form action ="bookdelete" method="POST">
ISBN			:<input type ="label" name ="isbn" value="<%=book.getIsbn() %>" readonly><br>
図書名			:<input type ="label" name ="book_name" value="<%=book.getBookName() %>" readonly><br>
カテゴリ名		:<input type ="label" name ="category_name" value="<%=book.getCategoryName() %>" readonly><br>
個数			:<input type ="label" name ="book_count" value="<%=book.getBookCount() %>" readonly><br>
<input type ="submit" value = "削除確定">
</form>

<form action ="bookdetail" method="POST">
<input type ="hidden" name ="isbn" value="<%=book.getIsbn() %>">
<input type ="hidden" name ="book_name" value="<%=book.getBookName() %>">
<input type ="hidden" name ="category_name" value="<%=book.getCategoryName() %>">
<input type ="hidden" name ="book_count" value="<%=book.getBookCount() %>">
<input type ="submit" value="キャンセル">
</form>
</body>
</html>