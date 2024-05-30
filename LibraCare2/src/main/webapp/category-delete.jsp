<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h1>カテゴリ削除　　　　　</h1>
</div>

<p class="midasi">削除したいカテゴリ名を選択してください。</p>
<span>カテゴリ名：</span>
<form action="categorydelete" method="post"> 
<select class ="selectcate" name="category_name"> 
	 
<%for (BookBean book : categoryList){ %>  
<option value="<%=category_name %>"</option>  
<%} %>
</select> 
</form> 
<input class ="bookdeleteform" type="submit" value="カテゴリー名削除"> 
	
</body>
</html>