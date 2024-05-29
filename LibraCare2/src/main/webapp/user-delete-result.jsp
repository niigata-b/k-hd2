<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ削除確定画面</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>
<%
	UserBean user = (UserBean)request.getAttribute("user");
%>
<h1>ユーザ削除確定画面</h1>
以下の内容を削除しました <br>
ユーザID：<%=user.getUserId() %><br>
ユーザ名：<%=user.getUserName() %><br>

<form action ="userlist" method="POST">
<input type ="submit" value ="ユーザ一覧画面に戻る">
</form>
</body>
</html>