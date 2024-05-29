<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.LendingBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>貸出登録確認画面</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>
<%
	LendingBean lending = (LendingBean)request.getAttribute("lending");
%>
<h2>貸出・返却管理</h2>
<h1>貸出登録確認画面</h1>
以下の内容で登録します。<br>
よろしいですか？

<form action ="loan" method="POST">
ユーザID：<input type="text" name ="user_id" value="<%=lending.getUserId() %>" readonly><br>
ISBN：<input type="text" name ="isbn" value="<%=lending.getIsbn() %>" readonly><br>
貸出個数：<input type="text" name ="lending_count" value="<%=lending.getLendingCount() %>" readonly><br>
<input type ="submit" value="貸出登録確定">
</form>

<form action ="loanconfirm" method="POST">
<input type="hidden" name ="user_id" value ="<%=lending.getUserId() %>">
<input type="hidden" name ="isbn" value ="<%=lending.getIsbn() %>">
<input type="hidden" name ="lending_count" value ="<%=lending.getLendingCount() %>">
<input type="hidden" name ="cancel" value =1>
<input type="submit" value ="キャンセル">
</form>
</body>
</html>