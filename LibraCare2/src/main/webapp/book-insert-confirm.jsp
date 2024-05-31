<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書情報登録確認画面</title>
<link rel="stylesheet" href="insert.css">
</head>
<body>
<%
	BookBean book = (BookBean)request.getAttribute("book");
%>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>図書登録確認　　　</h1>
</div>
<br>
<p class="midasi">以下の内容で登録します。よろしいですか？</p>

<form action ="bookinsert" method="POST">
<span>　ユーザID：</span>
<input class ="inputform"type="text" name ="isbn" value="<%=book.getIsbn() %>" readonly><br>
<span>　　図書名：</span>
<input class ="inputform"type="text" name ="book_name" value="<%=book.getBookName() %>" readonly><br>
<span>カテゴリ名：</span>
<input class ="inputform"type="text" name ="category_name" value="<%=book.getCategoryName() %>" readonly><br>
<span>　　　冊数：</span>
<input class ="inputform"type="text" name ="book_count" value="<%=book.getBookCount() %>" readonly><br>
<input class ="bookdeleteform"type ="submit" value="図書登録確定">
</form>

<form action ="bookinsertconfirm" method="POST">
<input type="hidden" name ="isbn" value ="<%=book.getIsbn() %>">
<input type="hidden" name ="book_name" value ="<%=book.getBookName() %>">
<input type="hidden" name ="category_name" value ="<%=book.getCategoryName() %>">
<input type="hidden" name ="book_count" value ="<%=book.getBookCount() %>">
<input type="hidden" name ="cancel" value =1>
<input class ="returnbookdeteilform"type="submit" value ="キャンセル">
</form>
</body>
</html>