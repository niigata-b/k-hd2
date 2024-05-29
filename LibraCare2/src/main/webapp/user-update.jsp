<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ変更画面</title>
<link rel="stylesheet" href="style1.css">

</head>
<body>
<% 
	UserBean user = (UserBean) request.getAttribute("user");

	String messageNull = (String)request.getAttribute("messageNull");
	
%> 

<h1>ユーザ変更画面</h1>

<%
try{
if(!(messageNull.equals(null))) {
%>

<%=messageNull %><br>

<% 
}
}catch(NullPointerException e)
{
	
}
%>

<form action ="userupdateconfirm" method ="POST">
<input type="text" name ="user_id" value="<%=user.getUserId() %>"readonly>
<input type="text" name ="user_name" value="<%=user.getUserName() %>">
<input type="submit" value="変更">
</form>

<form action ="userdetail" method ="POST">
<input type="hidden" name ="user_id" value="<%=user.getUserId() %>">
<input type="submit" value ="キャンセル">
</form>

</body>
</html>