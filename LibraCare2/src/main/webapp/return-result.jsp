<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "model.entity.LendingBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>返却確定画面</title>
<link rel="stylesheet" href="insert.css">
</head>
<body>
<%
	LendingBean lending = (LendingBean)request.getAttribute("lending");
%>
<div class ="subdiv">
<img class ="submenu" src="6.png" width ="300px">
<h1>返却確定　　　　　</h1>
</div>
<br>
<p class="midasi">以下の内容を返却しました。</p>
<span>　　ISBN：</span>
<input class ="inputform"type="text" name ="admin_id" value="<%=lending.getIsbn() %>" readonly><br>
<span>ユーザID：</span>
<input class ="inputform"type="text" name ="admin_id" value="<%=lending.getUserId() %>" readonly><br>
<span>ユーザ名：</span>
<input class ="inputform"type="text" name ="admin_id" value="<%=lending.getUserName() %>" readonly><br>
<span>　貸出数：</span>
<input class ="inputform"type="text" name ="admin_id" value="<%=lending.getLendingCount() %>" readonly><br>

<form action ="lendinglist" method="POST">
<input class ="bookdeleteform" type ="submit" value="貸出情報一覧画面に戻る">
</form>
</body>
</html>