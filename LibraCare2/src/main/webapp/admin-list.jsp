<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List,model.entity.AdminBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者一覧画面</title>
<link rel="stylesheet" href="list.css">
</head>
<body>
<%
	List<AdminBean> adminList = (List<AdminBean>) request.getAttribute("adminList");
%>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>管理者一覧　　 </h1>
</div>
<br>

<div class ="tablediv">
<table border="1">
<tr>
<th>管理者ID</th>
<th>管理者名</th>
<th></th>
</tr>
<%
	for (AdminBean admin : adminList) {
%>
<tr>
	<td><%=admin.getAdmin_id()%></td>
	<td><%=admin.getAdmin_name()%></td>
	<td>
		<form action="admindetail" method="post">
			<input type="hidden" name="admin_id"value="<%=admin.getAdmin_id()%>">
			<input class ="detailbtn" type="submit" value="詳細">
		</form>
	</td>
</tr>
<%
	}
%>
</table>
</div>

<form action="admin-management-menu.jsp" method="post">
<input class ="returnmenu" type="submit" value="管理者管理メニューに戻る">
</form>

</body>
</html>