<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ管理メニュー画面</title>
<link rel="stylesheet" href="topmenu.css">
</head>
<body>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>ユーザ管理メニュー</h1>
</div>
<br>

<form action ="userlist" method = "POST">
<input class ="btn" type ="submit" value = "ユーザ一覧">
</form>

<form action ="user-insert.jsp" method = "POST">
<input class ="btn" type ="submit" value = "ユーザ登録">
</form>
<br>
<form action ="menu" method = "POST">
<input class ="btn" type ="submit" value = "トップメニューに戻る">
</form>

</body>
</html>