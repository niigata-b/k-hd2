<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LibraCare</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>
<!-- aa -->
	<h1>LibraCare</h1>
	<form id = "logout2" action="logout" method="post">
		<input type="submit" value="ログアウト" id ="logout">
	</form>
	
	<form action="admin-management-menu.jsp" method="post">
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

	

</body>
</html>