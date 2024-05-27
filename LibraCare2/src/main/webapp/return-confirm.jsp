<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.LendingBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>返却確認画面</title>
<style>
body{
text-align: center;
}
</style>
</head>
<body>
<%
	LendingBean lending = (LendingBean)request.getAttribute("lending");
%>
<h2>貸出・返却管理</h2>
<h1>返却確認画面</h1>
以下の図書を返却します。
よろしいですか？
<form action ="return" method="POST">
ISBN			：<input type ="label" name ="isbn" value="<%=lending.getIsbn() %>" readonly><br>
図書名			：<input type ="label" name ="book_name" value="<%=lending.getBookName() %>" readonly><br>
ユーザID		：<input type ="label" name ="user_id" value="<%=lending.getUserId() %>" readonly><br>
ユーザ名		：<input type ="label" name ="user_name" value="<%=lending.getUserName() %>" readonly><br>
貸出数			：<input type ="label" name ="lending_count" value="<%=lending.getLendingCount() %>" readonly><br>
貸出開始日		：<input type ="label" name ="start_date" value="<%=lending.getStartDate() %>" readonly><br>
返却期限日		：<input type ="label" name ="deadline_date" value="<%=lending.getDeadlineDate() %>" readonly><br>
期限超過フラグ	：<input type ="label" name ="expired_flag" value="<%=lending.getExpiredFlag() %>" readonly><br>
<input type ="submit" value = "返却確定">
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
<input type ="submit" value="キャンセル">
</form>
</body>
</html>