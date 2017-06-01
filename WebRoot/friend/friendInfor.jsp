
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

<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/mainReset.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="css/mainGrid.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="css/persionInfor.css" type="text/css"
	media="screen">
<script type="text/javascript" src="js/login.js"></script>
<link rel="Stylesheet" type="text/css" href="css/loginDialog.css" />

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
						<li><a href="#">官网主页</a></li>
						<li><a href="gameInfor">游戏资料</a></li>
						<li><a href="charge">充值</a></li>
						<li><a href="combatSearch">战绩查询</a></li>
						<li><a class="active" href="interaction">好友信息</a></li>
						<li><a href="personInfor">个人中心</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!--==============================content=================================-->
	<section id="content">
	<div class="main">
		<div class="headImage">
			<img alt="" class="img-thumbnail"
				src="headImage/<s:property value="user.userImage"/>"
				height="200px" width="200px">
		</div>
		<div class="persionInfor">
			<table>
				<tr>
					<!-- class="label label-infod" -->
					<td width="50px">昵&nbsp;称：</td>
					<td class="infor"><s:property value="user.userName" /></td>
				</tr>
				<tr>
					<td><span>签&nbsp;名: </span>
					</td>
					<td class="infor"><s:property value="user.userInfor" />
					</td>
				</tr>
				<s:iterator value="relateList" id="re">
					<tr>
						<td><span>游&nbsp;戏: </span>
						</td>
						<td>${re.TGame.gameName}</td>
						<td>离&nbsp;线</td>
					</tr>
				</s:iterator>
			</table>
		</div>
		<div class="clear"></div>
	</div>
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
						<li><a href="http://blog.csdn.net/mysticalrzc"></a>
						</li>
						<li class="item-1"><a
							href="https://user.qzone.qq.com/864910691"></a>
						</li>
						<li class="item-2"><a href="https://www.baidu.com/"></a>
						</li>
						<li class="item-3"><a href="https://www.youtube.com/"></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</footer> <script type="text/javascript">
		Cufon.now();
	</script>
</body>
</html>
