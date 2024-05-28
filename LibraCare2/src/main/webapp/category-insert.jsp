<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
	String messageNull = (String)request.getAttribute("messageNull"); 
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
		<input type="text" name="category_name"> 
		<input type="submit"value="カテゴリー名登録">
	</form>

	<form action="booklist" method="post">
		<input type="submit" value="キャンセル">
	</form>
</body>
</html>