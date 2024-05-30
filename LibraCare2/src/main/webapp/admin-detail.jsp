<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List,model.entity.AdminBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者詳細画面</title>
<link rel="stylesheet" href="list.css">
</head>
<body>
<%
	AdminBean admindetail = (AdminBean) request.getAttribute("adminDetail");
%>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>管理者詳細　　</h1>
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
		<th>管理者ID</th>
		<td><%=admindetail.getAdmin_id()%></td>
	</tr>
	<tr>
		<th>管理者名</th>
		<td><%=admindetail.getAdmin_name()%></td>
	</tr>
	<tr>
		<th>パスワード名</th>
		<td><%=admindetail.getPassword()%></td>
	</tr>
</table>

<form action="adminupdateform" method="post">
<input type="hidden" name="admin_id"value="<%=admindetail.getAdmin_id()%>">
<input type="hidden" name="admin_name"value="<%=admindetail.getAdmin_name()%>">
<input type="hidden" name="password"value="<%=admindetail.getPassword()%>">
<input class = "updbtn" type="submit" value="変更">
</form>

<form action=admindeleteconfirm method="post">
<input type="hidden" name="admin_id"value="<%=admindetail.getAdmin_id()%>">
<input type="hidden" name="admin_name"value="<%=admindetail.getAdmin_name()%>">
<input type="hidden" name="password"value="<%=admindetail.getPassword()%>">
<input class = "deletebtn" type="submit"value="削除">
</form>

<form action="adminlist" method="post">
<input class ="returnadminmenu" type="submit" value="管理者一覧画面に戻る">
</form>
</body>
</html>