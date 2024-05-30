<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.util.List,model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書登録画面</title>
<link rel="stylesheet" href="insert.css">
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
	try {
		isbn = book.getIsbn();
	} catch(NullPointerException e) {
		isbn = "";
	} try {
		book_name = book.getBookName();
	} catch(NullPointerException e) {
		book_name = "";
	} try {
		category_name = book.getCategoryName();
	} catch(NullPointerException e) {
		category_name = "";
	} try {
		book_count = 1;
	} catch(NullPointerException e) {
		book_count = 1;
	}
%>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>図書登録　　　　　</h1>
</div>
<br>
<p class="midasi">登録したい図書情報を入力してください。</p>
<%
try {
if(!(messageNull.equals(null))) {
%>
<p class="error"><%=messageNull %></p>
<%
}
}catch(NullPointerException e)
{
}
%>

<form action ="bookinsertconfirm" method="POST">
<span>ISBN：</span>
<input class ="inputform" type="text" name="isbn" value ="<%=isbn%>" id = "isbn" onchange="isbnJudge()"><br>
<span>図書名：</span>
<input class ="inputform" type="text" name="book_name" value ="<%=book_name%>"><br>
<span id ="categoryname">カテゴリ名 :</span>
<select class ="selectcate" name="category_name">  
<option><%=category_name%></option> 
<% 
	for (BookBean booka : categoryList) {  
%>  
<option><%=booka.getCategoryName()%></option> 
	<%} %>
</select> 
<br>
<br>
<%
try {
if(!(messageNum.equals(null))) {
%>
<p class="error"><%=messageNum %></p>
<%
}
}catch(NullPointerException e)
{
}
%>
<span>個数：</span>
<input class ="inputform" type="text" name="book_count" value ="<%=book_count%>"><br>
<input class ="bookinsertform" type="submit"value="登録">
</form>

<form action ="book-menu.jsp" metod ="POST">
<input class ="returnbookmenuform" type="submit"value="キャンセル">
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