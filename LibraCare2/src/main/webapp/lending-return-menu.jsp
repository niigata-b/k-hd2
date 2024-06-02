<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="topmenu.css">
<title>貸出返却管理メニュー</title>
</head>
<body>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>貸出返却管理メニュー</h1>
</div>
<br>

<form action = "lendinglist" method = "POST">
<input class ="btn" type ="submit" value = "貸出中情報一覧">
</form>

<form action ="loan.jsp" method = "POST">
<input class ="btn" type ="submit" value = " 　貸出登録　 ">
</form>

<form action ="menu" method = "POST">
<input class ="btn" type ="submit" value = "トップメニューに戻る">
</form>

</body>
</html>