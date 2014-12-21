<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>IdeaBox问卷调查网</title>

<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="/ideabox/lib/bootstrap/css/bootstrap.min.css">

<script src="/ideabox/lib/headroom.min.js">
	
</script>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/ideabox/lib/jquery/jquery-1.11.1.min.js"></script>
<script src="/ideabox/lib/bootstrap/js/bootstrap.min.js"></script>


<!-- Custom styles for this template -->
<link href="/ideabox/lib/jumbotron.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="/ideabox/lib/ie-emulation-modes-warning.js"></script>

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="/ideabox/lib/ie10-viewport-bug-workaround.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<!-- HeadRoom  -->
<style type="text/css">
.footer {
	text-align: center;
	padding: 30px 0;
	margin-top: 10px;
	border-top: 1px solid #e5e5e5;
	background-color: #f5f5f5;
}

.headroom {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	transition: all .2s ease-in-out;
}

.headroom--unpinned {
	top: -100px;
}

.headroom--pinned {
	top: 0;
}
</style>
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
				<s:if test="#session.user!= null">
					<li><a href="/ideabox/questionnaire/QuesTitle.jsp">创建问卷</a>
				</s:if>
				</li>
			</ul>
			<div class="navbar-collapse collapse">
				<s:if test="#session.user == null">
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
			<!--/.navbar-collapse -->
			</s:if>
			<s:else>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-right navbar-nav">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><s:property
									value="#session.user.Username" /> <span class="caret"></span>
						</a>
							<ul class="dropdown-menu" role="menu">
								<s:if test="#session.user.Uid != 1">
									<li><a href="/ideabox/userdashboard/UserDashboard!listAnswered.action">已回答的问卷</a>
									</li>
									<li class="divider"></li>
									<li><a href="/ideabox/userdashboard/UserDashboard!listPublished.action">已发布的问卷</a>
									</li>
									
									<li class="divider"></li>
									<li><a href="/ideabox/userdashboard/EditInformation!view.action?isView=true">个人信息管理</a>
									</li>
									<li class="divider"></li>
									<li><a href="./login/logout.action">登出</a>
									</li>
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
										href="/ideabox/userdashboard/EditInformation!view.action?isView=true">个人信息管理</a>
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

	<!-- Main jumbotron for a primary marketing message or call to action -->
	<div class="jumbotron">
		<div class="container">
			<h1>我们帮您寻找声音</h1>
			<p>
				在这里，你也可以更广泛的聆听公众的声音;在这里，你可以更随意表达自己的观点;在这里，你可以更迅速的得到权威的结果。这里是，<strong>IdeaBox</strong>.
			</p>
			<p>
				<a class="btn btn-primary btn-lg" role="button">了解更多 &raquo;</a>
			</p>
		</div>
	</div>

	<div class="container">
		<!-- Example row of columns -->
		<div class="row">
			<div class="col-md-4">
				<h2>创建你的问卷</h2>
				<p>IdeaBox提供了自由的问卷创建方式，您可以自由选择包括填空题、单项选择题、多项选择题、是非题在内的多种问卷常用题型，一经创建，永久保存，甚至在问卷关闭后您也能随时重启问卷。</p>
			</div>
			<div class="col-md-4">
				<h2>参与感兴趣的问卷</h2>
				<p>IdeaBox是一个参与者众多的问卷网站，您可以自由地选择您感兴趣的问卷参加调查，成为互联网民意大军的一员。参与简单，无需注册。我们保证，不会透露您的隐私给任何人。</p>
			</div>
			<div class="col-md-4">
				<h2>权威的结果统计</h2>
				<p>我们为您精心准备了精细的问卷结果统计工具，让您发起的或者参与的的问卷可以自由查看调查结果，调查结果可以以包括柱状图、饼图、折线图等多种直观的方式呈现，更高，更快，更强。</p>
			</div>

		</div>
		<hr>
		<!-- Bootstrap core JavaScript
    ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->

		<script type="text/javascript">
			// 获取页面元素
			var myElement = document.querySelector("#ideaboxnav")
			// 创建 Headroom 对象，将页面元素传递进去
			var headroom = new Headroom(myElement)
			// 初始化
			//headroom.init();
		</script>

	</div>
	<!-- /container -->



	<!-- Footer
    ================================================== -->
	<footer class="footer">
		<div class="container">
			<p>用对世界满满的爱来做Design和Coding</p>
			<p>
				Code licensed under <a
					href="http://www.apache.org/licenses/LICENSE-2.0" target="_blank">Apache
					License v2.0</a>, documentation under <a
					href="http://creativecommons.org/licenses/by/3.0/">CC BY 3.0</a>.
			</p>


		</div>
	</footer>

</body>
</html>