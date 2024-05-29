<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書個数変更確認画面</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>
<%
	BookBean book = (BookBean)request.getAttribute("book");
%>
<h2>図書管理</h2>
<h1>図書個数変更確定画面</h1>
以下の図書の個数を変更しました。<br>
ISBN：<input type="text" name ="user_id" value="<%=book.getIsbn() %>" readonly><br>
図書名：<input type="text" name ="book_name" value="<%=book.getBookName() %>" readonly><br>
個数：<input type="text" name ="book_count" value="<%=book.getBookCount() %>" readonly><br>
から
<% 
if(book.getHuyasu() != 0) {
%>
<input type="text" name ="huyasu" value ="<%=book.getHuyasu() %>">個増やしました。<br>
<%
} else if(book.getHerasu() != 0) {
%>
<input type="text" name ="herasu" value ="<%=book.getHerasu() %>">個減らしました。<br>
<%
}
%>
<br>
<form action ="bookdetail" method ="POST">
<input type ="hidden" name ="isbn" value ="<%=book.getIsbn() %>">
<input type ="submit" value="図書詳細画面に戻る">
</form>
</body>
</html>