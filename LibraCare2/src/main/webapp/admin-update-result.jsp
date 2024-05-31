<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.AdminBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者変更確定画面</title>
<link rel="stylesheet" href="insert.css">
</head>
<body>
<%
	AdminBean admin = (AdminBean)request.getAttribute("admin");
%>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>管理者変更確定　　</h1>
</div>
<br>
<p class="midasi">以下の内容に変更しました。</p>

<span>管理者ID：</span>
<input class ="inputform"type="text" name ="admin_id" value="<%=admin.getAdmin_id() %>" readonly><br>
<span>管理者名：</span>
<input class ="inputform"type="text" name ="admin_name" value="<%=admin.getAdmin_name() %>" readonly><br>
<span>パスワード：</span>
<input class ="inputform"type="text" name ="password" value="<%=admin.getPassword() %>" readonly><br>

<form action = "admindetail" method = "post">
<input type="hidden" name ="admin_id" value ="<%=admin.getAdmin_id() %>">
<input type="hidden" name ="admin_name" value ="<%=admin.getAdmin_name() %>">
<input type="hidden" name ="password" value ="<%=admin.getPassword() %>">
<input class ="bookdeleteform"type = "submit" value = "管理者詳細画面に戻る">
</form>

</body>
</html>