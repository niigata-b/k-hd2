<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書個数変更画面</title>
</head>
<body>
<% 
	BookBean book = (BookBean) request.getAttribute("book");
	String messageNum = (String)request.getAttribute("messageNum");
	String messageNull = (String)request.getAttribute("messageNull");
	String messageDupli = (String)request.getAttribute("messageDupli");
	int huyasu;
	int herasu;
	try
	{
		huyasu = book.getHuyasu();
	}
	catch(NullPointerException e)
	{
		huyasu = 0;
	}
	try
	{
		herasu = book.getHerasu();
	}
	catch(NullPointerException e)
	{
		herasu = 0;
	}
	
%> 

<h2>図書管理</h2>
<h1>図書個数変更画面</h1>
ISBN：<%=book.getIsbn() %>
図書名：<%=book.getBookName() %>
個数：<%=book.getBookCount() %>
総個数：<%=book.getTotalBookCount() %>

<%
try {
if(!(messageNull.equals(null))) {
%>

<%=messageNull %><br>

<%
}
if(!(messageNum.equals(null))) {
%>

<%=messageNum %><br>

<% 
}
if(!(messageDupli.equals(null))) {
%>

<%=messageDupli %><br>

<%
}
}
catch(NullPointerException e)
{
	System.out.println("a");
}
%>

<form action ="bookupdateconfirm" method ="POST">
増やす：
<input type ="text" name="huyasu" value = <%=huyasu %>>
減らす：
<input type ="text" name="herasu" value = <%=herasu %>>
<input type="hidden" name ="isbn" value="<%=book.getIsbn() %>">
<input type="hidden" name ="book_name" value="<%=book.getBookName() %>">
<input type="hidden" name ="book_count" value="<%=book.getBookCount() %>">
<input type="hidden" name ="total_book_count" value="<%=book.getTotalBookCount() %>">
<input type="submit" value="変更">
</form>

<form action ="bookdetail" method ="POST">
<input type="hidden" name ="isbn" value="<%=book.getIsbn() %>">
<input type="submit" value ="キャンセル">
</form>
</body>
</html>