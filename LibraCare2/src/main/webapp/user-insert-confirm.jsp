<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ登録確認画面</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>
<%
	UserBean user = (UserBean)request.getAttribute("user");
%>
<h1>ユーザ登録確認画面</h1>
以下の内容で登録します。<br>
よろしいですか？

<form action ="userinsert" method="POST">
ユーザID<input type="text" name ="user_id" value="<%=user.getUserId() %>" readonly><br>
ユーザ名<input type="text" name ="user_name" value="<%=user.getUserName() %>" readonly><br>
<input type ="submit" value="ユーザ登録確定">
</form>

<form action ="userinsertconfirm" method="POST">
<input type="hidden" name ="user_id" value ="<%=user.getUserId() %>">
<input type="hidden" name ="user_name" value ="<%=user.getUserName() %>">
<input type="hidden" name ="cancel" value =1>
<input type="submit" value ="キャンセル">
</form>
</body>
</html>