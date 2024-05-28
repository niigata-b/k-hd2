<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List,model.entity.AdminBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者詳細画面</title>
</head>
<body>
	<h1>管理者管理</h1>
	<h1>管理者詳細画面</h1>

	<%
	AdminBean admindetail = (AdminBean) request.getAttribute("adminDetail");
	%>


	<table border="1">
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


	<form action="adminupdate" method="post">
		<input type="submit" value="変更">
	</form>


	<form action=admindeleteconfirm method="post">
		<input type="hidden" name="admin_id"value="<%=admindetail.getAdmin_id()%>">
		<input type="hidden" name="admin_name"value="<%=admindetail.getAdmin_name()%>">
		<input type="hidden" name="password"value="<%=admindetail.getPassword()%>">
		<input type="submit"value="削除">
	</form>


	<form action="adminlist" method="post">
		<input type="submit" value="管理者一覧画面">
	</form>


</body>
</html>