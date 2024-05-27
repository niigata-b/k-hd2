<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	BookBean book = (BookBean)request.getAttribute("lending");
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
		category_name = book.CategoryName();
	}
	catch(NullPointerException e)
	{
		category_name = "";
	}
	try
	{
		book_count = 1;
	}
	catch
	{
		book_count = 1;
	}
%>
<h1>図書管理</h1>
<h1>図書情報登録画面</h1>
<form action ="bookinsertconfirm" method="POST">
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
ISBN
<input type="text" name="isbn" value ="<%=isbn%>"><br>
図書名
<input type="text" name="book_name" value ="<%=book_name%>"><br>
カテゴリ名
<input type="text" name="category_name" value ="<%=category_name%>"><br>
個数
<input type="text" name="book_count" value ="<%=book_count%>"><br>

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


<%
}
%>
</select>
<input type="submit"value="登録">
</form>
<form action ="book-menu.jsp">
<input type="submit"value="キャンセル">
</form>
</body>
</html>