<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 
	<% List<BookBean> categoryList = (List<BookBean>) request.getAttribute("categoryList");  
	%>
	<h2>消去するカテゴリー名を選択してください</h2>  
	<form action="categorydeleteconfirm" method="post">
	<select name="category_name">  
	
	 
	<% 
	for (BookBean book : categoryList) {  
	%>  
	<option><%=book.getCategoryName()%></option> 
	<%} %>
	</select>  

	<input type="submit" value="カテゴリー名削除">  
	</form>
	<form action ="booklist" method="post"> 
	<input type="submit" value="キャンセル">
	</form>
</body>
</html>