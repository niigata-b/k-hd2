<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.LendingBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>貸出登録確認画面</title>
<link rel="stylesheet" href="insert.css">
</head>
<body>
<%
	LendingBean lending = (LendingBean)request.getAttribute("lending");
%>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>貸出登録確認　　　</h1>
</div>
<br>
<p class="midasi">以下の内容で登録します。よろしいですか？</p>

<form action ="loan" method="POST">
<span>ユーザID：</span>
<input class ="inputform"type="text" name ="user_id" value="<%=lending.getUserId() %>" readonly><br>
<span>　　ISBN：</span>
<input class ="inputform"type="text" name ="isbn" value="<%=lending.getIsbn() %>" readonly><br>
<span>貸出冊数：</span>
<input class ="inputform"type="text" name ="lending_count" value="<%=lending.getLendingCount() %>" readonly><br>
<input class ="bookdeleteform"type ="submit" value="貸出登録確定">
</form>

<form action ="loanconfirm" method="POST">
<input type="hidden" name ="user_id" value ="<%=lending.getUserId() %>">
<input type="hidden" name ="isbn" value ="<%=lending.getIsbn() %>">
<input type="hidden" name ="lending_count" value ="<%=lending.getLendingCount() %>">
<input type="hidden" name ="cancel" value =1>
<input class ="returnbookdeteilform"type="submit" value ="キャンセル">
</form>
</body>
</html>