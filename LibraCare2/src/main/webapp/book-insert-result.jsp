<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書情報登録画面</title>
<link rel="stylesheet" href="insert.css">
</head>
<body>
<%
	BookBean book = (BookBean)request.getAttribute("book");
%>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>図書登録確定　　</h1>
</div>
<br>
<p class="midasi">以下の内容で登録しました。</p>

<span>　　　ISBN：</span>
<input class ="inputform" type="text" name="isbn" value ="<%=book.getIsbn() %>" readonly><br>
<span>　　図書名：</span>
<input class ="inputform"type="text" name ="admin_name" value="<%=book.getBookName() %>" readonly><br>
<span>カテゴリ名：</span>
<input class ="inputform"type="text" name ="admin_name" value="<%=book.getCategoryName() %>" readonly><br>
<span>　　　冊数：</span>
<input class ="inputform"type="text" name ="admin_name" value="<%=book.getBookCount() %>" readonly><br>

<form action ="book-menu.jsp" method="POST">
<input class ="bookdeleteform"type ="submit" value="貸出情報一覧画面に戻る">
</body>
</html>