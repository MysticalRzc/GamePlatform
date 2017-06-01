<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>登陆界面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<link rel="Stylesheet" type="text/css" href="css/loginDialog.css" />

</head>
<body>
	<a href="#" id="example">login</a>
	<div id="LoginBox">
		<div class="row1">
			登陆：<a href="javascript:void(0)" title="关闭窗口" class="close_btn"
				id="closeBtn">x</a>
		</div>
		<div class="row">
			用户名: <span class="inputBox"> <input type="text" id="txtName" name="userName"
				placeholder="账号/邮箱" /> </span><a href="javascript:void(0)" title="提示"
				class="warning" id="warn">*</a>
		</div>
		<div class="row">
			密&nbsp;&nbsp;&nbsp;&nbsp;码: <span class="inputBox"> <input
				type="text" id="txtPwd" name="userPassword" placeholder="密码" /> </span><a
				href="javascript:void(0)" title="提示" class="warning" id="warn2">*</a>
		</div>
		<div class="row">
			<a href="#" id="loginbtn">登录</a>
		</div>
	</div>
</body>
</html>
