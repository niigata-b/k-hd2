<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書情報登録確認画面</title>
</head>
<body>
<%
	BookBean book = (BookBean)request.getAttribute("book");
%>
<h1>図書管理</h1>
<h1>図書情報登録確認画面あ</h1>
以下の内容で登録します。<br>
よろしいですか？

<form action ="bookinsert" method="POST">
ユーザID：<input type="text" name ="isbn" value="<%=book.getIsbn() %>" readonly><br>
図書名：<input type="text" name ="book_name" value="<%=book.getBookName() %>" readonly><br>
カテゴリ名：<input type="text" name ="category_name" value="<%=book.getCategoryName() %>" readonly><br>
個数：<input type="text" name ="book_count" value="<%=book.getBookCount() %>" readonly><br>
<input type ="submit" value="図書登録確定">
</form>

<form action ="bookinsertconfirm" method="POST">
<input type="hidden" name ="isbn" value ="<%=book.getIsbn() %>">
<input type="hidden" name ="book_name" value ="<%=book.getBookName() %>">
<input type="hidden" name ="category_name" value ="<%=book.getCategoryName() %>">
<input type="hidden" name ="book_count" value ="<%=book.getBookCount() %>">

<input type="hidden" name ="cancel" value =1>
<input type="submit" value ="キャンセル">
</form>
</body>
</html>