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
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>IdeaBox管理员页面</title>
<link rel="stylesheet"
	href="/ideabox/lib/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/ideabox/lib/bootstrap/css/bootstrap-theme.min.css">
<script src="/ideabox/lib/jquery/jquery-1.11.1.min.js"></script>
<script src="/ideabox/lib/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
		<label class="navbar-brand" href="#">IdeaBox管理员页面</label>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				
				<li><a href="../index.jsp">返回首页</a></li>
				
				<li><a href="。。/admindashboard/AdminBoard4User.jsp"> <s:property value="#session.user.username" /> </a><>	
				<li><a href="/ideabox/index.jsp">登出</a>
				
			</ul>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2 sidebar">
				<ul class="nav nav-pills nav-stacked">
					<li><a href="/ideabox/admindashboard/AdminDashboard!listUser.action">管理注册用户</a>
					<li><a href="/ideabox/admindashboard/AdminDashboard!listQues.action">管理调查问卷</a>
					<li class="active"><a href="/ideabox/userdashboard/EditInformation!view.action?isView=true"> 个人信息</a>
				</ul>
			</div>
			<div class="col-md-10 main">
				<h1 class="page-header">个人信息</h1>
				<form class="form-horizontal" role="form" method='post' action='/ideabox/userdashboard/EditInformation.action?isView=true'>
					<div class="form-group" align="center">
						<!--<label for="email" class="col-xs-2">邮箱</label>
  							<div class="col-xs-4 ">
  							<input type="email" class="form-control" id="email" placeholder="Email" name='email' value='<s:property 
							value="#session.user.email"/>'>
  					<span><s:fielderror fieldName='email'/></span>
  					</div>
  					-->
					</div>
					<div class="form-group">
						<label for="username" class="col-xs-2">用户名</label>
						<div class="col-xs-4">
							<input type="text" class="form-control" id="username" placeholder="Username" name='username' value='<s:property value="#request.username"/>'> 
							<span><s:fielderror fieldName='username' /> </span>
						</div>
					</div>
					<div class="form-group">
						<label for="age" class="col-xs-2">出生日期</label>
						<div class="col-xs-4">
							<input type="date" class="form-control" id="birthdate" placeholder="birthdate" name='birthdate'
								value='<s:property value="#request.birthdate"/>'> 
								<span><s:fielderror fieldName='birthdate' /> </span>
						</div>
					</div>
					
					<input type="hidden"  value="<s:property value='#session.user.gender'/>" / >
					<div class="form-group">
						<label for="gender" class="col-xs-2">性别</label>
						<div class="col-xs-4">
							<div><lable class="radio-inline"> <input type="radio" name="gender" value="female">女</lable>
								<lable class="radio-inline"> <input type="radio" name="gender" value="male">男</lable>
								
							</div><span><s:fielderror fieldName='gender' /> </span>
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-xs-2">请输入密码</label>
						<div class="col-xs-4">
							<input type="password" class="form-control" id="password" placeholder="Password" name='password'> 
							<span><s:fielderror fieldName='password' /> </span>
						</div>
					</div>
					<div class="form-group">
						<label for="passwordConfirm" class="col-xs-2">确认您的密码</label>
						<div class="col-xs-4">
							<input type="password" class="form-control" id="passwordConfirm" placeholder="Password again" name='passwordConfirm'> 
							<span><s:fielderror fieldName='passwordConfirm' /> </span>
						</div>
					</div>
					<p><s:actionerror /></p>
					<div class="form-group">
						<div class="col-xs-offset-2 col-xs-4">
							<button type="submit" class="btn btn-primary col-xs-4">保存</button>
						</div>
					</div>
					
					<s:if test="#request.succ=='true'">

						<script type="text/javascript" language="javascript">
							alert("保存成功");
							//window.document.location.href = "/ideabox/index.jsp";
						</script>

					</s:if>
					
				</form>
				<script >
	$(function() {

var gender = $("input[type='hidden']").val();
$("input[name ='gender'][value='"+gender+"']").attr("checked","true")
	})

</script>
	</div>
	</div>
	</div>

</body>
</html>




