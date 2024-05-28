<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List,model.entity.AdminBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者一覧画面</title>
<style>
body {
text-align : center;
}
div {
overflow-y: scroll;
}

table {
margin-left: 650px;
margin-bottom: 10px;
}
</style>
</head>
<body>
	<h1>管理者管理</h1>
	<h1>管理者一覧画面</h1>

	<%
	List<AdminBean> adminList = (List<AdminBean>) request.getAttribute("adminList");
	%>
	<div>
	<table border="1">
		<tr>
			<th>管理者ID</th>
			<th>管理者名</th>
			<th></th>
		</tr>

		<%
		for (AdminBean admin : adminList) {
		%>
		<tr>
			<td><%=admin.getAdmin_id()%></td>
			<td><%=admin.getAdmin_name()%></td>
			
			<td>
				<form action="admindetail" method="post">
					<input type="hidden" name="admin_id"value="<%=admin.getAdmin_id()%>">
					<input type="submit" value="詳細">
				</form>
			</td>
		</tr>
		<%
		}
		%>

	</table>
	</div>
	<form action="admin-management-menu.jsp" method="post">
		<input type="submit" value="管理者管理メニューに戻る">
	</form>
</body>
</html>