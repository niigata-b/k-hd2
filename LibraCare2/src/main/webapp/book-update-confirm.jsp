<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書個数変更確認画面</title>
<style>
body {
text-align:center;
}
</style>
</head>
<body>
<%
	BookBean book = (BookBean)request.getAttribute("book");
%>
<h2>図書管理</h2>
<h1>図書個数変更確認画面</h1>
以下の内容で変更します。<br>
よろしいですか？

<form action ="bookupdate" method="POST">
ISBN：<input type="text" name ="isbn" value="<%=book.getIsbn() %>" readonly><br>
図書名：<input type="text" name ="book_name" value="<%=book.getBookName() %>" readonly><br>
総個数：<input type="text" name ="total_book_count" value="<%=book.getTotalBookCount() %>" readonly><br>
個数：<input type="text" name ="book_count" value="<%=book.getBookCount() %>" readonly><br>
から
<% 
if(book.getHuyasu() != 0) {
%>
<input type="text" name ="huyasu" value ="<%=book.getHuyasu() %>">個増やします。<br>
<%
} else if(book.getHerasu() != 0) {
%>
<input type="text" name ="herasu" value ="<%=book.getHerasu() %>">個減らします。<br>
<%
}
%>
<br>
<input type ="submit" value="図書個数変更確定">
</form>
<form action ="bookupdateconfirm" method = "POST">
<input type ="hidden" name ="isbn" value ="<%=book.getIsbn() %>">
<input type ="hidden" name ="book_name" value ="<%=book.getBookName() %>">
<input type ="hidden" name ="book_count" value ="<%=book.getBookCount() %>">
<input type ="hidden" name ="total_book_count" value ="<%=book.getTotalBookCount() %>">
<input type="hidden" name ="huyasu" value ="<%=book.getHuyasu() %>">
<input type="hidden" name ="huyasu" value ="<%=book.getHuyasu() %>">
<input type ="hidden" name ="cancel" value = 1>
<input type ="submit" value="キャンセル">
</form>
</body>
</html>