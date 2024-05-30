<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List,model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書詳細画面</title>
<link rel="stylesheet" href="list.css">
</head>
<body>
	<% 
	BookBean bookdetail = (BookBean) request.getAttribute("bookDetail");
	%> 
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>図書詳細　　　</h1>
<br>
<br>
<br>
<br>
<br>
<br>
<table>
	<tr>
		<th>ISBN</th>
		<td><%=bookdetail.getIsbn() %></td>
	</tr>
	<tr>
		<th>図書名</th>
		<td><%=bookdetail.getBookName() %></td>
	</tr>
	<tr>
		<th>カテゴリ名</th>
		<td><%=bookdetail.getCategoryName() %></td>
	</tr>
	<tr>
		<th>個数</th>
		<td><%=bookdetail.getBookCount() %></td>
	</tr>
	<tr>
		<th>総個数</th>
		<td><%=bookdetail.getTotalBookCount() %></td>
	</tr>
	<tr>
		<th>総貸出個数</th>
		<td><%=bookdetail.getTotalLendingCount() %></td>
	</tr>
	<tr>
		<th>貸出中フラグ</th>
		<td><%=bookdetail.getLendingFlag() %></td>
	</tr>
</table>

<form action="bookupdateform" method ="POST">
<input type="hidden" name ="isbn" value="<%=bookdetail.getIsbn() %>">
<input type="hidden" name ="book_name" value="<%=bookdetail.getBookName() %>">
<input type="hidden" name ="category_name" value="<%=bookdetail.getCategoryName() %>">
<input type="hidden" name ="book_count" value="<%=bookdetail.getBookCount() %>">
<input type="hidden" name ="total_book_count" value="<%=bookdetail.getTotalBookCount() %>">
<input type="hidden" name ="lending_flag" value="<%=bookdetail.getLendingFlag() %>">
<input class = "updbtn2" type="submit" value="変更">
</form>

<form action="bookdeleteconfirm" method ="POST">
<input type="hidden" name ="isbn" value="<%=bookdetail.getIsbn() %>">
<input type="hidden" name ="book_name" value="<%=bookdetail.getBookName() %>">
<input type="hidden" name ="category_name" value="<%=bookdetail.getCategoryName() %>">
<input type="hidden" name ="book_count" value="<%=bookdetail.getBookCount() %>">
<input class = "deletebtn2" type="submit" value="削除">
</form>

<form action="booklist" method="POST">
<input class ="returnbookmenu" type="submit" value="図書一覧画面に戻る">
</form>
</body>
</html>