<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.LendingBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>貸出登録失敗画面</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>
<%
	LendingBean lending = (LendingBean)request.getAttribute("lending");
%>
<h2>貸出・返却管理</h2>
<h1>貸出登録失敗画面</h1>
以下の内容の登録に失敗しました。<br>
ユーザーID：<%=lending.getUserId() %><br>
ISBN：<%=lending.getIsbn() %><br>
貸出個数：<%=lending.getLendingCount() %><br>

<form action = "loanconfirm" method="POST">
<input type="hidden" name ="user_id" value ="<%=lending.getUserId() %>">
<input type="hidden" name ="isbn" value ="<%=lending.getIsbn() %>">
<input type="hidden" name ="lending_count" value ="<%=lending.getLendingCount() %>">
<input type="hidden" name ="cancel" value =1>
<input type="submit" value ="貸出登録画面に戻る">
</form>
</body>
</html>