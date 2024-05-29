<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ削除失敗画面</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>
<h1>ユーザ削除失敗画面</h1>
<h2>ユーザ削除できませんでした</h2>
<form action ="userdetail" method ="POST">
<input type ="hidden" name ="user_id" value="<%=user.getUserId() %>">
<input type ="hidden" name ="user_name" value="<%=user.getUserName() %>">
<input type ="submit" value="ユーザ詳細画面に戻る">
</form>
</body>
</html>