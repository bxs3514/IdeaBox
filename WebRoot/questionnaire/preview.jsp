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

<title>My JSP 'QuesSettings.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="/ideabox/lib/bootstrap/css/bootstrap.min.css">

<script src="/ideabox/lib/headroom.min.js">
	
</script>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/ideabox/lib/jquery/1.11.1/jquery-1.11.1.min.js"></script>
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

.bs-example {
	background-color: #fff;
	border-color: #ddd;
	border-width: 1px;
	border-radius: 4px 4px 0 0;
	-webkit-box-shadow: none;
	box-shadow: none;
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
		<!--/.navbar-collapse -->
	</div>
	</header>
	<s:actionerror />
	<s:actionmessage />
	<s:fielderror />
	<form action="/ideabox/questionnaire/SummitAnswers.action" method="post">
		<s:property value="#QuestionContent.outterHtml" escape="false" />
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
				</div>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		// 获取页面元素
		var myElement = document.querySelector("#ideaboxnav")
		// 创建 Headroom 对象，将页面元素传递进去
		var headroom = new Headroom(myElement)
		// 初始化
		headroom.init();
	</script>
</body>
</html>
