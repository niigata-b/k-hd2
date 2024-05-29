<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>カテゴリ登録画面</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>
	<%
	
	String messageNull = (String)request.getAttribute("messageNull"); 
	BookBean book = (BookBean)request.getAttribute("book");
	String category_name = "";
	try {
		category_name = book.getCategoryName();
	} catch(Exception e) {
		
	}
	%>
	<h2>カテゴリー登録画面</h2>
	新しく登録するカテゴリー名を入力してください

	<form action="categoryinsertconfirm" method="post">
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
		<input class ="inputform" type="text" name="category_name" value="<%=category_name%>"> 
		<input type="submit"value="カテゴリー名登録">
	</form>

	<form action="booklist" method="post">
		<input type="submit" value="キャンセル">
	</form>
</body>
</html>