<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.util.List,model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書登録画面</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>
<%
	BookBean book = (BookBean)request.getAttribute("book"); 
 	List<BookBean> categoryList = (List<BookBean>) request.getAttribute("categoryList");  
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
		category_name = book.getCategoryName();
	}
	catch(NullPointerException e)
	{
		category_name = "";
	}
	try
	{
		book_count = 1;
	}
	catch(NullPointerException e)
	{
		book_count = 1;
	}
%>
<h1>図書管理</h1>
<h1>図書情報登録画面</h1>
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

<form action ="bookinsertconfirm" method="POST">
ISBN
<input class ="inputform" type="text" name="isbn" value ="<%=isbn%>" id = "isbn" onchange="isbnJudge()"><br>
図書名
<input class ="inputform" type="text" name="book_name" value ="<%=book_name%>"><br> 

カテゴリ名 
<select name="category_name">  
	<% 
	for (BookBean booka : categoryList) {  
	%>  
	<option><%=booka.getCategoryName()%></option> 
	<%} %>
	</select>  
個数
<input class ="inputform" type="text" name="book_count" value ="<%=book_count%>"><br>

<input type="submit"value="登録">
</form>

<form action ="book-menu.jsp" metod ="POST">
<input type="submit"value="キャンセル">
</form>
</body>

<script>
		function isbnJudge() {
			var isbnJudge = document.getElementById('isbn').value; // HTML要素オブジェクトを取得
			var isbn;
						
			if(isbnJudge.length < 13){
				alert('ISBNは半角数字13桁で入力してください');
				document.getElementById('isbn').value = '';
				
			}else if (isbnJudge.length >= 13){
					isbn = isbnJudge.substr(0,13);
					document.getElementById("isbn").value = isbn;
					
				} 
				
			if (isbnJudge.match(/^[0-9]+$/)) {      
				return true;
				
			} else {
				alert('ISBNは半角数字13桁で入力してください');
				document.getElementById('isbn').value = '';
							
			}
		}
	</script>


</html>