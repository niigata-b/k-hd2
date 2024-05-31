<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>カテゴリ削除確認画面</title>
<link rel="stylesheet" href="insert.css">
</head>
<body>
	<% 
	BookBean book = (BookBean) request.getAttribute("book");  
	%>  
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>カテゴリ削除確認　</h1>
</div>
<br>
<br>
<p class="midasi">以下の内容を削除します。よろしいですか？</p>
	<form action="categorydelete" method="post">
	<span>カテゴリー名:</span>
	<input class ="inputform" type="text" name ="category_name" value="<%=book.getCategoryName() %>" readonly><br> 
	<input class ="bookdeleteform" type="submit" value="削除確定">
	</form> 
	
	<form action="categorydeleteconfirm" method="post">
	<input type ="hidden" name ="cancel" value =1>
	<input class ="returnbookdeteilform" type="submit" value="キャンセル">
	</form> 
</body>
</html>