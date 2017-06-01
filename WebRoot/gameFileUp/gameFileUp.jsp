<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>MainPage</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="css/mainReset.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="css/mainStyle.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="css/mainGrid.css" type="text/css"
	media="screen">
<link href="css/registJquery.idealforms.min.css" rel="stylesheet"
	media="screen" />
<script type="text/javascript" src="js/login.js"></script>
<link rel="Stylesheet" type="text/css" href="css/loginDialog.css" />
<style type="text/css">
.image {
	float: left;
	padding: 20px 20px 20px 20px;
}

.wrapper {
	font-size: 20px;
}

.input {
	width: 235px;
	height: 30px;
	margin: 8px;
	border: 1px solid #005344;
	background-color:#93b1c7;
	border-radius: 8px;
}

.input:focus {
	color: green;
	background-color: #afdfe4;

}
.file{
	font-size:17px;
}
.submit{
	width: 351px;
	height:30px;
}
</style>

</head>

<body id="page1">
	<!--==============================login=================================-->
	<div id="LoginBox">
		<form action="login" method="post">
			<div class="row1">
				登陆：<a href="javascript:void(0)" title="关闭窗口" class="close_btn"
					id="closeBtn">x</a>
			</div>
			<div class="row">
				用户名: <span class="inputBox"> <input type="text" id="txtName"
					name="user.userName" placeholder="账号/邮箱" /> </span><a
					href="javascript:void(0)" title="提示" class="warning" id="warn">*</a>
			</div>
			<div class="row">
				密&nbsp;&nbsp;&nbsp;&nbsp;码: <span class="inputBox"> <input
					type="password" id="txtPwd" name="user.userPassword"
					placeholder="密码" /> </span><a href="javascript:void(0)" title="提示"
					class="warning" id="warn2">*</a>
			</div>
			<div class="row">
				<input type="submit" value="login" id="loginbtn"></input> <a
					href="user/register.jsp"><input type="button" value="regist"
					id="loginbtn"></input> </a>
			</div>
		</form>
	</div>
	<!--==============================header=================================-->
	<header>
	<div class="main">
		<div class="wrapper">
			<img alt="" src="images/logo.png" height="94px">
			<div class="fright">
				<div class="user">
					<s:if test="#session.user==null">
						<a href="#" id="example">登陆</a>
					</s:if>
					<s:else>
						当前用户：<s:property value="#session.user.userName" />
						<a href="login!logout">退出</a>
					</s:else>
				</div>
				<div>
					<ul class="menu">
						<li><a href="#">官网主页</a>
						</li>
						<li><a class="active" href="gameInfor">游戏资料</a>
						</li>
						<li><a href="charge">充值</a>
						</li>
						<li><a href="combatSearch">战绩查询</a>
						</li>
						<li><a href="interaction">好友信息</a>
						</li>
						<li><a href="personInfor">个人中心</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!--==============================content=================================-->
	<section id="content">
	<center>
		<div class="main">
			<div class="wrapper">
				<h2>上传游戏</h2>
				<form action="gameInfor!gameAdd" method="post"
					enctype="multipart/form-data">
					游戏名称：<input type="text"  class="input" name="gameInfor.gameName"><br>
					游戏标题：<input type="text"  class="input" name="gameInfor.gameTitle"><br>
					游戏介绍：<input type="text"  class="input" name="gameInfor.gameIntroduc"><br>
					游戏版本：<input type="text"  class="input" name="gameInfor.gameVersion"><br>
					出售价格：<input type="text"  class="input" name="gameInfor.gameMoney"
						value="0"><br> 游戏图片：<input type="file"   class="input file" name="image"><br>
					游戏程序：<input type="file" name="game"  class="input file"><br> <input
						type="submit" value="上传"  class="input submit" >
				</form>
			</div>
		</div>
	</center>
	</section> <!--==============================footer=================================-->
	<footer>
	<div class="main">
		<div class="container_12">
			<div class="wrapper">
				<div class="grid_8">
					<div class="aligncenter">
						updateTime &copy; 2017-4-25 <span><a rel="nofollow"
							target="_blank" href="#">Game Plaform</a> | <a rel="nofollow"
							target="_blank" href="#">RZC游戏平台</a> </span>
					</div>
				</div>
				<div class="grid_3 prefix_1">
					<ul class="list-services">
						<li><a href="http://blog.csdn.net/mysticalrzc"></a></li>
						<li class="item-1"><a
							href="https://user.qzone.qq.com/864910691"></a></li>
						<li class="item-2"><a href="https://www.baidu.com/"></a></li>
						<li class="item-3"><a href="https://www.youtube.com/"></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</script>
</body>
</html>