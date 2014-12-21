<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <header class="navbar navbar-inverse headroom"
		id="ideaboxnav" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">IdeaBox</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="/ideabox/questionnaire/QuestionList.action"
					class="navbar-link">参与问卷</a></li>
				<li><a href="#" class="navbar-link">联系我们</a></li>
			</ul>
			<div class="navbar-collapse collapse">
				<form class="navbar-form navbar-right" role="form">

					
					<a class="btn btn-success" href="/ideabox/login/login.jsp"> 登录</a>
					
				</form>
			</div>
			<!--/.navbar-collapse -->
		</div>
	</header>
	
    <base href="<%=basePath%>">
    
    <title>Sign up</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="/ideabox/lib/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/ideabox/lib/bootstrap/css/bootstrap-theme.min.css">
	<script src="/ideabox/lib/bootstrap/js/bootstrap.min.js"></script>

  </head>
  
  <body>
  	<div class='form-container'>
  		<h2 align="center">注册</h2>
  		<form class="form-horizontal" role="form" method='post' action='./signup/signup.action'>
  			<div class="form-group"  align="center">
  				<label for="email" class="col-xs-2 control-label col-xs-offset-3">邮箱</label>
  				<div class="col-xs-2 ">
  					<input type="email" class="form-control" id="email" placeholder="Email" name='email'>
  					<span><s:fielderror fieldName='email'/></span>
  				</div>
  			</div>
  			<div class="form-group">
  				<label for="username" class="col-xs-2 control-label col-xs-offset-3">用户名</label>
  				<div class="col-xs-2">
  					<input type="text" class="form-control" id="username" placeholder="User name" name='username'>
  					<span><s:fielderror fieldName='username'/></span>
  				</div>
  			</div>
  			
  			<div class="form-group">
  				<label for="password" class="col-xs-2 control-label col-xs-offset-3">请输入密码</label>
  				<div class="col-xs-2">
  					<input type="password" class="form-control" id="password" placeholder="Password" name='password'>
  					<span><s:fielderror fieldName='password'/></span>
  				</div>
  			</div>
  			<div class="form-group">
  				<label for="passwordConfirm" class="col-xs-2 control-label col-xs-offset-3">确认您的密码</label>
  				<div class="col-xs-2">
  					<input type="password" class="form-control" id="passwordConfirm" placeholder="Password again" name='passwordConfirm'>
  					<span><s:fielderror fieldName='passwordConfirm'/></span>
  				</div>
  			</div>
  			<p><s:actionerror/></p>
  			<div class="form-group">
  				<div class="col-xs-offset-5 col-xs-10 ">
  					<button type="submit" class="btn btn-primary col-xs-2" style="width:200px">注册</button>
  				</div>
  			</div>
  		<form>

  	</div>
  </body>
</html>
