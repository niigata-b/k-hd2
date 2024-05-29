<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.LendingBean,java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>貸出中情報詳細画面</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>
<%
	LendingBean lending = (LendingBean)request.getAttribute("lending");
%>
<h2>貸出・返却管理</h2>
<h1>貸出中情報詳細画面</h1>
ISBN：<%=lending.getIsbn() %><br>
図書名：<%=lending.getBookName() %><br>
ユーザID：<%=lending.getUserId() %><br>
ユーザ名：<%=lending.getUserName() %><br>
貸出個数：<%=lending.getLendingCount() %><br>
貸出開始日：<%=lending.getStartDate() %><br>
返却期限日：<%=lending.getDeadlineDate() %><br>
期限超過フラグ：<%=lending.getExpiredFlag() %><br>

<form action ="returnconfirm" method="POST">
<input type ="hidden" name ="isbn" value="<%=lending.getIsbn() %>">
<input type ="hidden" name ="book_name" value="<%=lending.getBookName() %>">
<input type ="hidden" name ="user_id" value="<%=lending.getUserId() %>">
<input type ="hidden" name ="user_name" value="<%=lending.getUserName() %>">
<input type ="hidden" name ="lending_count" value="<%=lending.getLendingCount() %>">
<input type ="hidden" name ="start_date" value="<%=lending.getStartDate() %>">
<input type ="hidden" name ="deadline_date" value="<%=lending.getDeadlineDate() %>">
<input type ="hidden" name ="expired_flag" value="<%=lending.getExpiredFlag() %>">
<input type ="submit" value = "返却">
</form>

<form action ="lendinglist" method="POST">
<input type ="submit" value = "貸出中情報一覧に戻る">
</form>
</body>
</html>