<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ登録画面</title>
<link rel="stylesheet" href="insert.css">
</head>
<body>
<%
UserBean user = (UserBean)request.getAttribute("user");
String messageNull = (String)request.getAttribute("messageNull");
String user_id = "";
String user_name = "";
try {
	user_id = user.getUserId();
} catch(NullPointerException e) {
	user_id = "";
} try {
	user_name = user.getUserName();
} catch(NullPointerException e) {
	user_name = "";
}
%>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>ユーザ登録　　　　</h1>
</div>
<br>

<form action="userinsertconfirm" method="POST">
<%
try {
if(!(messageNull.equals(null))) {
%>
<p class="error"><%=messageNull %>　　　　　</p>
<%
}
} catch(NullPointerException e) {	
}
%>
<span>ユーザID：</span>
<input class ="inputform" id = "user_id" type="text" name="user_id" onchange="userIdJudge()" value=<%=user_id %>><br>
<span>ユーザ名：</span>
<input class ="inputform" type="text" name="user_name" value=<%=user_name %>><br>
<input class ="insertform" type="submit" value="登録"> 
</form>

<form action="user-menu.jsp" method="POST">
<input class ="returnmenuform" type="submit" value="キャンセル">
</form>
	
<script>
function userIdJudge() {
	var userIdJudge = document.getElementById('user_id').value; 
	// HTML要素オブジェクトを取得

	if (userIdJudge.match(/^[A-Za-z0-9]+$/)
			|| (userIdJudge.indexOf('-') != -1)) {
		return true;
				
	} else {
		alert("ユーザIDは半角英数字で入力してください");
		document.getElementById('user_id').value = '';		
	}
}
</script>
</body>
</html>