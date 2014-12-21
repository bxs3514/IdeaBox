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

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>My JSP 'QuesTitle' starting page</title>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link rel="stylesheet"
	href="/ideabox/lib/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/ideabox/lib/bootstrap/css/bootstrap-theme.min.css">
<script src="/ideabox/lib/jquery/jquery-1.11.1.min.js"></script>
<script src="/ideabox/lib/bootstrap/js/bootstrap.min.js"></script>


</head>

<body>

	<div class="navbar navbar-inverse" role="navigation">
		<label class="navbar-brand" href="#">用户问卷管理界面</label>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/ideabox/">返回首页</a></li>
				<li><a href="/ideabox/login/logout.action">登出<s:property
							value="#session.user.username" /> </a>
			</ul>
		</div>
	</div>

	<h2 style="text-align:center">新调查问卷</h2>
	<div style="width:100%">

		<div class="col-md-8 col-md-offset-2">
			<form class="form-horizontal" role="form" method='post'
				action="./questionnaire/QuesCreate.action">
				<br /> <br />
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">标题</label>
					<div class="col-sm-10">
						<input id="title" name="title" class="form-control col-md-6" />
					</div>
					<span><s:fielderror fieldName='title' /> </span>
				</div>

				<div class="form-group">

					<label for="title" class="col-sm-2 control-label">主题</label>
					<div class="col-sm-4">
						<select size="1" id="type" name="subject" class="form-control"
							style="width: 200px">
							<option value="">请选择</option>
							<option value="品牌营销">品牌营销</option>
							<option value="产品测试">产品测试</option>
							<option value="消费者分析">消费者分析</option>
							<option value="满意度调查">满意度调查</option>
							<option value="人力资源">人力资源</option>
							<option value="学术教育">学术教育</option>
							<option value="社会民意">社会民意</option>
							<option value="其他">其他</option>
						</select>
					</div>
					<span><s:fielderror fieldName='subject' /> </span>
				</div>



				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">说明</label>
					<div class="col-sm-10">
						<textarea name="instruction" class="form-control " rows="8"></textarea>
					</div>
					<span><s:fielderror fieldName='instruction' /> </span>

				</div>


				<div class="form-group">
					<div class="row">
						<div class="col-md-offset-2 col-md-3">
							<button type="submit" class="btn btn-lg btn-primary btn-block">创建</button>
						</div>
						
					</div>
				</div>
				<p>
					<s:property value="#request.msg" />
				</p>
			</form>
		</div>
	</div>
	
</body>
</html>
