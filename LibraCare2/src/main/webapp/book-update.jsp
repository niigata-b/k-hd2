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
	String messageZero = (String)request.getAttribute("messageZero");
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
ISBN：<%=book.getIsbn() %><br>
図書名：<%=book.getBookName() %><br>
個数：<%=book.getBookCount() %><br>
総個数：<%=book.getTotalBookCount() %><br>

<%
try {
if(!(messageNum.equals(null))) {
%>

<%=messageNum %><br>

<%
}
}
catch(NullPointerException e)
{
	
}

try{
if(!(messageNull.equals(null))) {
%>

<%=messageNull %><br>

<% 
}
}catch(NullPointerException e)
{
	
}

try{
if(!(messageDupli.equals(null))) {
%>

<%=messageDupli %><br>

<%
}
}catch(NullPointerException e)
{
	
}
try
{
if(!(messageZero.equals(null))) {
%>

<%=messageZero %><br>

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
<input type ="text" name="huyasu" value = <%=huyasu %>><br>
減らす：
<input type ="text" name="herasu" value = <%=herasu %>><br>
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