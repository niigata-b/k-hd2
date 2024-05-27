<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List,model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	text-align: center;
}

div {
	overflow-y: scroll;
}

table {
	margin-left: 500px;
}
</style>
</head>
</head>
<body>
	<h2>図書一覧</h2> 
	<%
		List<BookBean> bookList
			= (List<BookBean>) request.getAttribute("bookList");
	
		String message = (String)request.getAttribute("message");
		
		
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
	<form action="bookserch" method="post">
		図書名検索<input type="text" name="book_name"> 
		<input type="submit" value="検索">
	</form>
	<form action="categoryserch" method="post">
		カテゴリ検索<input type="text" name="category_name"> 
		<input type="submit" value="検索">
	</form>
	
	<table border="1">
		<tr>
			<th>ISBN</th>
			<th>図書名</th>
			<th>カテゴリー名</th>
			<th>個数</th>
			<th>貸出中フラグ</th>
			<th></th>
		</tr>
		<% 
		for(BookBean book : bookList){  
		%>
		<tr>
			<td><%=book.getIsbn() %></td>
			<td><%=book.getBookName() %></td>
			<td><%=book.getCategoryName() %></td>
			<td><%=book.getBookCount() %></td>
			<td><%=book.getLendingFlag() %></td>
			<td> 
			<form action="bookdetail" method="post">
					<input type="hidden" name="isbn" value="<%=book.getIsbn() %>">
					<input type="submit" value="詳細"> 
					</form>
				</td>
		</tr>
		<%} %> 
	
	</table>
	<form action="category-insert.jsp">
		<input type="submit" value="カテゴリー登録">
	</form>
	<form action="category-delete.jsp">
		<input type="submit" value="カテゴリー削除">
	</form>
	<form action="booklistservlet" method="post">
		<input type="submit" value="図書管理メニューに戻る">
	</form>



</body>
</html>