<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ詳細画面</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>
<%
	UserBean user = (UserBean)request.getAttribute("user");
%>
<h1>ユーザ詳細画面</h1>
ユーザID：<%=user.getUserId() %><br>
ユーザ名：<%=user.getUserName() %><br>

<form action ="userupdateform" method="POST">
<input type ="hidden" name ="user_id" value ="<%=user.getUserId() %>">
<input type ="hidden" name ="user_name" value="<%=user.getUserName() %>">
<input type ="submit" value = "ユーザ情報変更">
</form>

<form action ="userdeleteconfirm" method="POST">
<input type ="hidden" name ="user_id" value ="<%=user.getUserId() %>">
<input type ="hidden" name ="user_name" value="<%=user.getUserName() %>">
<input type ="submit" value = "ユーザ情報削除">
</form>


<form action ="userlist" method="POST">
<input type ="submit" value = "ユーザ一覧に戻る">
</form>
</body>
</html>