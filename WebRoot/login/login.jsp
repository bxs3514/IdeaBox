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
<title>ideaBox问卷调查系统 登录界面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="/ideabox/lib/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/ideabox/lib/bootstrap/css/bootstrap-theme.min.css">
<script src="/ideabox/lib/bootstrap/js/bootstrap.min.js"></script>
</head>

<body>
	<div class="container">
		<form class="form-signin" role="form" method='post'
			action='./login/login.action'>
			<div class="form-group" align="center">
				<h2 class="form-signin-heading">登录</h2>
				<input type="email" class="form-control" id="email"
					placeholder="电子邮箱" name='email' required autofocus
					style="width: 500px"> <span><s:fielderror
						fieldName='email' /> </span> <input type="password" class="form-control"
					id="password" placeholder="密码" name='password' required
					style="width: 500px"> <span><s:fielderror
						fieldName='password' /> </span>
			</div>
			<label class="checkbox" style="padding-left: 500px"> <input
				type="checkbox" value="remember-me" name='rememberMe'>
				记住我 </label>
			<div class="form-group" align="center">
				<button class="btn btn-lg btn-primary btn-block" type="submit"
					style="width: 500px">登录</button>
				<a class="btn btn-lg btn-primary btn-block" style="width: 500px"
					href="./signup/signup.jsp">注册</a>
			</div>
		</form>

	</div>
	<!-- /container -->
</body>
</html>
<!-- style="float:middle; width:auto; height:30px; margin:auto" -->
<!-- <div class="form-group"
					style="margin:0 0;text-align:center; height:30px;background-color:red"> -->
<!-- <h2>登录</h2>
	<form class="form-horizontal" role="form" method='post'
		action='./login/login.action'>
		<div class="form-group">
			<label for="email" class="col-xs-2 control-label">用户名</label>
			<div class="col-xs-10">
				<input type="email" class="form-control" id="email"
					placeholder="Email" name='email'> <span><s:fielderror
						fieldName='email' /> </span>
			</div>
		</div>
		<div class="form-group">
			<label for="password" class="col-xs-2 control-label">密码</label>
			<div class="col-xs-10">
				<input type="password" class="form-control" id="password"
					placeholder="Password" name='password'> <span><s:fielderror
						fieldName='password' /> </span>
			</div>
		</div>
		<div class="form-group">
			<div class="col-xs-2"></div>
			<div class="col-xs-1">
				<button type="submit" class="btn btn-primary">登录</button>
			</div>
			<div class="col-xs-2">
				<a class="btn btn-primary" href="./signup/signup.jsp">注册</a>
			</div>
			<div class="col-xs-5"></div>
			<div class="col-xs-2">
				<a class="btn btn-primary" href="./login/login.jsp">以游客身份进入 </a>
			</div>
		</div>
	</form> -->