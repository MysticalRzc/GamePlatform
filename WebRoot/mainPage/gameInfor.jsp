<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<!-- <link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<link rel="Stylesheet" type="text/css" href="css/loginDialog.css" />
<link rel="stylesheet" href="css/mainReset.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="css/mainStyle.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="css/mainGrid.css" type="text/css"
	media="screen">
<style type="text/css">
.image {
	float: left;
	padding: 20px 20px 20px 20px;
}

.gameUp {
	text-align: center;
}
</style>
<script type="text/javascript">
   function buyGame(id) {  
        //利用对话框返回的值 （true 或者 false）  
        if (confirm("请确认购买？")) {
        	//alert("gameInfor!gameBuy?gameId="+id);
        	window.location.href="gameInfor!gameBuy?gameId="+id;
        }  
        else {  
        	window.location.href="gameInfor";
        }  
    }    
    function deleteGame(id) {  
        //利用对话框返回的值 （true 或者 false）  
        if (confirm("请确认删除该游戏？")) {  
        	window.location.href="gameInfor!gameDelete?gameId="+id;
        }  
        else {  
        	window.location.href="gameInfor";
        }  
    }  
</script>

</head>

<body id="page1" onload="myfunction()">
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
						<a href="#" id="example">登录</a>
					</s:if>
					<s:else>
						当前用户：<s:property value="#session.user.userName" />
						<a href="login!logout">退出</a>
					</s:else>
				</div>
				<div>
					<ul class="menu">
						<li><a href="#">官网主页</a></li>
						<li><a class="active" href="gameInfor">游戏资料</a></li>
						<li><a href="charge">充值</a></li>
						<li><a href="combatSearch">战绩查询</a></li>
						<li><a href="interaction">好友信息</a></li>
						<li><a href="personInfor">个人中心</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</header>
	<!--==============================content=================================-->
	<section id="content">
	<div class="main">

		<s:if test="#session.user.userType==2">
			<div class="gameUp">
				<a class="button2" href="<%=path%>/gameFileUp/gameFileUp.jsp">GameUpLoad</a>
			</div>
		</s:if>
		<s:iterator value="gameList" id="game">
			<div class="wrapper">
				<article class="grid_8">
				<h2>
					<s:property value="gameName" />
				</h2>
				<div class="wrapper border-bot p3">
					<div class="image">
						<img alt="" src="images/<s:property value='gameImage'/>"
							width="280px" height="190px">
					</div>
					<div class="extra-wrap">
						<p class="prev-indent-bot">
							<span class="color-1"><s:property value="gameTitle" /> </span> <br>
							<s:property value="gameIntroduc" />
						</p>
						<p>
							费用：
							<s:property value="gameMoney" />
							<s:if test="#session.user.userType==1">
								购买相寿8折优惠
							</s:if>
						</p>
						<script type="text/javascript">
							$(function() {
								alert("hello world");
							});
						</script>
						<%-- <a class="button2" href="game/<s:property value="gamePath"/>">download</a> --%>
						<a class="button2" href="gameInfor!gameDownload?gameId=<s:property value='gameId'/>">download</a>
						<s:if test="#session.user.userType==2">
							<a class="button2"
								onclick="deleteGame(<s:property value='gameId'/>)">delete</a>
						</s:if>
						<s:else>
							<a id="<s:property value="gameId"/>" class="button2"
								onclick="buyGame(<s:property value='gameId'/>)">buy</a>
						</s:else>
					</div>
				</div>
				</article>
			</div>
		</s:iterator>
	</div>
	</section>
	<!--==============================footer=================================-->
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
	</script>
</body>
</html>