<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LibraCare</title>
<link rel="stylesheet" href="style1.css">
<h1>LibraCare</h1>
</head>
<body>
<div>
<hr>
	<form id = "logout2" action="logout" method="post">
		<input id = "logout3" type="submit" value="ログアウト" id ="logout">
	</form>
	<br>
	
	<form action="book-menu.jsp" method="post">
		<input class ="btn" type="submit" value="図書管理">
	</form>

	<form action="lending-return-menu.jsp" method="post">
		<input class ="btn" type="submit" value="貸出・返却管理">
	</form>
	
	<br>
	
	<form action="user-menu.jsp" method="post">
		<input class ="btn" type="submit" value="ユーザ管理">
	</form>
	
	<form action="admin-management-menu.jsp" method="post">
		<input class ="btn" type="submit" value="管理者管理">
	</form>
</div>
</body>
</html>