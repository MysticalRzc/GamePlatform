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
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.pager.js" type="text/javascript"></script>
<script type="text/javascript" src="js/login.js"></script>
<link rel="Stylesheet" type="text/css" href="css/loginDialog.css" />

<style type="text/css">
.container_12 .grid_3 {
    width: 228px;
}
.table {
	color: orange;
}

.content {
	height: 300px;
}
</style>
<style type="text/css">
body {
	margin: 0;
	background: url(images/01.jpg) repeat center;
	font-size: 12px;
}

h1,p {
	margin: 0;
}

ul {
	padding: 0;
	margin: 0;
	list-style: none;
}
/* demo */
.demo {
	margin-left:250px;
	text-align:center; 
	width: 800px;
}

#result {
	font-size: 24px;
	font-family: '微软雅黑', '宋体';
	color: #333;
	margin: 0;
	font-weight: normal;
}

#pager ul.pages {
	padding-top: 20px;
	height: 40px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-mz-user-select: none;
	-o-user-select: none;
}

#pager ul.pages li {
	float: left;
	border: 1px solid #ddd;
	background: #fff;
	margin: 0 5px 0 0;
	padding: 5px 8px;
}

#pager ul.pages li:hover {
	border: 1px solid #ec9db1;
	background: #fff2f5;
}

#pager ul.pages li.pgEmpty {
	border: 1px solid #eee;
	color: #999;
}

#pager ul.pages li.pgCurrent {
	border: 1px solid #ec97ab;
	color: #555;
	font-weight: 700;
	background-color: #f8e8ec;
}

.txt {
	padding-top: 5px;
	font-size: 14px;
	font-family: Arial, Times New Roman;
}

.txt b {
	margin-left: 5px;
	color: #f60;
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
						<li><a href="#">官网主页</a></li>
						<li><a href="gameInfor">游戏资料</a></li>
						<li><a href="charge">充值</a></li>
						<li><a class="active" href="combatSearch?firstPage=0">战绩查询</a></li>
						<li><a href="interaction">好友信息</a></li>
						<li><a href="personInfor">个人中心</a></li>
					</ul>
				</div>
			</div>

		</div>
	</div>
	<!--==============================content=================================-->
	<section id="content">
	<div class="main">
		<div class="content">
			<table class="table table-bordered table-hover ">
				<thead>
					<tr>
						<th>#</th>
						<th>游戏名称</th>
						<th>游戏时间</th>
						<th>结果</th>
						<th>评分</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="combatList" id="comb" status="index">
						<tr>
							<td><s:property value="#index.index+1" /></td>
							<td><s:property value="TGame.gameName" />
							</td>
							<td><s:property value="combateTime" />
							</td>
							<td><s:property value="combateResult" />
							</td>
							<td><s:property value="combateScore" />
							</td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
			<div class="demo">
				<div id="pager"></div>
			</div>
			<script src="js/jquery.min.js" type="text/javascript"></script>
			<script src="js/jquery.pager.js" type="text/javascript"></script>
			<script type="text/javascript">
				$(function() {
					$("#pager").pager({
						pagenumber : "${firstPage}"/7+1,
						pagecout : 5,
						buttonClickCallback : PageClick
					});

				});
				PageClick = function(pageclickednumber) {
					$("#pager").pager({
						pagenumber : pageclickednumber,
						pagecount : 5,
						buttonClickCallback : PageClick
					});
					window.location.href="combatSearch?firstPage="+(pageclickednumber-1)*7;
				}
			</script>
		</div>
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
