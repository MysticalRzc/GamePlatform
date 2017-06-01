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

<title>My JSP 'register.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="css/registJquery.idealforms.min.css" rel="stylesheet"
	media="screen" />

<style type="text/css">
body {
	font: normal 15px/1.5 Arial, Helvetica, Free Sans, sans-serif;
	color: #222;
	background: url(pattern.png);
	overflow-y: scroll;
	padding: 60px 0 0 0;
}

#my-form {
	width: 755px;
	margin: 0 auto;
	border: 1px solid #ccc;
	padding: 3em;
	border-radius: 3px;
	box-shadow: 0 0 2px rgba(0, 0, 0, .2);
}

#comments {
	width: 350px;
	height: 100px;
}

.headImage {
	height: 0px;
	float: right;
	z-index: 999;
	margin: -25px 69px 0px 0px;
	s
}
</style>
</head>
<body>
	<s:fielderror />
	<div class="eightcol last">
		<!-- Begin Form -->
		<form id="my-form" action="changeInfor" method="post"  enctype="multipart/form-data">
			<div>
				<label>邮箱:</label><input name="user.userEmail"
					data-ideal="required email"
					value='<s:property value="user.userEmail"/>' type="email" />
			</div>
			<div>
				<label>手机号:</label><input name="user.userPhone"
					value='<s:property value="user.userPhone"/>' type="text" />
			</div>
			<div>
				<label>出生日期:</label> <input name="user.userBirth"
					value="<s:property value="birth"/>" type="date" />
			</div>
			<div class="headImage">
				<img alt="" src="headImage\<s:property value="user.userImage"/>" height="200px" width="200px">
			</div>
			<div>
				<label>上传头像:</label>
				<input type="file" name="image">
			</div>
			<div>
				<label>备注:</label>
				<textarea name="user.userInfor"><s:property value="user.userInfor" /></textarea>
			</div>
			</section>
			<div>
				<hr />
			</div>
			<div>
				<!-- <button type="submit">提交</button> -->
				<input type="submit" value="提交">
				<button id="reset" type="button">重置</button>
			</div>
		</form>
	</div>
	</div>

	<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="js/jquery.idealforms.js"></script>
	<script type="text/javascript">
		var options = {
			onFail : function() {
				alert($myform.getInvalid().length + '条信息输入有误')
			},
			inputs : {
				'user.userPassword' : {
					filters : 'required pass',
				},
				'user.userName' : {
					filters : 'required username',
					data : {
					//ajax: { url:'validate.php' }
					}
				},
				'file' : {
					filters : 'extension',
					data : {
						extension : [ 'jpg' ]
					}
				},
				'comments' : {
					filters : 'min max',
					data : {
						min : 50,
						max : 200
					}
				},
				'states' : {
					filters : 'exclude',
					data : {
						exclude : [ 'default' ]
					},
					errors : {
						exclude : '选择国籍.'
					}
				},
				'langs[]' : {
					filters : 'min max',
					data : {
						min : 2,
						max : 3
					},
					errors : {
						min : 'Check at least <strong>2</strong> options.',
						max : 'No more than <strong>3</strong> options allowed.'
					}
				}
			}

		};
		var $myform = $('#my-form').idealforms(options).data('idealforms');
		$('#reset').click(function() {
			$myform.reset().fresh().focusFirst()
		});
		$myform.focusFirst();
	</script>
</body>
</html>
