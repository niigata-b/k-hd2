<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書登録画面</title>
</head>
<body>
<%
	BookBean book = (BookBean)request.getAttribute("book");
	String messageNum = (String)request.getAttribute("messageNum");
	String messageNull = (String)request.getAttribute("messageNull");
	String isbn = "";
	String book_name = "";
	String category_name = "";
	int book_count = 1;
			
	try
	{
		isbn = book.getIsbn();
	}
	catch(NullPointerException e)
	{
		isbn = "";
	}
	try
	{
		book_name = book.getBookName();
	}
	catch(NullPointerException e)
	{
		book_name = "";
	}
	try
	{
		category_name = book.getCategoryName();
	}
	catch(NullPointerException e)
	{
		category_name = "";
	}
	try
	{
		book_count = 1;
	}
	catch(NullPointerException e)
	{
		book_count = 1;
	}
%>
<h1>図書管理</h1>
<h1>図書情報登録画面</h1>
<%
try {
if(!(messageNull.equals(null))) {
%>

<%=messageNull %><br>

<%
}

}catch(NullPointerException e)
{
	
}
%>
<%
try {
if(!(messageNum.equals(null))) {
%>

<%=messageNum %><br>

<%
}

}catch(NullPointerException e)
{
	
}
%>

<form action ="bookinsertconfirm" method="POST">
ISBN
<input type="text" name="isbn" value ="<%=isbn%>"><br>
図書名
<input type="text" name="book_name" value ="<%=book_name%>"><br>
カテゴリ名
<input type="text" name="category_name" value ="<%=category_name%>"><br>
個数
<input type="text" name="book_count" value ="<%=book_count%>"><br>

<input type="submit"value="登録">
</form>

<form action ="book-menu.jsp" metod ="POST">
<input type="submit"value="キャンセル">
</form>
</body>
</html>