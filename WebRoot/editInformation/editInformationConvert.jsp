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

<title>Save</title>
<link rel="stylesheet"
	href="/ideabox/lib/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/ideabox/lib/bootstrap/css/bootstrap-theme.min.css">
<script src="/ideabox/lib/jquery/jquery-1.11.1.min.js"></script>
<script src="/ideabox/lib/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	


	<!--<div class="container-fluid">
		<div class="row">
			<div class="col-md-2 sidebar">
				<ul class="nav nav-pills nav-stacked">
					<li><a href="/ideabox/userdashboard/UserDashboard!listAnswered.action">已回答问卷列表</a></li>
					<li><a href="/ideabox/userdashboard/UserDashboard!listPublished.action">已发布问卷列表</a></li>
					<li class="active"><a href="/ideabox/userdashboard/EditInformation!view.action?isView=true"> 个人信息</a>
				</ul>
			</div>
			<div class="col-md-10 main">
				<h1 class="page-header">个人信息</h1>
				<form class="form-horizontal" role="form" method='post' action='/ideabox/userdashboard/EditInformation.action?isView=true'>
				  -->		
					
					
				<script type="text/javascript" language="javascript">
					alert("保存成功");
					window.document.location.href="/ideabox/index.jsp";
				</script>
					
	

</body> 
</html>




