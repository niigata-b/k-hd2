<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.entity.AdminBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者登録画面</title>
<link rel="stylesheet" href="insert.css">
</head>
<body>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>管理者登録　　　　</h1>
</div>
<br>

<form action="admininsertconfirm" method="post">
<p class="midasi">登録したい管理者の情報を入力しください。</p>
<%
		AdminBean admin = (AdminBean)request.getAttribute("admin");
		String admin_id = "";
		String admin_name = "";
		String password = "";
		
		try
		{
			admin_id = admin.getAdmin_id();
		}
		catch(NullPointerException e)
		{
			admin_id = "";
		}
		try
		{
			admin_name = admin.getAdmin_name();
		}
		catch(NullPointerException e)
		{
			admin_name = "";
		}
		try
		{
			password = admin.getPassword();
		}
		catch(NullPointerException e)
		{
			password = "";
		}
		
	%>



<%
String messageNull = (String) request.getAttribute("messageNull");
%>

<%
try {
	if (!(messageNull.equals(null))) {
%>
<p class="error"><%=messageNull%>　　　　　</p>
<%
	}
} catch (NullPointerException e) {
}
%>
<span>管理者ID：</span>
<input class="inputform" type="text" name="admin_id" id="admin_id" onchange="adminIdJudge()"  value=<%=admin_id%>><br>
<span>管理者名：</span>
<input class="inputform" type="text" name="admin_name" id="admin_name"  value=<%=admin_name%>><br>
<span>パスワード名：</span>
<input class ="inputform" type=password name="password" id="password"  value=<%=password%>><br>
<input class ="insertform" type="submit" value="管理者登録">
</form>

<form action="admin-management-menu.jsp" method="post">
<input class ="returnmenuform" type="submit" value="キャンセル">
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