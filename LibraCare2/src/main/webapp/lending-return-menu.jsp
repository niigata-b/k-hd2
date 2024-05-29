<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style1.css">
<title>貸出返却メニュー画面</title>
</head>
<body>
<h2>貸出・返却管理</h2>
<br>
<h1>貸出返却メニュー</h1>
<hr>
<br>
<form action = "lendinglist" method = "POST">
<input class ="btn" id = "btn1" type ="submit" value = " 　　　貸出中情報一覧　　　 ">
</form>
<br>

<form action ="loan.jsp" method = "POST">
<input class ="btn" id = "btn2" type ="submit" value = "　　　　　貸出登録　　　　　">
</form>
<br>
<form action ="menu" method = "POST">
<input class ="btn" id = "btn3" type ="submit" value = "　　トップメニューに戻る　　">
</form>

</body>
</html>