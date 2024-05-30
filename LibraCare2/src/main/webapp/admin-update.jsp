<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.AdminBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者変更画面</title>
<link rel="stylesheet" href="insert.css">
</head>
<body>
<%
	AdminBean admin = (AdminBean)request.getAttribute("admin");
	String messageNull = (String) request.getAttribute("messageNull");
	String passwordFail = (String) request.getAttribute("passwordFail");
%>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>管理者変更　　　　</h1>
</div>
<br>
<p class="midasi">管理者名とパスワードを入力してください。</p>
<br>
	
<form action ="adminupdateconfirm" method="POST">
<span>管理者ID：</span>
<input class ="inputform" type="text" name ="admin_id" value="<%=admin.getAdmin_id() %>" readonly><br>
<%
	try {
		if (!(messageNull.equals(null))) {
	%>
	<p class="error"><%=messageNull%></p>
	<%
	}
	} catch (NullPointerException e) {
	}
	%>
<span>管理者名：</span>
<input class ="inputform" type="text" name ="admin_name" value="<%=admin.getAdmin_name() %>" ><br>
<%
	try {
		if (!(passwordFail.equals(null))) {
	%>
	<p class="error"><%=passwordFail%></p>
	<%
	}
	} catch (NullPointerException e) {
	}
%>
<span>パスワード：</span>
<input class ="inputform" type="password" name ="password" value="<%=admin.getPassword() %>" ><br>
<input class ="bookinsertform" type ="submit" value="変更">
</form>

<form action ="admindetail" method="POST">
<input type="hidden" name ="admin_id" value ="<%=admin.getAdmin_id() %>">
<input type="hidden" name ="admin_name" value ="<%=admin.getAdmin_name() %>">
<input type="hidden" name ="password" value ="<%=admin.getPassword() %>">
<input class ="returnbookmenuform" type="submit" value ="キャンセル">
</form>
</body>
</html>