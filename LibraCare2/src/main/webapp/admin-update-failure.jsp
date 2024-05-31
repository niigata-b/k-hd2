<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"import = "entity.AdminBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者変更失敗画面</title>
<link rel="stylesheet" href="insert.css">
</head>
<body>

<%
	AdminBean admin = (AdminBean)request.getAttribute("admin");
%>

<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>管理者登録失敗　　</h1>
</div>
<br>
<br>
<br>
<h2>管理者の登録に失敗しました。</h2>
<form action = "admindetail" method = "post">
	<input type="hidden" name ="admin_id" value ="<%=admin.getAdmin_id() %>">
	<input type="hidden" name ="admin_name" value ="<%=admin.getAdmin_name() %>">
	<input type="hidden" name ="password" value ="<%=admin.getPassword() %>">
	<input class ="bookdeleteform" type = "submit" value = "管理者詳細画面に戻る">
</form>
</body>
</html>