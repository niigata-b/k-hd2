<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.LendingBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>返却失敗画面</title>
<style>
body {
text-align:center;
}
</style>
</head>
<body>
<h1>貸出・返却管理</h1>
<h1>返却失敗画面</h1>
返却に失敗しました。
<form action ="lendingdetail" method="POST">
<input type ="hidden" name ="isbn" value="<%=lending.getIsbn() %>">
<input type ="hidden" name ="book_name" value="<%=lending.getBookName() %>">
<input type ="hidden" name ="user_id" value="<%=lending.getUserId() %>">
<input type ="hidden" name ="user_name" value="<%=lending.getUserName() %>">
<input type ="hidden" name ="lending_count" value="<%=lending.getLendingCount() %>">
<input type ="hidden" name ="start_date" value="<%=lending.getStartDate() %>">
<input type ="hidden" name ="deadline_date" value="<%=lending.getDeadlineDate() %>">
<input type ="hidden" name ="expired_flag" value="<%=lending.getExpiredFlag() %>">
<input type ="submit" value="貸出情報詳細画面に戻る">
</body>
</html>