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


<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/ideabox/lib/jquery/jquery-1.11.1.min.js"></script>
<script src="/ideabox/lib/bootstrap/js/bootstrap.min.js"></script>
</head>

<body>
	<s:actionerror />
	<s:actionmessage />
	<s:fielderror />
	<!-- Button trigger modal -->
	<button class="btn btn-primary btn-lg" data-toggle="modal"
		data-target="#myModal">问卷设置</button>
	<form class="form-horizontal" method='post'
		action='./questionnaire/QuesSettings.action' role="form">
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">问卷设置</h4>
					</div>
					<div class="modal-body">



						<div class="form-group">

							<!-- Text input-->
							<label class="col-sm-4 control-label" for="input01">单用户最大填写份数：</label>
							<div class="controls col-sm-8">
								<input type="text" name="usernum" id="input01"
									placeholder="用户最多只能填写这么多份，请妥善设置哦" class="form-control">

							</div>
						</div>
						<div class="form-group">

							<!-- Text input-->
							<label class="col-sm-4 control-label" for="input02">单IP最大填写份数：</label>
							<div class="controls col-sm-8">
								<input type="text" name="ipnum" id="input02"
									placeholder="一个IP最多只能填写这么多份，请妥善设置哦" class="form-control">
								<p class="help-block"></p>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-4 control-label" for="radio01">允许游客填写：</label>
							<div class="controls col-sm-8" id="radio01">
								<!-- Multiple Radios -->
								<label class="radio-inline"> <input type="radio"
									value="1" name="anonymous" checked="checked"
									id="optionsRadios1"> 是 </label>
									 <label class="radio-inline">
									<input type="radio" value="0" name="anonymous"
									id="optionsRadios2"> 否 </label>
							</div>

						</div>





					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button class="btn btn-primary" type="summit">提交</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
	</form>

</body>
</html>
