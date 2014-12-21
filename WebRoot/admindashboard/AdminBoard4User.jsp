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

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>IdeaBox管理员页面</title>

<!-- Bootstrap core CSS -->
<link href="../../dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="dashboard.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="../../assets/js/ie-emulation-modes-warning.js"></script>

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="/ideabox/lib/bootstrap/css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet"
	href="/ideabox/lib/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/ideabox/lib/jquery/jquery-1.11.1.min.js"></script>
<script src="/ideabox/lib/bootstrap/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="navbar navbar-inverse " role="navigation">
		<label class="navbar-brand" href="#">IdeaBox管理员页面</label>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/ideabox/index.jsp">返回首页</a>
				</li>
				
				<li><a href="../login/logout.action">登出<s:property value="#session.user.username" /></a>
				<li><a href="#"></a>
				</li>
			</ul>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2 sidebar">
				<ul class="nav nav-sidebar">

					<li><a
						href="/ideabox/admindashboard/AdminDashboard!listUser.action">管理注册用户</a>
					</li>
					<li><a
						href="/ideabox/admindashboard/AdminDashboard!listQues.action">管理调查问卷</a>
					</li>
					<li><a
						href="/ideabox/userdashboard/EditInformation!view.action?isView=true">
							个人信息</a>
				</ul>
			</div>
			<div class="col-md-10 main">
				<h1 class="page-header">注册用户列表</h1>
				<div class="table-responsive">
					<label>当前注册用户数目：<s:property value="request.userNum" /> </label> <label>&nbsp;&nbsp;&nbsp;今日新增用户数目：<s:property
							value="request.user2DNum" /> </label>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>uid</th>
								<th>用户名</th>
								<th>电子邮件</th>
								<th>性别</th>
								<th>年龄</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="#request.users" status="index">
								<tr>
									<td><s:property value="uid" /></td>
									<td><s:property value="username" />
									</td>
									<td><s:property value="email" /></td>
									<td><s:property value="gender" />
									</td>
									<td><s:property value="age" /></td>
									<td><a
										href='/ideabox/admindashboard/AdminDashboard!deleteUser.action?uid=
										<s:property value="uid"/>'
										class='btn btn-danger'>删除</a>
									</td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="../../dist/js/bootstrap.min.js"></script>
	<script src="../../assets/js/docs.min.js"></script>
</body>
</html>

