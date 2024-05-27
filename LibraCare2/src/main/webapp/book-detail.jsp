<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List,model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>図書詳細画面</h2>
	<% 
	BookBean bookdetail = (BookBean) request.getAttribute("bookDetail");
	%> 
	<table border="1">
		<tr>
			<th>ISBN</th>
			<th>図書名</th>
			<th>カテゴリー名</th>
			<th>個数</th>
			<th>総個数</th>
			<th>総貸出個数</th>
			<th>貸出中フラグ</th>
			<th></th>
		</tr>
  	
  	<tr>
	<td><%=bookdetail.getIsbn() %></td>
	<td><%=bookdetail.getBookName() %></td>
	<td><%=bookdetail.getCategoryName() %></td>
	<td><%=bookdetail.getBookCount() %><td>
	<td><%=bookdetail.getBookTotalCount() %><td>
	<td><%=bookdetail.getTotalLendingCount() %><td>
	<td><%=bookdetail.getLendingFlag() %></td> 
	</tr> 
	</table>

	<form action="bookupdateform">
		<input type="hidden" name ="isbn" value="<%=bookdetail.getIsbn() %>">
		<input type="hidden" name ="book_name" value="<%=bookdetail.getBookName() %>">
		<input type="hidden" name ="category_name" value="<%=bookdetail.getCategoryName() %>">
		<input type="hidden" name ="book_count" value="<%=bookdetail.getBookCount() %>">
		<input type="hidden" name ="lending_flag" value="<%=bookdetail.getLendingFlag() %>">
		<input type="submit" value="図書詳細情報変更">
	</form>
	<form action="book-delete.jsp">
		<input type="submit" value="図書詳細情報削除">
	</form>
	<form action="booklist" method="post">
		<input type="submit" value="図書一覧画面に戻る">
	</form>
</body>
</html>