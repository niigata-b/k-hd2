<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.AdminBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者変更画面</title>
</head>
<body>
<%
	AdminBean admin = (AdminBean)request.getAttribute("admin");
%>
<h2>管理者変更</h2>
<h1>管理者変更画面</h1>

	<%
	String messageNull = (String) request.getAttribute("messageNull");
	String passwordFail = (String) request.getAttribute("passwordFail");
	%>

	<%
	try {
		if (!(messageNull.equals(null))) {
	%>

	<%=messageNull%><br>

	<%
	}

	} catch (NullPointerException e) {

	}
	%>

	<%
	try {
		if (!(passwordFail.equals(null))) {
	%>

	<%=passwordFail%><br>

	<%
	}

	} catch (NullPointerException e) {

	}
	%>



<form action ="adminupdateconfirm" method="POST">
管理者ID：<input type="text" name ="admin_id" value="<%=admin.getAdmin_id() %>" readonly><br>
管理者名：<input type="text" name ="admin_name" value="<%=admin.getAdmin_name() %>" ><br>
パスワード：<input type="text" name ="password" value="<%=admin.getPassword() %>" ><br>
<input type ="submit" value="変更">
</form>

<form action ="admindetail" method="POST">
<input type="hidden" name ="admin_id" value ="<%=admin.getAdmin_id() %>">
<input type="hidden" name ="admin_name" value ="<%=admin.getAdmin_name() %>">
<input type="hidden" name ="password" value ="<%=admin.getPassword() %>">
<input type="submit" value ="キャンセル">
</form>
</body>
</html>