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
	<script type="text/javascript" src="jquery.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Dashboard</title>

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
          	<li><a href="../questionnaire/QuesTitle.jsp">创建问卷</a></li>
			<li><a href="../index.jsp">返回首页</a></li>	
            <li><a href="../userdashboard/userdashboard.jsp"><s:property value="#session.user.username"/></a></li>
          </ul>
        </div>
    </div>
	
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-2 sidebar">
          <ul class="nav nav-sidebar">
          	<li><a href="/ideabox/userdashboard/UserDashboard!listAnswered.action">已回答问卷列表</a></li>
          	<li><a href="/ideabox/userdashboard/UserDashboard!listPublished.action">已发布问卷列表</a></li>
            <li><a href="/ideabox/userdashboard/EditInformation!view.action?isView=true"> 个人信息</a>
          </ul>
        </div>
        <div class="col-md-10 main">
          <h1 class="page-header">问卷列表</h1>

          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>问卷名称</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>2014年北航最帅男生是谁</td>
                  
                  <td>
                  <form action='/ideabox/userdashboard/CloseQuestionnaire.action'>
				  <button type="summit" class="btn btn-danger">Close Questionnaire</button>
			      </form>
                  </td>
                  <td><button type="summit" class="btn btn-primary">查看问卷</button></td>
                  </tr>
                  
                  <tr>
                  <td>2014年北航最美女生是谁</td>
                  
                  <td>
                  <form action='/ideabox/userdashboard/CloseQuestionnaire.action'>
				  <button type="summit" class="btn btn-danger">Close Questionnaire</button>
                  </form>
                  </td>
                  <td><button type="summit" class="btn btn-primary">查看问卷</button></td>
                  </tr>
                
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

</body>
</html>