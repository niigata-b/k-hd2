<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン画面</title>
<link rel="stylesheet" href="style1.css">
<h2>LibraCare</h2>
</head>
<body>
<hr>
	<%
	String loginFailureMessage = (String) request.getAttribute("loginFailureMessage");
	%>


	<form action="login" method="post" onsubmit="OnButtonClick()">
		<h1>ログイン画面</h1>

		<%
		try {
			if (!(loginFailureMessage.equals(null))) {
		%>

		<h1><%=loginFailureMessage%></h1>
		<br>

		<%
		}

		} catch (NullPointerException e) {

		}
		%>


		<table border="1">
			<tr>
				<th>管理者ID</th>
				<td><input class ="inputform" type="text" name="admin_id" id="admin_id"></td>
			</tr>

			<tr>
				<th>パスワードID</th>
				<td><input class ="inputform" type="password" name="password" id="password"></td>
			</tr>


		</table>
		<input type="submit" value="ログイン" >
	</form>


	<script>
		function OnButtonClick() {
			var password = document.getElementById('password').value; // HTML要素オブジェクトを取得
			var adminId = document.getElementById('admin_id').value;

			if (password.length <= 7 || password == NULL || adminId == 0) {
				alert('入力情報に不備があります');
				
			}
		}
	</script>


</body>
</html>