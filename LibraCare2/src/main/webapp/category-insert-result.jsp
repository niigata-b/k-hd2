<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>カテゴリ登録確定画面</title>
<link rel="stylesheet" href="insert.css">
</head>
<body> 
<%
	BookBean book = (BookBean)request.getAttribute("book");
%>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>カテゴリ登録確定　　</h1>
</div>
<br>
<br>

<p class="midasi">以下の内容を登録しました。</p>
<span>　カテゴリ名：</span>
<input class ="inputform"type="text" name ="category_name" value="<%=book.getCategoryName() %> " readonly><br>
<form action="book-menu.jsp" method="post"> 
	<input class ="bookdeleteform" type="submit" value="図書メニューに戻る">
</form>
</body>
</html>