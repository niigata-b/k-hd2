<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.entity.AdminBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者登録画面</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>
	<h2>管理者管理</h2>
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
				<td><input class="inputform" type="text" name="admin_id"
					id="admin_id" onchange="adminIdJudge()"></td>
			</tr>

			<tr>
				<th>管理者名</th>
				<td><input class="inputform" type="text" name="admin_name"
					id="admin_name"></td>
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

	<script>
		function adminIdJudge() {
			var adminIdJudge = document.getElementById('admin_id').value; // HTML要素オブジェクトを取得

			if (adminIdJudge.match(/^[A-Za-z0-9]+$/)
					|| (adminIdJudge.indexOf('-') != -1)) {
				return true;
				
			} else {
				alert('管理者IDは半角英数字で入力してください');
				document.getElementById('admin_id').value = '';		
			}
		}
	</script>

</body>
</html>