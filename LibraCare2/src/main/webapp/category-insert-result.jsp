<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 
<%
	BookBean book = (BookBean)request.getAttribute("book");
%>
	
	以下のカテゴリー名を登録しました。<br> 
	<%=book.getCategoryName() %>  
	
	<form action="booklist" method="post"> 
	<input type="submit" value="図書一覧に戻る">
	</form>
</body>
</html>