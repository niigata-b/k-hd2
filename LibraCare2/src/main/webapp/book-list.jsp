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
<body> 
<%
	List<BookBean> bookList = (List<BookBean>) request.getAttribute("bookList"); 
	List<BookBean> categoryList = (List<BookBean>) request.getAttribute("categoryList");
 	BookBean bs = (BookBean)request.getAttribute("book");
	String message = (String) request.getAttribute("message"); 
	
	String book_name = " ";
	String category_name = "";
	try
	{
		book_name =bs.getBookName();
	}
	catch(NullPointerException e)
	{
		book_name = "";
	}
	try
	{
		category_name =bs.getCategoryName();
	}
	catch(NullPointerException e)
	{
		category_name = "";
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

	<h2>図書一覧</h2>
	<form action="booksearch" method="post">
		図書名検索 <input type="search" name="book_name" value="<%=book_name%>">  
		<input type="submit" value="検索">
	</form> 
	
	<form action="categorysearch" method="post">
	カテゴリー名検索 
	<select name="category_name"> 
	<option><%=category_name%></option>
	 
	<% 
	for (BookBean category : categoryList) {  
	%>  
	<option><%=category.getCategoryName()%></option> 
	<%} %>
	</select>  

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
		for (BookBean book : bookList) {
		%>
		<tr>
			<td><%=book.getIsbn()%></td>
			<td><%=book.getBookName()%></td>
			<td><%=book.getCategoryName()%></td>
			<td><%=book.getBookCount()%></td>
			<td><%=book.getLendingFlag()%></td>
			<td>
				<form action="bookdetail" method="post">
					<input type="hidden" name="isbn" value="<%=book.getIsbn()%>">
					<input type="submit" value="詳細">
				</form>
			</td>
		</tr>
		<%
		}
		%>
	</table>
	<form action="category-insert.jsp">
		<input type="submit" value="カテゴリー登録">
	</form>
	<form action="categorydeletelist">
		<input type="submit" value="カテゴリー削除">
	</form>
	<form action="book-menu.jsp" method="post">
		<input type="submit" value="図書管理メニューに戻る">
	</form>



</body>
</html>