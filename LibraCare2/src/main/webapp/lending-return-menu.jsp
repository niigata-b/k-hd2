<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>貸出返却メニュー画面</title>
<style>
body{
text-align: center;
}
</style>
</head>
<body>
<h1>貸出返却管理</h1>
<h1>貸出返却メニュー画面</h1>
<form action = "lendinglist" method = "POST">
<input type = "submit" value = "貸出中情報一覧">
</form>
<form action ="loan.jsp" method = "POST">
<input type = "submit" value = "貸出登録">
</form>
</body>
</html>