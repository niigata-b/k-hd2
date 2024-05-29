<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"import = "entity.AdminBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者変更失敗画面</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>

<%
	AdminBean admin = (AdminBean)request.getAttribute("admin");
%>

	<h2>管理者変更</h2>
	<h1>管理者変更失敗画面</h1>
	<p style="color: red;">管理者変更できませんでした</p>


<form action = "admindetail" method = "post">
	<input type="hidden" name ="admin_id" value ="<%=admin.getAdmin_id() %>">
	<input type="hidden" name ="admin_name" value ="<%=admin.getAdmin_name() %>">
	<input type="hidden" name ="password" value ="<%=admin.getPassword() %>">
	<input type = "submit" value = "管理者詳細画面に戻る">
</form>
</body>
</html>