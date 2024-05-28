
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書管理メニュー</title>
<style>
body {
text-align:center;
}
</style>
</head>
<body>
	<h2>図書管理</h2>
	<h1>図書管理メニュー</h1>
	<form action="booklist" method="post">
		<input type="submit" value="図書一覧">
	</form>
	<form action="book-insert.jsp">
		<input type="submit" value="図書登録">
	</form>
	<form action ="menu" method = "POST">
		<input type ="submit" value = "トップメニューに戻る">
	</form>
</body>
</html>