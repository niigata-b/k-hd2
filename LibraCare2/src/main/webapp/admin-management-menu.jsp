<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者管理メニュー</title>
<link rel="stylesheet" href="topmenu.css">
</head>
<body>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>管理者管理メニュー</h1>
</div>
<br>

<form action="adminlist" method="post">
<input class ="btn" type="submit" value="管理者一覧">
</form>

<form action="admin-insert.jsp" method="post">
<input class ="btn" type="submit" value="管理者登録">
</form>
<br>
<form action ="menu" method = "POST">
<input class ="btn" type ="submit" value = "トップメニューに戻る">
</form>

</body>
</html>