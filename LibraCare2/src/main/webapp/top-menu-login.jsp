<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン画面</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>
<div>
<h2>LibraCare</h2>
<br>
<h1>ログイン</h1>
</div>
<hr>
<br>
<br>
	<%
	String loginFailureMessage = (String) request.getAttribute("loginFailureMessage");
	%>
	
	<%
		try {
			if (!(loginFailureMessage.equals(null))) {
		%>

		<p id ="error"><%=loginFailureMessage%></p>
		<%
		}

		} catch (NullPointerException e) {

		}
	%>
	
	<form action="login" method="post" onsubmit="OnButtonClick()">
		<p class ="loginlabel">　管理者ID：</p>
		<input class ="inputform" type="text" name="admin_id" id="admin_id"><br>

		<p class ="loginlabel">パスワード：</p>
		<input class ="inputform" type="password" name="password" id="password"><br>
			
		<input id = "loginbtn" type="submit" value="ログイン" >
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