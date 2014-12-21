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
			<ul class="nav navbar-nav">
				<li><a href="/ideabox/questionnaire/QuestionList.action" class="navbar-link">参与问卷</a>
				</li>
				<li><a href="/ideabox/contact/contact.jsp" class="navbar-link">联系我们</a></li>
				</li>
				<li><a href="/ideabox/questionnaire/QuesTitle.jsp">创建问卷</a></li>
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
							data-toggle="dropdown"><s:property value="#session.user.Username" /> <span class="caret"></span> </a>
							<ul class="dropdown-menu" role="menu">
								<s:if test="#session.user.Uid != 1">
								
								<li><a href="/ideabox/userdashboard/UserDashboard!listAnswered.action">已回答的问卷</a>
								</li>
								<li class="divider"></li>
								<li><a href="/ideabox/userdashboard/UserDashboard!listPublished.action">已发布的问卷</a>
								</li>
								
								<li class="divider"></li>
								<li><a href="/ideabox/userdashboard/EditInformation!view.action">个人信息管理</a>
								</li>
								<li class="divider"></li>
								<li><a href="./login/logout.action">登出</a>
								</li>
								</s:if>
							</ul></li>
					</ul>
				</div>
			</s:else>
		</div>
	</header>
	<s:actionerror />
	<s:actionmessage />
	<s:fielderror />

	<input type="hidden" id="result"
		value="<s:property value='#session.r.getResult()'/>">
	<form action="/ideabox/userdashboard/UserDashboard!listAnswered.action">
		<s:property value="#session.outterhtml" escape="false" />
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<button class="btn btn-primary btn-block btn-large" type="summit">返回</button>
				</div>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		var resultStr = $("#result").val()
		//alert(resultStr.toString())
		var resultSet = resultStr.split('|')
		for(var i=0; i<resultSet.length;i++)
		{
			var name = "question" + (i+1);
			var content = resultSet[i];
			//multiple choice
			if(content.indexOf(',')>-1)
			{
				var multipleChoice = content.split(',');
				for(var j=0;j<multipleChoice.length;j++)
				{
					$("input[name='"+name +"']"),$("input[type='checkbox']"),$("input[value='"+ multipleChoice[j] +"']").attr("checked","true");
				}
			}
			//single choice , unsafe with bugs cuz fillin may also get a single char answer
			else if(content.length==1 && content != '0' && content != '1')
			{
				$("input[name='"+name +"']"),$("input[type='radio']"),$("input[value='"+ content +"']").attr("checked","true");
			}
			//yes or no , unsafe either, reason the same
			else if(content == '0' || content == '1')
			{
				$("input[name='"+name +"']"),$("input[type='radio']"),$("input[value='"+ content +"']").attr("checked","true");
			}
			//fill in
			else
			{
				$("textarea[name='"+name +"']").val(content)
			}
			
			//var qType = $("['']")
			//alert(qStr)
		}
		//alert(resultSet.toString())
		// 获取页面元素
		var myElement = document.querySelector("#ideaboxnav")
		// 创建 Headroom 对象，将页面元素传递进去
		var headroom = new Headroom(myElement)
		// 初始化
		headroom.init();
	</script>



	<!-- Footer
    ================================================== -->
	<footer class="footer">
	<div class="container">
		<p>我们郑重承诺，不会泄露您的身份给其他人。</p>
		<p>IdeaBox, coding and designing with Love.</p>
	</div>
	</footer>
</body>
</html>
