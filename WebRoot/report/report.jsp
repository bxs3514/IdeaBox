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

<title>Report</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="/ideabox/lib/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/ideabox/lib/bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="/ideabox/report/report.css">
<script src="/ideabox/lib/jquery/jquery-1.11.1.min.js"></script>
<script src="/ideabox/lib/bootstrap/js/bootstrap.min.js"></script>
<script src="/ideabox/lib/underscore.string/underscore.string.min.js"></script>
<script src="/ideabox/lib/jquery.sprintf/jquery.sprintf.js"></script>
<script src="/ideabox/lib/chart/Chart.min.js"></script>
<script src="/ideabox/report/show.js"></script>
</head>

<body>
	<header class="navbar navbar-inverse navbar-fixed-top headroom"
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
				<li><a href="/ideabox/contact/contact.jsp" class="navbar-link">联系我们</a></li>
				<li><a href="/ideabox/questionnaire/QuesTitle.jsp">创建问卷</a>
				</li>
			</ul>
			<s:if test="#session.user == null">
				<div class="navbar-collapse collapse">
					<form action="./login/login.action"
						class="navbar-form navbar-right" role="form">
						<div class="form-group">
							<input type="text" name="email" placeholder="Email"
								class="form-control">
						</div>
						<div class="form-group">
							<input type="password" name="password" placeholder="密码"
								class="form-control">
						</div>
						<button type="submit" class="btn btn-success">登录</button>
						<a class="btn btn-success" href="/ideabox/signup/signup.jsp">
							注册</a>
					</form>
				</div>
			</s:if>
			<!--/.navbar-collapse -->
			<s:else>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-right navbar-nav">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><s:property
									value="#session.user.Username" /> <span class="caret"></span>
						</a>
							<ul class="dropdown-menu" role="menu">
								<s:if test="#session.user.Uid != 1">

									<li><a
										href="/ideabox/userdashboard/UserDashboard!listAnswered.action">已回答的问卷</a>
									</li>
									<li class="divider"></li>
									<li><a
										href="/ideabox/userdashboard/UserDashboard!listPublished.action">已发布的问卷</a>
									</li>

									<li class="divider"></li>
									<li><a
										href="/ideabox/userdashboard/EditInformation!view.action">个人信息管理</a>
									</li>
									<li class="divider"></li>
									<li><a href="./login/logout.action">登出</a></li>
								</s:if>
								<s:else>
									<li><a
										href="/ideabox/admindashboard/AdminDashboard!listUser.action">管理用户</a>
									</li>
									<li class="divider"></li>
									<li><a
										href="/ideabox/admindashboard/AdminDashboard!listQues.action">管理问卷</a>
									</li>

									<li class="divider"></li>
									<li><a
										href="/ideabox/userdashboard/EditInformation!view.action">个人信息管理</a>
									</li>
									<li class="divider"></li>
									<li><a href="./login/logout.action">登出</a></li>
								</s:else>
							</ul>
						</li>
					</ul>
				</div>
			</s:else>
		</div>
	</header>

	
	<div id='report-pane'>
		<!--  
		<div id="answer" class="row question">
			<p class="question-body">this is question</p>
			<div class="col-xs-6">
				<canvas width="400" height="400" class="question-graph" id="graph"
					style="width: 400px; height: 400px;"></canvas>
			</div>
			<div class="question-items col-xs-6">
				<table class="table table-bordered">
					<thead>
						<tr>
							<td>序号</td>
							<td>选项</td>
							<td>小计</td>
							<td>比例</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>aaaaaaaaaaaaa</td>
							<td>200</td>
							<td>50%</td>
						</tr>
						<tr>
							<td>2</td>
							<td>bbbbbbbbbbbbb</td>
							<td>200</td>
							<td>50%</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		-->
	</div>

</body>
</html>
