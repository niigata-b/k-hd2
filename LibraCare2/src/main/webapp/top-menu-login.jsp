<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン画面</title>
<link rel="stylesheet" href="insert.css">
</head>
<body>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>ログイン　　　　　</h1>
</div>
<br>
<br>
<%
String loginFailureMessage = (String) request.getAttribute("loginFailureMessage");
%>
<%
try {
	if (!(loginFailureMessage.equals(null))) {
%>
<p class ="error"><%=loginFailureMessage%>　　　　　　</p>
<%
	}
} catch (NullPointerException e) {
}
%>
<form action="login" method="post" onsubmit="OnButtonClick()">
<span>管理者ID：</span>
<input class ="inputform" type="text" name="admin_id" id="admin_id"><br>
<span>パスワード：</span>
<input class ="inputform" type="password" name="password" id="password"><br>
<input class = "insertformlogin" type="submit" value="ログイン" >
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