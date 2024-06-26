<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List,model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書一覧画面</title>
<link rel="stylesheet" href="list.css">
</head>
<style>
p{
margin-bottom:0px;
}
</style>
<body> 
<%
	List<BookBean> bookList = (List<BookBean>) request.getAttribute("bookList"); 
	List<BookBean> categoryList = (List<BookBean>) request.getAttribute("categoryList");
 	BookBean bs = (BookBean)request.getAttribute("book");
	String message = (String) request.getAttribute("message"); 
	String book_name = " ";
	String category_name = " ";
	try {
		book_name = bs.getBookName();
	} catch(NullPointerException e) {
		book_name = "";
	} try {
		category_name = bs.getCategoryName();
	} catch(NullPointerException e) {
		category_name = "";
	}
%>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>図書一覧　　　</h1>
</div>
<br>
<div class ="bookdiv">
<p class ="searchp">検索したい図書名またはカテゴリ名を入力してください。</p>
<form action="booksearch" method="post">
<input class ="inputformbook" type="search" name="book_name" value="<%=book_name%>" placeholder ="図書名">
<input type="hidden" name="category_name" value="<%=category_name%>">   
<input class = "searchbtnbook" type="submit" value="検索">
</form> 
	
<form id = "cateform" action="categorysearch" method="post">
<input class ="inputform" type="hidden" name="book_name" value="<%=book_name%>">
<select class ="selectcategory" name="category_name"> 
<option value="" disabled selected style="display:none;">カテゴリ名
 
<% 
for (BookBean category : categoryList) {  
%>  
<option><%=category.getCategoryName()%></option> 
<%} %>
</select>  
<input class = "searchbtn2" type="submit" value="検索">  
</form>
</div>
<% 
	try {
		if(!(message.equals(null))) {
%>
			<p class ="error"><%=message %></p>
<%
		}
	}catch(NullPointerException e) {
	}
%>
<div class ="tablediv">
<table border="1">
<tr>
<th>ISBN</th>
<th>図書名</th>
<th>カテゴリ名</th>
<th>冊数</th>
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
			<input class ="detailbtn" type="submit" value="詳細">
		</form>
	</td>
</tr>
<%
	}
%>
</table>
</div>

<form action="book-menu.jsp" method="post">
<input class ="returnmenu" type="submit" value="図書管理メニューに戻る">
</form>
</body>
</html>