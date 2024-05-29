<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.LendingBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>返却確定画面</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>
<%
	LendingBean lending = (LendingBean)request.getAttribute("lending");
%>
<h2>貸出・返却管理</h2>
<h1>返却確定画面</h1>
以下の図書を返却しました。<br>
ISBN：<%=lending.getIsbn() %><br>
図書名：<%=lending.getBookName() %><br>
ユーザID：<%=lending.getUserId() %><br>
ユーザ名：<%=lending.getUserName() %><br>
貸出数：<%=lending.getLendingCount() %><br>

<form action ="lendinglist" method="POST">
<input type ="submit" value="貸出情報一覧画面に戻る">
</form>
</body>
</html>