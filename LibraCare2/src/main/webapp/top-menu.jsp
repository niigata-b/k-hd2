<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>トップメニュー画面</h1>
	<form action="admin-menu.jsp" method="post">
		<input type="submit" value="管理者管理メニュー">
	</form>

	<form action="user-menu.jsp" method="post">
		<input type="submit" value="ユーザ管理メニュー">
	</form>

	<form action="book-menu.jsp" method="post">
		<input type="submit" value="図書管理メニュー">
	</form>

	<form action="lending-return-menu.jsp" method="post">
		<input type="submit" value="貸出・返却管理メニュー">
	</form>

	<form action="logout" method="post">
		<input type="submit" value="ログアウト">
	</form>

</body>
</html>