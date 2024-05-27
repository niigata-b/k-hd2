<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.LendingBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>貸出登録確定画面</title>
</head>
<body>
<%
	LendingBean lending = (LendingBean)request.getAttribute("lending");
%>
<h1>貸出・返却管理</h1>
<h1>貸出登録確定画面</h1>
以下の内容を登録しました。<br>

<form action ="lendinglist" method="POST">
<input type ="submit" value="貸出情報一覧画面に戻る">
</form>

</body>
</html>