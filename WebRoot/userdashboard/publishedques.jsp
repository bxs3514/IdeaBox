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

    <title>IdeaBox用户页面</title>

<link rel="stylesheet"
	href="/ideabox/lib/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/ideabox/lib/bootstrap/css/bootstrap-theme.min.css">
<script src="/ideabox/lib/jquery/jquery-1.11.1.min.js"></script>
<script src="/ideabox/lib/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
    <div class="navbar navbar-inverse" role="navigation">
         	<label class="navbar-brand">IdeaBox用户页面</label>
         <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
			<li><a href="../index.jsp">返回首页</a></li>	
            <li><a href="../login/logout.action">登出<s:property value="#session.user.username" /></a>
          </ul>
        </div>
    </div>
	
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-pills nav-stacked">
				<li><a href="../questionnaire/QuesTitle.jsp">创建问卷</a></li>
				<li><a href="/ideabox/userdashboard/UserDashboard!listAnswered.action">已回答问卷列表</a></li>
		        <li class="active"><a href="/ideabox/userdashboard/UserDashboard!listPublished.action">已发布问卷列表</a></li>
				<li><a href="/ideabox/userdashboard/EditInformation!view.action?isView=true"> 个人信息</a>
			</ul>
        </div>
        <div class="col-sm-9  col-md-10  main">
          <h1 class="page-header">问卷列表</h1>

          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>已发布问卷名称</th>
                  <th>操作</th>
                  
                  <th>统计</th>
                </tr>
              </thead>
              <tbody>
              	<s:iterator value="#request.publishedques" status="index">
					<tr>
					   <td><a href="/ideabox/questionnaire/AnswerQuestions.action?qid=<s:property value='qid'/>"><s:property value="title"/></a></td>
					    <td>
					    	<s:if test="isavailable != null && isavailable == 0">
					    		<button class="btn btn-danger" disabled="disabled">已被管理员关闭</button>
					    	</s:if>
                  			<s:elseif test="isclosed !=null && isclosed == 1">
                  			<a href='/ideabox/userdashboard/CloseQuestionnaire.action?qid=<s:property value="qid"/>' class='btn btn-success'>开放问卷</a>
                  			</s:elseif>
                  			<s:else>
                  			<a href='/ideabox/userdashboard/CloseQuestionnaire.action?qid=<s:property value="qid"/>' class='btn btn-danger'>
                  			关闭问卷</a>
                  			</s:else>
                  		</td>
                  		<td><a href='/ideabox/report/report.jsp?qid=<s:property value="qid"/>' class='btn btn-primary'>查看统计</a>
                  		</td>
                    </tr>
				   	
				</s:iterator>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

</body>
</html>