<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.LendingBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>返却確認画面</title>
<link rel="stylesheet" href="insert.css">
</head>
<body>
<%
	LendingBean lending = (LendingBean)request.getAttribute("lending");
%>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>返却確認　　　　　</h1>
</div>
<br>
<p class="midasi">以下の貸出中情報を返却します。よろしいですか？</p>
<form action ="return" method="POST">
<span>　　　　　ISBN：</span>
<input class ="inputform"type ="label" name ="isbn" value="<%=lending.getIsbn() %>" readonly>
<span>　　　　図書名：</span>
<input class ="inputform" type ="label" name ="book_name" value="<%=lending.getBookName() %>" readonly><br>
<span>　　　ユーザID：</span>
<input class ="inputform" type ="label" name ="user_id" value="<%=lending.getUserId() %>" readonly>
<span>　　　ユーザ名：</span>
<input class ="inputform" type ="label" name ="user_name" value="<%=lending.getUserName() %>" readonly><br>
<span>　　貸出開始日：</span>
<input class ="inputform" type ="label" name ="start_date" value="<%=lending.getStartDate() %>" readonly>
<span>　　返却期限日：</span>
<input class ="inputform" type ="label" name ="deadline_date" value="<%=lending.getDeadlineDate() %>" readonly><br>
<span>　　　　貸出数：</span>
<input class ="inputform" type ="label" name ="lending_count" value="<%=lending.getLendingCount() %>" readonly>
<span>期限超過フラグ：</span>
<input  class ="inputform" type ="label" name ="expired_flag" value="<%=lending.getExpiredFlag() %>" readonly><br>
<input  class ="bookdeleteform" type ="submit" value = "返却確定">
</form>

<form action ="lendingdetail" method="POST">
<input type ="hidden" name ="isbn" value="<%=lending.getIsbn() %>">
<input type ="hidden" name ="book_name" value="<%=lending.getBookName() %>">
<input type ="hidden" name ="user_id" value="<%=lending.getUserId() %>">
<input type ="hidden" name ="user_name" value="<%=lending.getUserName() %>">
<input type ="hidden" name ="lending_count" value="<%=lending.getLendingCount() %>">
<input type ="hidden" name ="start_date" value="<%=lending.getStartDate() %>">
<input type ="hidden" name ="deadline_date" value="<%=lending.getDeadlineDate() %>">
<input type ="hidden" name ="expired_flag" value="<%=lending.getExpiredFlag() %>">
<input class ="returnbookdeteilform" type ="submit" value="キャンセル">
</form>
</body>
</html>