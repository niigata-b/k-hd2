<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>管理者管理メニュー</h1>

	<form action="admin-insert.jsp" method="post">
		<input type="submit" value="管理者登録">
	</form>

	<form action="adminlist" method="post">
		<input type="submit" value="管理者一覧">
	</form>

	<form action="top-menu.jsp" method="post">
		<input type="submit" value="トップメニューに戻る">
	</form>

</body>
</html>