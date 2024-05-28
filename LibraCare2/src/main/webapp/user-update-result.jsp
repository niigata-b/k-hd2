<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ変更確定画面</title>
<style>
body {
text-align:center;
}
</style>
</head>
<body>
<%
	UserBean user = (UserBean)request.getAttribute("user");
%>
<h1>ユーザ変更確定画面</h1>
以下の情報に変更しました<br>
ユーザID：<input type="text" name ="user_id" value="<%=user.getUserId() %>" readonly><br>
ユーザ名：<input type="text" name ="user_name" value="<%=user.getUserName() %>" readonly><br>

<form action ="userdetail" method ="POST">
<input type ="hidden" name ="user_id" value ="<%=user.getUserId() %>">
<input type ="submit" value="ユーザ詳細画面に戻る">
</form>
</body>
</html>