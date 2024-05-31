<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ登録失敗画面</title>
<link rel="stylesheet" href="insert.css">
</head>
<body>
<%
	UserBean user = (UserBean)request.getAttribute("user");
%>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>ユーザ登録失敗</h1>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<h2>ユーザを登録できませんでした。 </h2>

<form action ="userinsertconfirm" method="POST">
<input type="hidden" name = "user_id" value ="<%=user.getUserId() %>">
<input type="hidden" name = "user_name" value ="<%=user.getUserName() %>">
<input type="hidden" name = "cancel" value =1>
<input class ="bookdeleteform"type="submit" value ="ユーザ登録画面に戻る">
</form>
</body>
</html>