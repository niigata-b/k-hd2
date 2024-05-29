<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,model.entity.LendingBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>貸出中情報一覧画面</title>
<link rel="stylesheet" href="style1.css">
<style>
div {
overflow-y: scroll;
}
table {
margin-left: 500px;
}
</style>
</head>
<body>
<h2>貸出・返却管理</h2>
<h1>貸出中情報一覧画面</h1>
	<%
		List<LendingBean> lendingList
			= (List<LendingBean>) request.getAttribute("lendingList");
	
		LendingBean lendingsearch = (LendingBean)request.getAttribute("lending");
		String message = (String)request.getAttribute("message");
		String user_id = "";
		String isbn = "";
		try
		{
			user_id = lendingsearch.getUserId();
		}
		catch(NullPointerException e)
		{
			user_id = "";
		}
		try
		{
			isbn = lendingsearch.getIsbn();
		}
		catch(NullPointerException e)
		{
			isbn = "";
		}
	%>
	<%
	try {
	if(!(message.equals(null))) {
	%>

	<%=message %><br>

	<%
	}

	}catch(NullPointerException e)
	{
	
	}
	%>
	
	<form action ="lendingsearch" method ="POST">
	ISBN：<input type="search" name ="isbn" value ="<%=isbn%>"><br>
	ユーザID：<input type="search" name ="user_id" value ="<%=user_id%>">
	<input type ="submit" value ="検索">
	</form>
	<div>
	<table border ="1">
	<tr>
	<th>ISBN</th>
	<th>図書名</th>
	<th>ユーザID</th>
	<th>ユーザ名</th>
	<th>期限超過フラグ</th>
	<th></th>
	</tr>
	<%
		for (LendingBean lending : lendingList) {
	%>
	<tr>
		<td><%=lending.getIsbn() %></td>
		<td><%=lending.getBookName() %></td>
		<td><%=lending.getUserId() %></td>
		<td><%=lending.getUserName() %></td>
		<td><%=lending.getExpiredFlag() %></td>
		<td>
			<form action ="lendingdetail" method="POST">
				<input type="hidden" name ="isbn" value="<%=lending.getIsbn() %>">
				<input type="hidden" name ="user_id" value="<%=lending.getUserId() %>">
				<input type="submit" value ="詳細">
			</form>
		</td>
	</tr>
	<%
		}
	%>
	</table>
	</div>
	<form action ="lending-return-menu.jsp" method="POST">
	<input type ="submit" value="貸出・返却メニューに戻る">
	</form>
</body>
</html>