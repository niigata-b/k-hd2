<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.LendingBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>貸出登録画面</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>
<%
	LendingBean lending = (LendingBean)request.getAttribute("lending");
	String messageNum = (String)request.getAttribute("messageNum");
	String messageNull = (String)request.getAttribute("messageNull");
	String user_id = "";
	String isbn = "";
	int lending_count = 1;
	try
	{
		user_id = lending.getUserId();
	}
	catch(NullPointerException e)
	{
		user_id = "";
	}
	try
	{
		isbn = lending.getIsbn();
	}
	catch(NullPointerException e)
	{
		isbn = "";
	}
	try
	{
		lending_count = lending.getLendingCount();
	}
	catch(NullPointerException e)
	{
		lending_count = 1;
	}
%>
<h2>貸出・返却管理</h2>
<br>
<h1>貸出登録画面</h1>
<hr>
<br>
<form action ="loanconfirm" method="POST">
<%
try {
if(!(messageNull.equals(null))) {
%>

<%=messageNull %><br>

<%
}

}catch(NullPointerException e)
{
	
}
%>
ユーザID：
<input class ="inputform" type="text" name="user_id" value ="<%=user_id%>"><br>
　　ISBN：
<input class ="inputform" type="text" name="isbn" value ="<%=isbn%>"><br>
<%
try {
if(!(messageNum.equals(null))) {
%>

<%=messageNum %><br>

<%
}

}catch(NullPointerException e)
{
	
}
%>
貸出個数
<select class ="selectbox" name="lending_count">
<option><%=lending_count%></option>
<%
for(int i = 1; i < 4; i++) {
%>

<option><%=i %></option>

<%
}
%>
</select><br>
<input type="submit"value="貸出登録">
</form>
<form action ="lending-return-menu.jsp">
<input type="submit"value="キャンセル">
</form>
</body>
</html>