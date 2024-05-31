<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書個数変更確認画面</title>
<link rel="stylesheet" href="insert.css">
</head>
<body>
<%
	BookBean book = (BookBean)request.getAttribute("book");
%>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>図書個数変更確認　　　</h1>
</div>
<br>

<p class="midasi">以下の内容で変更します。よろしいですか？</p>
<form action ="bookupdate" method="POST">
<span>ISBN：</span>
<input class ="inputform" type="text" name ="isbn" value="<%=book.getIsbn() %>" readonly>
<span>図書名：</span>
<input class ="inputform" type="text" name ="book_name" value="<%=book.getBookName() %>" readonly><br>
<span>総個数：</span>
<input class ="inputform" type="text" name ="total_book_count" value="<%=book.getTotalBookCount() %>" readonly>
<span>個数：</span>
<input class ="inputform" type="text" name ="book_count" value="<%=book.getBookCount() %>" readonly><br>
<h2>から</h2>
<% 
if(book.getHuyasu() != 0) {
%>
<input class ="inputform" type="text" name ="huyasu" value ="<%=book.getHuyasu() %>">
<span>個増やします。</span><br>
<%
} else if(book.getHerasu() != 0) {
%>
<input class ="inputform" type="text" name ="herasu" value ="<%=book.getHerasu() %>">
<span>個減らします。</span>
<%
}
%>
<br>
<input class ="bookdeleteform" type ="submit" value="変更確定">
</form>

<form action ="bookupdateconfirm" method = "POST">
<input type ="hidden" name ="isbn" value ="<%=book.getIsbn() %>">
<input type ="hidden" name ="book_name" value ="<%=book.getBookName() %>">
<input type ="hidden" name ="book_count" value ="<%=book.getBookCount() %>">
<input type ="hidden" name ="total_book_count" value ="<%=book.getTotalBookCount() %>">
<input type="hidden" name ="huyasu" value ="<%=book.getHuyasu() %>">
<input type="hidden" name ="huyasu" value ="<%=book.getHuyasu() %>">
<input type ="hidden" name ="cancel" value = 1>
<input class ="returnbookdeteilform" type ="submit" value="キャンセル">
</form>
</body>
</html>