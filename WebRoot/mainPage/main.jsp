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
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
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
					type="password" id="txtPwd" name="user.userPassword" placeholder="密码" /> </span><a
					href="javascript:void(0)" title="提示" class="warning" id="warn2">*</a>
			</div>
			<div class="row">
				<input type="submit" value="login" id="loginbtn"></input>
				<a href="user/register.jsp"><input type="button" value="regist" id="loginbtn"></input></a>
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
						<a href="#" id="example">登录</a>
					</s:if>
					<s:else>
						当前用户：<s:property value="#session.user.userName"/>
						<a href="login!logout">退出</a>
					</s:else>
				</div>
				<div>
					<ul class="menu">
						<li><a class="active" href="#">官网主页</a>
						</li>
						<li><a href="gameInfor">游戏资料</a>
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
	<div class="row-bot">
		<div class="main">
			<figure class="img-indent-r"> <img
				src="images/page1-img1.png" alt="" width="350px"/></figure>
			<div class="extra-wrap indent">
				<strong class="title-1">泳池神秘商店限时五折</strong>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;夏日炎炎，还在树荫下
				乘凉吗?赶快参加泳池派对，一起尽享夏日风情吧，五折优惠，机不可失，时不再来！！</p>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;两款限时游戏，
				限时5折优惠，炎炎夏日和舍友一起哈皮，购买任意游戏一款还有表白exe赠送偶！！</p>
				<a class="button2" href="gameInfor">more</a>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	</header>

	<!--==============================content================================-->
	<section id="content">
	<div class="main">
		<div class="container_12">
			<div class="wrapper p3">
				<article class="grid_4">
				<div class="banner">
					<figure> <img src="images/ballGame.png" width="280px" height="190px" alt="" /></figure>
					<a class="button" href="gameInfor">more</a>
				</div>
				</article>
				<article class="grid_4">
				<div class="banner">
					<figure> <img src="images/jigsaw.png" width="280px" height="190px" alt="" /></figure>
					<a class="button" href="gameInfor">more</a>
				</div>
				</article>
				<article class="grid_4">
				<div class="banner">
					<figure> <img src="images/showLove.png" width="280px" height="190px" alt="" /></figure>
					<a class="button" href="gameInfor">more</a>
				</div>
				</article>
			</div>
			<div class="wrapper">
				<article class="grid_8">
				<h2>桌面台球</h2>
				<div class="wrapper border-bot p3">
					<time class="tdate-1" datetime="2012-10-21"> <span>Tuesday</span>
					<strong>31</strong> </time>
					<div class="extra-wrap">
						<p class="prev-indent-bot">
							<span class="color-1">桌面台球，宿舍局域，没事捣两盘</span> <br>
							大学生活你感觉到空虚了吗？大学生活，你感觉到疲惫了吗？那就赶快下载桌面台球
							游戏吧，局域网游戏，一个局域，宿舍畅玩，无收费，无弹窗，干净简洁的小游戏，
							快来游戏吧，让你和舍友一决高下。
						</p>
						<p>不要犹豫!</p>	
						<p>速速来战!</p>	
						<a class="button2" href="gameInfor">more</a>
					</div>
				</div>
				<div class="wrapper">
					<time class="tdate-1" datetime="2012-10-21"> <span>Monday</span>
					<strong>23</strong> </time>
					<div class="img-indent">
						<p class="p3">
							<img src="images/caocao.jpg" alt="" width="250px">
						</p>
						<a class="button2" href="gameInfor">more</a>
					</div>
					<div class="extra-wrap">
						<span class="color-1">One piece 智力拼图</span>
						<p>学习是不是学累了?玩游戏时不时玩烦了？是时候伸个懒腰喽~</p>
						<p>休闲娱乐来一盘，ONE　PIECE 智力拼图，休闲娱乐，转换思路，可谓是休闲的最佳之选。</p>
					</div>
				</div>
				</article>
				<article class="grid_4">
				<div class="indent-top">
					<h3 class="indent-bot">战况速报</h3>
					<div class="indent-left p3">
						<ul class="list-2">
							<li><a href="gameInfor">台球游戏，激情上线</a>
							</li>
							<li><a href="gameInfor">桌面台球删档内测，领取激活码</a>
							</li>
							<li><a href="gameInfor">台球游戏不删档公测，领取激活码</a>
							</li>
							<li><a href="gameInfor">拼图游戏一周年，显示6折优惠</a>
							</li>
						</ul>
					</div>
					<div class="box">
						<div class="padding">
							<strong class="text-1">vip专属exe</strong>
							<figure class="p2"> <img src="images/girl.jpg" alt="" width = "260px"></figure>
							<h6>
								<strong>优惠开通时间每天 6:00 - 18:00</strong>
							</h6>
							在每天该时间段开通vip尽享8.8折优惠，还有专属exe赠送偶~
						</div>
					</div>
				</div>
				</article>
			</div>
		</div>
	</div>
	</section>
	<!--==============================footer=================================-->
	<footer>
	<div class="main">
		<div class="container_12">
			<div class="wrapper">
				<div class="grid_8">
					<!-- <div class="aligncenter">
							updateTime &copy; 2017-4-25 <span><a rel="nofollow"
							target="_blank" href="#">Game Plaform</a> | <a rel="nofollow" target="_blank"
							href="#">RZC游戏平台</a> </span>
					</div> -->
					<div class="aligncenter">
							软工1404-任仲臣、马露露<span><a rel="nofollow"
							target="_blank" href="#">20142203605</a> | <a rel="nofollow" target="_blank"
							href="#">20142203638</a> </span>
					</div>
				</div>
				<div class="grid_3 prefix_1">
					<ul class="list-services">
						<li><a href="http://blog.csdn.net/mysticalrzc"></a>
						</li>
						<li class="item-1"><a href="https://user.qzone.qq.com/864910691"></a>
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
	</footer>
	<script type="text/javascript">
		Cufon.now();
	</script>
</body>
</html>
