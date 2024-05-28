<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書情報登録画面あ</title>
</head>
<body>
<%
	BookBean book = (BookBean)request.getAttribute("book");
%>
<h1>図書管理</h1>
<h1>図書情報登録完了画面</h1>
以下の内容を登録しました。<br>

ISBN：<%=book.getIsbn() %><br>
図書名：<%=book.getBookName() %><br>
カテゴリ名：<%=book.getCategoryName() %><br>
個数：<%=book.getBookCount() %><br>

<form action ="book-menu.jsp" method="POST">
<input type ="submit" value="貸出情報一覧画面に戻る">
</body>
</html>