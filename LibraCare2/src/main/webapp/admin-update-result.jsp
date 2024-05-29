<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.AdminBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者変更確定画面</title>
</head>
<body>
<%
	AdminBean admin = (AdminBean)request.getAttribute("admin");
%>
<h2>管理者変更</h2>
<h1>管理者変更確定画面</h1>
以下の内容を変更しました。<br>

管理者ID：<input type="text" name ="admin_id" value="<%=admin.getAdmin_id() %>" readonly><br>
管理者名：<input type="text" name ="admin_name" value="<%=admin.getAdmin_name() %>" readonly><br>
パスワード：<input type="text" name ="password" value="<%=admin.getPassword() %>" readonly><br>

<form action = "admindetail" method = "post">
<input type="hidden" name ="admin_id" value ="<%=admin.getAdmin_id() %>">
<input type="hidden" name ="admin_name" value ="<%=admin.getAdmin_name() %>">
<input type="hidden" name ="password" value ="<%=admin.getPassword() %>">
<input type = "submit" value = "管理者詳細画面に戻る">
</form>

</body>
</html>