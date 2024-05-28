<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ削除確認画面</title>
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
<h1>ユーザ削除確認画面</h1>
以下の内容を削除します。
よろしいですか？
<form action ="userdelete" method="POST">
ユーザID		：<input type ="label" name ="user_id" value="<%=user.getUserId() %>" readonly><br>
ユーザ名		：<input type ="label" name ="user_name" value="<%=user.getUserName() %>" readonly><br>
<input type ="submit" value ="ユーザ削除確定">
</form>

<form action ="userdetail" method ="POST">
<input type ="hidden" name ="user_id" value="<%=user.getUserId() %>">
<input type ="hidden" name ="user_name" value="<%=user.getUserName() %>">
<input type ="submit" value ="キャンセル">
</form>
</body>
</html>