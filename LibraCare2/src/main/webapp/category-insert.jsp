<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>カテゴリ登録画面</title>
<link rel="stylesheet" href="insert.css">
</head>
<body>
	<%
	String messageNull = (String)request.getAttribute("messageNull"); 
	BookBean book = (BookBean)request.getAttribute("book");
	String category_name = "";
	try {
		category_name = book.getCategoryName();
	} catch(Exception e) {
	}
	%>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>カテゴリ登録　　　　</h1>
</div>
<br>
<p class="midasi">登録したいカテゴリ名を入力しください。</p>
<br>

<form action="categoryinsertconfirm" method="post">
<%
	try {
	if(!(messageNull.equals(null))) {
%>
<p class="error"><%=messageNull %>　　　　</p>
<%
}
}catch(NullPointerException e){
}
%>
<br>
<br>
<span>カテゴリ名：</span>
	<input class ="inputform" type="text" name="category_name" value="<%=category_name%>"> 
	<input class ="insertform" type="submit"value="カテゴリー名登録">
	</form>
	<form action="book-menu.jsp" method="post">
	<input class ="returnmenuform" type="submit" value="キャンセル">
	</form>
</body>
</html>