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
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<link rel="Stylesheet" type="text/css" href="css/loginDialog.css" />
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">

<style type="text/css">
.container_12 .grid_3 {
    width: 228px;
}
.information {
	width: 290px;
	height: 250px;
	float: left;
	padding: 0px 20px 20px 20px;
	margin: 0px 20px 10px 20px;
}

.addFriend {
	width: 290px;
	height: 250px;
	float: left;
	padding: 0px 20px 20px 20px;
	margin: 0px 20px 10px 20px;
}

.image {
	border: 10px solid;
	border-radius: 25px;
	-moz-border-radius: 25px;
	width: 220px;
	height: 220px;
	-webkit-transition: width 1s, height 1s, margin 1s, -webkit-transform 1s;
}

.image .img-circle {
	margin: 10px 10px 10px 10px;
	-webkit-transition: width 1s, height 1s, -webkit-transform 1s;
}

.information:hover .image {
	margin: -20px 0px 0px -20px;
	width: 270px;
	height: 270px;
}

.information:hover .image .img-circle {
	margin: -20px 10px 10px 10px;
	width: 230px;
	height: 230px;
}

.delete {
	display: none;
	float: right;
}

.information:hover .delete {
	display: block;
}

.friendName {
	text-align: center;
	color: blue;
	font-size: 20px;
}

.information:hover .friendName {
	display: none;
}

.clear {
	clear: 
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
	<!--==============================header========= ========================-->
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
						<li><a href="gameInfor">游戏资料</a>
						</li>
						<li><a href="charge">充值</a>
						</li>
						<li><a href="combatSearch">战绩查询</a>
						</li>
						<li><a class="active" href="interaction">好友信息</a>
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
	<div class="main">
		<s:iterator value="friendList" id="fri">
			<%-- 	${fri.TUserByUserFriendId.userName} --%>
			<div class="information">
				<div class="first">
					<div class="image">
						<a href="interaction!deleteFriend?friendId=${fri.friendId}">
							<img src="images/delete.png" class="delete" width="30px" height="30px"> 
						</a>
						<a href="interaction!friendInfor?friendId=${fri.TUserByUserFriendId.userId}">
							<img class="img-circle"	src="headImage/${fri.TUserByUserFriendId.userImage}"
							width="180px" height="180px">
						</a>
					</div>
					<div class="friendName">${fri.TUserByUserFriendId.userName}</div>
				</div>
			</div>
		</s:iterator>
		<div class="addFriend">
			<div class="image">
				<a href="interaction!toAddFriend"><img alt="" class="img-circle"
					src="images/add.png" width="190px" height="190px">
				</a>
			</div>
			<div class="friendName">添加好友</div>
		</div>
		<div class="clear"></div>
	</div>
	</section> <!--====================================footer=========================================-->
	<footer>
	<div class="main">
		<div class="container_12">
			<div class="wrapper">
				<div class="grid_8">
					<div class="aligncenter">
						Eagles Troops &copy; 2012 <span><a rel="nofollow"
							target="_blank" href="#">Game Plaform</a> | <a rel="nofollow"
							target="_blank" href="#">RZC游戏平台</a> </span>
					</div>
				</div>
				<div class="grid_3 prefix_1">
					<ul class="list-services">
						<li><a href="#"></a></li>
						<li class="item-1"><a href="#"></a></li>
						<li class="item-2"><a href="#"></a></li>
						<li class="item-3"><a href="#"></a></li>
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
