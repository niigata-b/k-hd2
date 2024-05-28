<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>削除確定画面</title>
</head>
<body>
<style>
body{
text-align: center;
}
</style>
</head>
<body>
<%
	BookBean book = (BookBean)request.getAttribute("book");
%>
<h1>図書管理</h1>
<h1>削除確定画面</h1>
以下の図書を削除しました。<br>
ISBN：<%=book.getIsbn() %><br>
図書名：<%=book.getBookName() %><br>
カテゴリ名：<%=book.getCategoryName() %><br>
個数：<%=book.getBookCount() %><br>

<form action ="bookdetail" method="POST">
<input type ="submit" value="図書登録画面に戻る">
</form>
</body>
</html>