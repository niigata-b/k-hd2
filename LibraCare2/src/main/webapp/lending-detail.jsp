<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.LendingBean,java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>貸出中情報詳細画面</title>
<link rel="stylesheet" href="list.css">
</head>
<body>
<%
	LendingBean lending = (LendingBean)request.getAttribute("lending");
%>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>貸出情報詳細</h1>
<br>
<br>
<br>
<br>
<br>
<br>
<table>
  <tr>
  	<th>ISBN</th>
  	<td><%=lending.getIsbn() %></td>
  </tr>
  <tr>
  	<th>図書名</th>
  	<td><%=lending.getBookName() %></td>
  </tr>
  <tr>
  	<th>ユーザID</th>
  	<td><%=lending.getUserId() %></td>
  </tr>
  <tr>
  	<th>ユーザ名</th>
  	<td><%=lending.getUserName() %></td>
  </tr>
  <tr>
  	<th>貸出個数</th>
    <td><%=lending.getLendingCount() %></td>
  </tr>
  <tr>
  	<th>貸出開始日</th>
  	<td><%=lending.getStartDate() %></td>
  </tr>
  <tr>
  	<th>返却期限日</th>
  	<td><%=lending.getDeadlineDate() %></td>
  </tr>
  <tr>
  	<th>期限超過フラグ</th>
  	<td><%=lending.getExpiredFlag() %></td>
  </tr>
</table>

<form action ="returnconfirm" method="POST">
<input type ="hidden" name ="isbn" value="<%=lending.getIsbn() %>">
<input type ="hidden" name ="book_name" value="<%=lending.getBookName() %>">
<input type ="hidden" name ="user_id" value="<%=lending.getUserId() %>">
<input type ="hidden" name ="user_name" value="<%=lending.getUserName() %>">
<input type ="hidden" name ="lending_count" value="<%=lending.getLendingCount() %>">
<input type ="hidden" name ="start_date" value="<%=lending.getStartDate() %>">
<input type ="hidden" name ="deadline_date" value="<%=lending.getDeadlineDate() %>">
<input type ="hidden" name ="expired_flag" value="<%=lending.getExpiredFlag() %>">
<input class = "returnbtn" type ="submit" value = "返却">
</form>

<form action ="lendinglist" method="POST">
<input class ="returnloanmenu" type ="submit" value = "貸出中情報一覧に戻る">
</form>
</body>
</html>