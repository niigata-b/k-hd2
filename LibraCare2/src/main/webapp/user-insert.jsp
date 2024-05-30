<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ登録画面</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>

<%
UserBean user = (UserBean)request.getAttribute("user");
String messageNull = (String)request.getAttribute("messageNull");
String user_id = "";
String user_name = "";

try
{
	user_id = user.getUserId();
}
catch(NullPointerException e)
{
	user_id = "";
}
try
{
	user_name = user.getUserName();
}
catch(NullPointerException e)
{
	user_name = "";
}

%>



	<h1>ユーザ登録画面</h1>
	<form action="userinsertconfirm" method="POST">
	<%
try {
if(!(messageNull.equals(null))) {
%>

<%=messageNull %><br>

<%
}

}catch(NullPointerException e)
{
	
}
%>
		ユーザID<input class ="inputform" type="text" name="user_id" value=<%=user_id %> onchange="userIdJudge()"><br>
		ユーザ名<input class ="inputform" type="text" name="user_name" value=<%=user_name %>><br>
		<input type="submit" value="登録"> 
	</form>
	
	<form action="user-menu.jsp" method="POST">
	<input type="submit" value="ユーザ管理メニューに戻る">
	</form>
	
		<script>
		function userIdJudge() {
			var userIdJudge = document.getElementById('user_id').value; // HTML要素オブジェクトを取得

			if (userIdJudge.match(/^[A-Za-z0-9]+$/)
					|| (userIdJudge.indexOf('-') != -1)) {
				return true;
				
			} else {
				alert('ユーザIDは半角英数字で入力してください');
				document.getElementById('user_id').value = '';		
			}
		}
	</script>
	
	
</body>
</html>