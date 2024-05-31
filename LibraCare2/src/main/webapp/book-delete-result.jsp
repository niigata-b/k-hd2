<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>削除確定画面</title>
<link rel="stylesheet" href="insert.css">
</head>
<body>
<%
	BookBean book = (BookBean)request.getAttribute("book");
%>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>図書削除確定　　</h1>
</div>
<br>
<p class="midasi">以下の内容を削除しました。</p>

<span>　　　ISBN：</span>
<input class ="inputform"type="text" name ="isbn" value="<%=book.getIsbn() %>" readonly><br>
<span>　　図書名：</span>
<input class ="inputform"type="text" name ="isbn" value="<%=book.getBookName() %>" readonly><br>
<span>カテゴリ名：</span>
<input class ="inputform"type="text" name ="isbn" value="<%=book.getCategoryName() %>" readonly><br>
<span>　　　冊数：</span>
<input class ="inputform"type="text" name ="isbn" value="<%=book.getBookCount() %>" readonly><br>

<form action ="booklist" method="POST">
<input class ="bookdeleteform" type ="submit" value="図書一覧画面に戻る">
</form>

</body>
</html>