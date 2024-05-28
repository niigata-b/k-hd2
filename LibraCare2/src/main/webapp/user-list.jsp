<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ一覧表示画面</title>
<style>
body{
text-align: center;
}
div {
overflow-y: scroll;
}
table {
margin-left: 500px;
}
</style>
</head>

<body>
<h1>ユーザ一覧表示画面</h1>
<%
List<UserBean> userList
= (List<UserBean>) request.getAttribute("userList");
%>

	<div>
	<table border ="1">
	<tr>
	<th>ユーザID</th>
	<th>ユーザ名</th>
	<th></th>
	</tr>
	<%
		for (UserBean user : userList) {
	%>
	<tr>
		<td><%=user.getUserId() %></td>
		<td><%=user.getUserName() %></td>
		<td>
			<form action ="userdetail" method="POST">
				<input type="hidden" name ="user_id" value="<%=user.getUserId() %>">
				<input type="hidden" name ="user_name" value="<%=user.getUserName() %>">
				<input type="submit" value ="詳細">
			</form>
		</td>
	</tr>
	<%
		}
	%>
	</table>
	</div>
	<form action ="user-menu.jsp" method="POST">
	<input type ="submit" value="ユーザ管理メニューに戻る">
	</form>
</body>
</html>