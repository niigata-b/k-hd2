<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>カテゴリ削除画面</title>
<link rel="stylesheet" href="insert.css">
</head>
<body> 
	<% 
	List<BookBean> categoryList = (List<BookBean>) request.getAttribute("categoryList");  
	%>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>カテゴリ削除　　　</h1>
</div>
<br>
<br>
<p class="midasi">削除したいカテゴリ名を選択してください。</p>
<br>
<br>
<br>
<form action="categorydeleteconfirm" method="post">
<span>カテゴリ名：</span>
<select class ="selectcate2" name="category_name">  
	
	<% 
	for (BookBean book : categoryList) {  
	%>  
	<option><%=book.getCategoryName()%></option> 
	<%} %>
	</select>  

	<input class ="bookdeleteform" type="submit" value="カテゴリ名削除">  
	</form>
	<form action ="book-menu.jsp" method="post"> 
	<input class ="returnbookdeteilform" type="submit" value="キャンセル">
	</form>
</body>
</html>