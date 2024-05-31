<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書個数変更画面</title>
<link rel="stylesheet" href="insert.css">
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
	try{
		huyasu = book.getHuyasu();
	}catch(NullPointerException e)
	{
		huyasu = 0;
	}
	try{
		herasu = book.getHerasu();
	}catch(NullPointerException e)
	{
		herasu = 0;
	}
%> 
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>図書冊数変更　　　</h1>
</div>
<br>
<p class="midasi">　増減する図書冊数を入力してください。</p>
<span>ISBN：</span>
<input class ="inputform" type="text" name="book_name" value ="<%=book.getIsbn() %>" readonly>
<span>図書名：</span>
<input class ="inputform" type="text" name="book_name" value ="<%=book.getBookName() %>" readonly>
<span>冊数：</span>
<input class ="inputform" type="text" name="book_name" value ="<%=book.getBookCount() %>" readonly>
<span>総冊数：</span>
<input class ="inputform" type="text" name="book_name" value ="<%=book.getTotalBookCount() %>" readonly><br>
<%
try {
if(!(messageNum.equals(null))) {
	messageNull = null;
	messageDupli = null;
	messageZero = null;
%>
<p class="error"><%=messageNum %></p>
<%
}
}
catch(NullPointerException e)
{
}
try{
if(!(messageNull.equals(null))) {
	messageNum = null;
	messageDupli = null;
	messageZero = null;
%>
<p class="error"><%=messageNull %></p>
<% 
}
}catch(NullPointerException e)
{
}
try{
if(!(messageDupli.equals(null))) {
	messageZero = null;
	messageNum = null;
	messageNull = null;
%>
<p class="error"><%=messageDupli %></p>
<%
}
}catch(NullPointerException e)
{
}
try
{
if(!(messageZero.equals(null))) {
	messageNum = null;
	messageDupli = null;
	messageNull = null;
%>
<p class="error"><%=messageZero %></p>
<%
}
}
catch(NullPointerException e)
{
}
%>
<form action ="bookupdateconfirm" method ="POST">
<span>増やす：</span>
<input class ="inputform" type ="text" name="huyasu" value = <%=huyasu %>><br>
<span>減らす：</span>
<input class ="inputform" type ="text" name="herasu" value = <%=herasu %>><br>
<input type="hidden" name ="isbn" value="<%=book.getIsbn() %>">
<input type="hidden" name ="book_name" value="<%=book.getBookName() %>">
<input type="hidden" name ="book_count" value="<%=book.getBookCount() %>">
<input type="hidden" name ="total_book_count" value="<%=book.getTotalBookCount() %>">
<input class ="bookinsertform" type="submit" value="変更">
</form>

<form action ="bookdetail" method ="POST">
<input type="hidden" name ="isbn" value="<%=book.getIsbn() %>">
<input class ="returnbookmenuform" type="submit" value ="キャンセル">
</form>
</body>
</html>