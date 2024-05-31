<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書冊数変更確認画面</title>
<link rel="stylesheet" href="insert.css">
</head>
<body>
<%
	BookBean book = (BookBean)request.getAttribute("book");
%>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>図書冊数変更確定　　</h1>
</div>
<br>
<p class="midasi">以下の内容で変更しました。</p>
<span>　ISBN：</span>
<input class ="inputform" type="text" name ="user_id" value="<%=book.getIsbn() %>" readonly>
<span>図書名：</span>
<input class ="inputform" type="text" name ="book_name" value="<%=book.getBookName() %>" readonly><br>
<span>　冊数：</span>
<input class ="inputform" type="text" name ="book_count" value="<%=book.getBookCount() %>" readonly><br>
<h2>から</h2>
<% 
if(book.getHuyasu() != 0) {
%>

<input class ="inputform" type="text" name ="huyasu" value ="<%=book.getHuyasu() %>">
<span>冊増やしました。</span>
<%
} else if(book.getHerasu() != 0) {
%>
<input class ="inputform" type="text" name ="herasu" value ="<%=book.getHerasu() %>">
<span>冊減らしました。</span>
<%
}
%>
<br>
<form action ="bookdetail" method ="POST">
<input type ="hidden" name ="isbn" value ="<%=book.getIsbn() %>">
<input class ="bookdeleteform"type ="submit" value="図書詳細画面に戻る">
</form>
</body>
</html>