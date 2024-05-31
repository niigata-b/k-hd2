<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書管理メニュー</title>
<link rel="stylesheet" href="topmenu.css">
</head>
<body>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>図書管理メニュー</h1>
</div>
<br>

<form action="booklist" method="post">
<input class ="btn" type="submit" value="　図書一覧　">
</form>

<form action="bookinsertcategorylist" method="post">
<input class ="btn" type="submit" value="　図書登録　">
</form>
<br>
<form action="category-insert.jsp" method="post">
<input class ="btn" type="submit" value="カテゴリ登録">
</form>

<form action="categorydeletelist" method="post">
<input class ="btn" type="submit" value="カテゴリ削除">
</form>
<br>
<form action ="top-menu.jsp" method = "POST">
<input id ="btn2" type ="submit" value = "トップメニューに戻る">
</form>

</body>
</html>