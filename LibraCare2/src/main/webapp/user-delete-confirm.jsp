<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ削除確認画面</title>
<link rel="stylesheet" href="insert.css">
</head>
<body>
<%
	UserBean user = (UserBean)request.getAttribute("user");
%>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>ユーザ削除　　　　　</h1>
</div>
<br>
<p class="midasi">以下のユーザを削除します。よろしいですか？</p>
<br>
<form action ="userdelete" method="POST">
<span>ユーザID：</span>
<input class ="inputform" type ="label" name ="user_id" value="<%=user.getUserId() %>" readonly><br>
<span>ユーザ名：</span>
<input class ="inputform" type ="label" name ="user_name" value="<%=user.getUserName() %>" readonly><br>
<input class ="bookdeleteform"type ="submit" value ="ユーザ削除確定">
</form>

<form action ="userdetail" method ="POST">
<input type ="hidden" name ="user_id" value="<%=user.getUserId() %>">
<input type ="hidden" name ="user_name" value="<%=user.getUserName() %>">
<input class ="returnbookdeteilform"type ="submit" value ="キャンセル">
</form>
</body>
</html>