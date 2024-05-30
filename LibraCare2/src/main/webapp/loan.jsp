<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.LendingBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>貸出登録画面</title>
<link rel="stylesheet" href="insert.css">
</head>
<body>
<%
	LendingBean lending = (LendingBean)request.getAttribute("lending");
	String messageNum = (String)request.getAttribute("messageNum");
	String messageNull = (String)request.getAttribute("messageNull");
	String user_id = "";
	String isbn = "";
	int lending_count = 1;
	try {
		user_id = lending.getUserId();
	} catch(NullPointerException e) {
		user_id = "";
	}try {
		isbn = lending.getIsbn();
	} catch(NullPointerException e){
		isbn = "";
	}try {
		lending_count = lending.getLendingCount();
	} catch(NullPointerException e) {
		lending_count = 1;
	}
%>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>貸出登録　　　　　</h1>
</div>
<br>
<form action ="loanconfirm" method="POST">
<%
try {
if(!(messageNull.equals(null))) {
%>
<p class="error"><%=messageNull %></p>
<%
}
}catch(NullPointerException e){
}
%>
<div class ="loaninp">
<span>ユーザID：</span>
<input class ="inputform" type="text" name="user_id" value ="<%=user_id%>" placeholder="ユーザID"><br>
<span>　　ISBN：</span>
<input class ="inputform" type="text" name="isbn" value ="<%=isbn%>" placeholder="ISBN"><br>
</div>
<%
try {
if(!(messageNum.equals(null))) {
%>
<p class="error"><%=messageNum %></p>
<%
}
}catch(NullPointerException e){	
}
%>
<div id ="lendingcount">

<p class ="lendcnt">貸出個数：</p>

<select class ="selectnum" name="lending_count">
<option><%=lending_count%></option>
<%
for(int i = 1; i < 4; i++) {
%>
<option><%=i %></option>
<%
}
%>
</select>
</div>

<input class ="insertform" type="submit"value="貸出登録">
</form>

<form action ="lending-return-menu.jsp">
<input class ="returnmenuform" type="submit"value="キャンセル">
</form>

</body>
</html>