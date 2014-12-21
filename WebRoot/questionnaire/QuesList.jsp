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

	<!-- header class="navbar navbar-inverse navbar-fixed-top headroom"
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
					<a class="btn btn-success" href="/ideabox/signup/signup.jsp">
						注册</a>
				</form>
			</div>
			</.navbar-collapse >
		</div>
	</header-->
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
				<li><a href="/ideabox/questionnaire/QuestionList.action" class="navbar-link">参与问卷</a>
				</li>
				<li><a href="/ideabox/contact/contact.jsp" class="navbar-link">联系我们</a></li>
				</li>
				<li><a href="/ideabox/questionnaire/QuesTitle.jsp">创建问卷</a></li>
				<li><a href="/ideabox/index.jsp">返回首页</a></li>
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

	<div class="container-fluid">
		<div class="row">
			<!-- ><div class="col-sm-2 sidebar">
				<br />
				<ul class="nav nav-sidebar-inverse">
					<s:iterator value="#request.sList" id="sList">
						<li class="active"><a href="#"><s:property /> </a></li>
					</s:iterator>
				</ul>
			</div> -->


			<div class="col-sm-8 col-sm-offset-2 main">
				<h2 class="sub-header">全部问卷列表</h2>
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>QID</th>
								<th>标题</th>
								<th>类别</th>
								<th>答题状态</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="#request.qList" id="qList">
								<s:if test="%{#qList.getQid() in #request.AList}">
									<tr class="success">
								</s:if>
								<s:else>
									<tr>
								</s:else>
								<td><s:property value="#qList.getQid()" />
								</td>
								<td><a
									href="/ideabox/questionnaire/AnswerQuestions!view.action?qid=<s:property value="#qList.getQid()" />"><s:property
											value="#qList.getTitle()" /> </a>
								</td>
								<td><s:property value="#qList.getSubject()" />
								</td>
								<td><s:if test="%{#qList.getQid() in #request.AList}">已填写
									</s:if> <s:else>
									未填写
										</s:else></td>
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

	<script type="text/javascript">
		// 获取页面元素
		var myElement = document.querySelector("#ideaboxnav")
		// 创建 Headroom 对象，将页面元素传递进去
		var headroom = new Headroom(myElement)
		// 初始化
		headroom.init();
	</script>


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