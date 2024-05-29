<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>カテゴリ削除画面</title>
<link rel="stylesheet" href="style1.css">
</head>
<body> 
	<% List<BookBean> categoryList = (List<BookBean>) request.getAttribute("categoryList");  
	%>
	<h2>消去するカテゴリー名を選択してください</h2> 
	<form action="categorydelete" method="post"> 
	<select name="category_name"> 
	 
	<%for (BookBean book : categoryList){ %>  
	<option value="<%=category_name %>"</option>  
	<%} %>
	</select> 
	</form> 
	<input type="submit" value="カテゴリー名削除"> 
	
</body>
</html>