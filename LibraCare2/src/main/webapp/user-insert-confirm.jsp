<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ登録確認画面</title>
<link rel="stylesheet" href="insert.css">
</head>
<body>
<%
	UserBean user = (UserBean)request.getAttribute("user");
%>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>ユーザ登録確認　　</h1>
</div>
<br>
<p class="midasi">以下の内容で登録します。よろしいですか？</p>

<form action ="userinsert" method="POST">
<span>ユーザID</span>
<input class ="inputform"type="text" name ="user_id" value="<%=user.getUserId() %>" readonly><br>
<span>ユーザ名</span>
<input class ="inputform"type="text" name ="user_name" value="<%=user.getUserName() %>" readonly><br>
<input class ="bookdeleteform"type ="submit" value="ユーザ登録確定">
</form>

<form action ="userinsertconfirm" method="POST">
<input type="hidden" name ="user_id" value ="<%=user.getUserId() %>">
<input type="hidden" name ="user_name" value ="<%=user.getUserName() %>">
<input type="hidden" name ="cancel" value =1>
<input class ="returnbookdeteilform"type="submit" value ="キャンセル">
</form>
</body>
</html>