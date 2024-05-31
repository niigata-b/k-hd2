<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書情報登録失敗画面</title>
<link rel="stylesheet" href="insert.css">
</head>
<body>
<%
	BookBean book = (BookBean)request.getAttribute("book");
%>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>図書登録失敗</h1>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
	<h2>図書を登録できませんでした。 </h2>
<form action = "bookinsertcategorylist" method="POST">
<input class ="bookdeleteform"type="submit" value ="図書登録画面に戻る">
</form>
</body>
</html>