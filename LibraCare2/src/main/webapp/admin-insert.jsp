<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.entity.AdminBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>管理者管理</h1>
	<h1>管理者登録画面</h1>


	<%
	String messageNull = (String) request.getAttribute("messageNull");
	%>

	<%
	try {
		if (!(messageNull.equals(null))) {
	%>

	<%=messageNull%><br>

	<%
	}

	} catch (NullPointerException e) {

	}
	%>


	<form action="admininsertconfirm" method="post">
		<table border="1">
			<tr>
				<th>管理者ID</th>
				<td><input type="text" name="admin_id" id="admin_id"></td>
			</tr>

			<tr>
				<th>管理者名</th>
				<td><input type="text" name="admin_name" id="admin_name"></td>
			</tr>

			<tr>
				<th>パスワード名</th>
				<td><input type=password name="password" id="password"></td>
			</tr>
		</table>
		<input type="submit" value="登録">
	</form>

	<form action="admin-management-menu.jsp" method="post">
		<input type="submit" value="キャンセル">
	</form>

</body>
</html>