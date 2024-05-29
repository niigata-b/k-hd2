<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ一覧表示画面</title>
<link rel="stylesheet" href="list.css">
</head>
<body>
<%
	List<UserBean> userList = (List<UserBean>) request.getAttribute("userList");
%>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>ユーザ一覧　　 </h1>
</div>
<br>

<div class ="tablediv">
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
			<input class ="detailbtn" type="submit" value ="詳細">
		</form>
	</td>
</tr>
<%
	}
%>
</table>
</div>

<form action ="user-menu.jsp" method="POST">
<input class ="returnmenu" type ="submit" value="ユーザ管理メニューに戻る">
</form>

</body>
</html>