<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>図書管理メニュー</h2>
	<form action="booklist" method="post">
		<input type="submit" value="図書一覧">
	</form>
	<form action="book-insert.jsp">
		<input type="submit" value="図書登録">
	</form>
	<form action="top-menu.jsp">
		<input type="submit" value="トップメニューに戻る">
	</form>
</body>
</html>