<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ変更失敗画面</title>
<link rel="stylesheet" href="insert.css">
</head>
<body>
<%
	UserBean user = (UserBean)request.getAttribute("user");
%>

<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>ユーザ変更失敗</h1>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<h2>ユーザを変更できませんでした。 </h2>

<form action ="userupdateform" method="POST">
<input type="hidden" name = "user_id" value ="<%=user.getUserId() %>">
<input type="hidden" name = "user_name" value ="<%=user.getUserName() %>">
<input class ="bookdeleteform"type="submit" value ="ユーザ変更画面に戻る">
</form>
</body>
</html>