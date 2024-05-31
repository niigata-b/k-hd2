<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.LendingBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>貸出登録失敗画面</title>
<link rel="stylesheet" href="insert.css">
</head>
<body>
<%
	LendingBean lending = (LendingBean)request.getAttribute("lending");
%>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>貸出登録失敗</h1>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<h2>貸出登録に失敗しました。 </h2>

<form action = "loanconfirm" method="POST">
<input type="hidden" name ="user_id" value ="<%=lending.getUserId() %>">
<input type="hidden" name ="isbn" value ="<%=lending.getIsbn() %>">
<input type="hidden" name ="lending_count" value ="<%=lending.getLendingCount() %>">
<input type="hidden" name ="cancel" value =1>
<input class ="bookdeleteform"type="submit" value ="貸出登録画面に戻る">
</form>
</body>
</html>