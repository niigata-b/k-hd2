<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ詳細画面</title>
<link rel="stylesheet" href="list.css">
</head>
<body>
<%
	UserBean user = (UserBean)request.getAttribute("user");
%>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>ユーザ詳細　　</h1>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<table>
	<tr>
		<th>ユーザID</th>
		<td><%=user.getUserId() %></td>
	</tr>
	<tr>
		<th>ユーザ名</th>
		<td><%=user.getUserName() %></td>
	</tr>
</table>

<form action ="userupdateform" method="POST">
<input type ="hidden" name ="user_id" value ="<%=user.getUserId() %>">
<input type ="hidden" name ="user_name" value="<%=user.getUserName() %>">
<input class = "updbtn" type ="submit" value = "変更">
</form>

<form action ="userdeleteconfirm" method="POST">
<input type ="hidden" name ="user_id" value ="<%=user.getUserId() %>">
<input type ="hidden" name ="user_name" value="<%=user.getUserName() %>">
<input class = "deletebtn" type ="submit" value = "削除">
</form>

<form action ="userlist" method="POST">
<input class ="returnadminmenu" type ="submit" value = "ユーザ一覧に戻る">
</form>
</body>
</html>