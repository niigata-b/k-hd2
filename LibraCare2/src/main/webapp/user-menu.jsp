<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ管理メニュー画面</title>
<link rel="stylesheet" href="style1.css">
</head>

<body>
<h1>ユーザ管理メニュー画面</h1>

<form action ="userlist" method = "POST">
<input type ="submit" value = "ユーザ一覧">
</form>

<form action ="user-insert.jsp" method = "POST">
<input type ="submit" value = "ユーザ登録">
</form>

<form action ="menu" method = "POST">
<input type ="submit" value = "トップメニューに戻る">
</form>

</body>
</html>