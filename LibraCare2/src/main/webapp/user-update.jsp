<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ変更画面</title>
<link rel="stylesheet" href="insert.css">
</head>
<body>
<% 
	UserBean user = (UserBean) request.getAttribute("user");
	String messageNull = (String)request.getAttribute("messageNull");
%> 
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>ユーザ名変更　　　</h1>
</div>
<br>
<br>
<p class="midasi">ユーザ名を入力してください。</p>
<br>
<form action ="userupdateconfirm" method ="POST">
<span>ユーザID：</span>
<input class ="inputform" type="text" name ="user_id" value="<%=user.getUserId() %>"readonly>
<br>
<%
try{
if(!(messageNull.equals(null))) {
%>
<p class="error"><%=messageNull %></p>
<% 
}
}catch(NullPointerException e){
}
%>
<span>ユーザ名：</span>
<input class ="inputform" type="text" name ="user_name" value="<%=user.getUserName() %>">
<input class ="bookinsertform" type="submit" value="変更">
</form>

<form action ="userdetail" method ="POST">
<input type="hidden" name ="user_id" value="<%=user.getUserId() %>">
<input class ="returnbookmenuform" type="submit" value ="キャンセル">
</form>

</body>
</html>