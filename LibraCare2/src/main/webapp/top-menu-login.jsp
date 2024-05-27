<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="login" method="post">
		<h1>ログイン画面</h1>
		<table border="1">
			<tr>
				<th>管理者ID</th>
				<td><input type="text" name="admin_id"></td>
			</tr>
			
			<tr>
				<th>パスワードID</th>
				<td><input type="password" name="password"></td>
			</tr>
			 
			 
		</table>
		<input type="submit" value="ログイン">
	</form>
</body>
</html>