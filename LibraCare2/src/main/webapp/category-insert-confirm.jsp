<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>カテゴリー登録確認画面</title>
<link rel="stylesheet" href="insert.css">
</head>
<body>
	<% 
	BookBean book = (BookBean) request.getAttribute("book");  
	%>  
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>カテゴリ登録確認　</h1>
</div>
<br>
<p class="midasi">以下の内容で登録します。よろしいですか？</p>
<br>
<br>
	<form action="categoryinsert" method="post">
	<span>カテゴリー名:</span>
	<input class ="inputform"type="text" name ="category_name" value="<%=book.getCategoryName() %>" readonly><br> 
	<input class ="bookdeleteform"type="submit" value="登録確定">
	</form> 
	
	<form action="categoryinsertconfirm" method="post"> 
	<input type="hidden" name ="category_name" value="<%=book.getCategoryName() %>">
	<input type="hidden" name ="cancel" value=1>
	<input class ="returnbookdeteilform"type="submit" value="キャンセル">
	</form> 
	
</body>
</html>