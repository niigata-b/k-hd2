<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ登録確定画面</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>
<%
	UserBean user = (UserBean)request.getAttribute("user");
%>
<h1>ユーザ登録確定画面</h1>
以下の情報で登録しました。<br>
ユーザID：<input type="text" name ="user_id" value="<%=user.getUserId() %>" readonly><br>
ユーザ名：<input type="text" name ="user_name" value="<%=user.getUserName() %>" readonly><br>

<form action="user-menu.jsp" method="POST">
<input type="submit" value ="ユーザ管理メニューに戻る">
</form>

</body>
</html>