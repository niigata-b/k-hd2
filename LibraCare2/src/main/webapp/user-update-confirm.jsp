<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ変更確認画面</title>
<style>
body{
text-align: center;
}
</style>
</head>
<body>
<%
	UserBean user = (UserBean)request.getAttribute("user");
%>
<h1>ユーザ変更確認画面</h1>
以下の情報に変更します<br>
よろしいですか？

<form action ="userupdate" method="POST">
ユーザID：<input type="text" name ="user_id" value="<%=user.getUserId() %>" readonly><br>
ユーザ名：<input type="text" name ="user_name" value="<%=user.getUserName() %>" readonly><br>
<input type ="submit" value="変更確定">
</form>

<form action ="userupdateconfirm" method="POST">
<input type="hidden" name ="user_id" value ="<%=user.getUserId() %>">
<input type="hidden" name ="user_name" value ="<%=user.getUserName() %>">
<input type="hidden" name ="cancel" value =1>
<input type="submit" value ="キャンセル">
</form>
</body>
</html>