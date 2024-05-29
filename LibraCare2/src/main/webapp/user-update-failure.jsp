<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ変更失敗画面</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>
<%
	UserBean user = (UserBean)request.getAttribute("user");
%>

<h1>ユーザ変更失敗画面</h1>
<h2>変更できませんでした</h2><br>

<form action ="userupdateform" method="POST">
<input type="hidden" name = "user_id" value ="<%=user.getUserId() %>">
<input type="hidden" name = "user_name" value ="<%=user.getUserName() %>">
<input type="submit" value ="ユーザ変更画面に戻る">
</form>
</body>
</html>