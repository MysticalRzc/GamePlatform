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
<link href="css/base.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/help.css" />
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<link rel="Stylesheet" type="text/css" href="css/loginDialog.css" />


<style type="text/css">
.main{
	color: white; 
}
.content{
	font-size: 20px;
}
.money{
	text-align: center;
}
</style>
<script type="text/javascript">
$(document).ready(function(e) {
    $(".fwmc_xxk li").click(function(){
		$(this).addClass("on").siblings().removeClass("on");
		tola();
		});
	//加
	$(".jia").click(function(){
		var fw_numb = $(".srkk").val();	
		fw_numb++;
		$(".srkk").val(fw_numb);		
		tola();
		})
		
	//减
	$(".jian").click(function(){
		var fw_numb = $(".srkk").val();	
		if(fw_numb <= 1){
			alert("数量不足了，请住手！")
			}else{
		fw_numb--;
		$(".srkk").val(fw_numb);		
			}
		tola();
		})	
});

function tola(){
		var $li = $(".fwmc_xxk").children("li.on");
		var money = $li.children("i").text();
		var count = $(".srkk").val();
		$(".zwfb_zje span").text(money*count);
		document.getElementById("moneySub").setAttribute("href","charge!chargeAdd?chargeMoney="+money*count); 
}

</script>
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
						<li><a href="gameInfor">游戏资料</a>
						</li>
						<li><a class="active" href="charge">充值</a>
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
	<div class="main">
		<div class="content">
			<div class="money">
				账户余额<s:property value='charge.ChargeMoneyNow' />￥
			</div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="zwfb_shop_table">
				<tr valign="top">
					<td align="right" width="70">服务名称：</td>
					<td><ul class="fwmc_xxk">
							<li class="on">
								<p>充值券</p> <i>10</i>元</li>
							<li>
								<p>充值券</p> <i>20</i>元</li>
							<li>
								<p>充值券</p> <i>50</i>元</li>
							<li>
								<p>充值券</p> <i>100</i>元</li>
							<li>
								<p>充值券</p> <i>200</i>元</li>
							<li>
								<p>充值券</p> <i>500</i>元</li>
						</ul>
					</td>
				</tr>
				<tr>
					<td height="20"></td>
					<td></td>
				</tr>
				<tr>
					<td align="right">购买数量：</td>
					<td><ul class="nmb_jj">
							<li class="jian">-</li>
							<li><input name="" type="text" value="1" class="srkk" /></li>
							<li class="jia">+</li>
						</ul>
					</td>
				</tr>
				<tr>
					<td height="20"></td>
					<td></td>
				</tr>
				<tr>
					<td align="right">价格：</td>
					<td><div class="zwfb_zje">
							<span>10</span> <i>元</i>
						</div>
					</td>
				</tr>
				<tr>
					<td height="20"></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td><a id="moneySub" class="ty_but ml20" href="charge!chargeAdd?chargeMoney=10">购 买</a>
					</td>
				</tr>
			</table>
			<div class="gmxz_tip">
				购买须知：
				<p>1.当一次性充值超过100元，游戏玩家即可升级为VIP特权游戏玩家</p>
				<p>2.享有VIP特权玩家可获得购买游戏8折优惠</p>
			</div>
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
	</footer> <script type="text/javascript">
		Cufon.now();
	</script>
</body>
</html>