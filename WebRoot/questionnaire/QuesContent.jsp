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

<title>My JSP 'QuesContent' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet"
	href="/ideabox/lib/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/ideabox/lib/bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/ideabox/questionnaire/ques-content.css">
<style type="text/css">
.button {
	height: 50px;
	width: 100%;
}

#y1 {
	position: fixed;
	top: 30%;
	left: 5%;
	z-index: 1;
	_position: absoulte;
}
</style>
<link rel="stylesheet"
	href="/ideabox/lib/bootstrap/css/bootstrap.min.css">

<script src="/ideabox/lib/jquery/jquery-1.11.1.min.js"></script>
<script src="/ideabox/lib/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">
	var no = 1;
	var qid = 2;
	var dno = 0;
	var exist = new Array();

	function add(no) {
		var p = document.createElement("p");

		p.setAttribute("id", "p" + no + "" + qid);
		p.className = "p" + no;
		p.innerHTML += "<input type=\"radio\" value=\"1\" />"
				+ "<input class=\"input-medium \" value=\"\" placeholder=\"选项\"/><button class=\"btn   btn-primary \" id=\"dele"
				+ no
				+ "\" onclick=\"delet("
				+ no
				+ ", "
				+ qid
				+ ")\"><span class=\"glyphicon glyphicon-remove\"></span></button>";
		document.getElementById("div" + no).appendChild(p);
		qid++;
	}

	function addCheckbox(no) {
		var p = document.createElement("p");

		p.setAttribute("id", "p" + no + "" + qid);
		p.className = "p" + no;
		p.innerHTML += "<input type=\"checkbox\" value=\"1\" />"
				+ "<input class=\"input-medium \" value=\"\" placeholder=\"选项\" /><button class=\"btn   btn-primary \" id=\"dele"
				+ no
				+ "\" onclick=\"delet("
				+ no
				+ ", "
				+ qid
				+ ")\"><span class=\"glyphicon glyphicon-remove\"></span></button>";
		document.getElementById("div" + no).appendChild(p);
		qid++;
	}

	function delet(no, nqid) {
		//alert("选项应多于2个");
		//else 
		document.getElementById("p" + no + "" + nqid).innerHTML = "";
	}

	function del(no) {
		dno++;
		$('#div'+no).parent().remove();
	}

	function complete() {

		var n = no - 1;
		var type = "";
		var content = "";
		var choice = "";
		var usernum = "";
		var ipnum = "";
		var anonymous;
		var temp = new Array();
		for ( var i = 1; i <= n; i++) {
			//if(i<n)
			//{
			//alert("#div"+i);
			var tempType = $("#div" + i).children("#choiceType").attr("value");
			if (tempType == null) {
				continue;
			}
			type += tempType + "|";
			content += $("#div" + i).children("#choiceContent").children(
					"#choiceContent").val()
					+ "|";
			var long = $("#div" + i).children(".p" + i).children(
					'[class="input-medium "]').size();
			if (tempType == 0 || tempType == 1)
				for ( var j = 0; j < long; j++) {
					if (j < long - 1)
						choice += $(
								$("#div" + i).children(".p" + i).children(
										'[class="input-medium "]')[j]).val()
								+ "|";
					else
						choice += $(
								$("#div" + i).children(".p" + i).children(
										'[class="input-medium "]')[j]).val();
				}
			else if (tempType == 2)
				choice += "是|否";
			else
				choice += "None";

			choice += "%%";
			//temp.push($("#div"+i).children(".p"+i).children("#choice").val());

			//alert($("#div"+i).children(".p"+i));
			//for (var j = 1; j <= exist[i-1]; j++){
			//alert("#p"+i+""+j);
			//if(j < exist[i-1])
			//choice += $("#div"+i).children("#p"+i+""+j).children("#choice").val() + "|";
			//else choice += $("#div"+i).children("#p"+i+""+j).children("#choice").val();
			//}
			//}

			/*else{
				alert("#div"+i);
				type += $(".div"+i).children("#choiceType").attr("value");
				temp.push($("#div"+i).children("#choiceContent").children("#choiceContent").val());
				alert(temp[0]);
				//content += $("#div"+i).children("#choiceContent").children("#choiceContent").val();
				
				//for (var j = 1; j <= exist[i-1]; j++){
				//alert("#p"+i+""+j);
					//if(j < exist[i-1])
						//choice += $("#div"+i).children("#p"+i).children("#choice").val() + "|";
					//else choice += $("#div"+i).children("#p"+i+""+j).children("#choice").val();
				//}
			}*/

		}
		usernum += $(
				$("#myModal").children(".modal-dialog").children(
						".modal-content").children(".modal-body").children(
						".form-group")[0]).children("#1").children("#input01")
				.val();
		ipnum += $(
				$("#myModal").children(".modal-dialog").children(
						".modal-content").children(".modal-body").children(
						".form-group")[1]).children("#2").children("#input02")
				.val();
		anonymous = $(
				$("#myModal").children(".modal-dialog").children(
						".modal-content").children(".modal-body").children(
						".form-group")[2]).children("#3").children(
				'input[name="anonymous"]:checked').val();
				
		$
				.post(
						"/ideabox/questionnaire/QuesContent.action",
						{
							no : no - dno - 1,
							type : type,
							content : content,
							choice : choice,
							usernum : usernum,
							ipnum : ipnum,
							anonymous : anonymous,
						},
						function(data) {
							alert("创建问卷成功！");
							window.location.href = "/ideabox/userdashboard/UserDashboard!listPublished.action";
						}).error(function() { alert("问卷信息填写不全"); });
	}

	function Click(id) {
		switch (id) {
		case 1:
			//var qid=0;
			var div = document.createElement("div");
			$(div).addClass("qbox");
			div.innerHTML = "<div id=\"div"+no+"\">"
					+ "<p id=\"choiceContent\"><input class=\"form-control\" style=\"width: 200px\" id=\"choiceContent\" name=\"choiceContent\" value=\"\" placeholder=\"单选题题目\"/></p>"

					+ "<p id=\"p"+no+"0"+"\" class=\"p"+no+"\">"
					// +"<div class=\"row\"><div class=\"col-md-9 col-md-offset-3\"><div class=\"radio\">"

					+ "<input  type=\"radio\" name=\"single" +no+ "\"value=\"1\"/>"
					+ "<input class=\"input-medium \"  value=\"\" placeholder=\"选项\" /> "
					+ "<button class=\"btn   btn-primary \"  id=\"dele"
					+ no
					+ "\" onclick=\"delet("
					+ no
					+ ", 0"
					+ ")\"><span class=\"glyphicon glyphicon-remove\"></span></button></p> "

					+ "<p id=\"p"+no+"1"+"\" class=\"p"+no+"\"><input  type=\"radio\" name=\"single" +no+ "\" value=\"1\" />"
					+ "<input class=\"input-medium \" value=\"\" placeholder=\"选项\" />"
					+ "<button class=\"btn   btn-primary \" id=\"dele"
					+ no
					+ "\" onclick=\"delet("
					+ no
					+ ", 1"
					+ ")\"><span class=\"glyphicon glyphicon-remove\"></span></button></p>"
					+ "<input id=\"choiceType\" type=\"hidden\" name=\"type\" value=\"0\"/>"
					+ "<input type=\"hidden\" name=\"no\" value=\""+no+"\"/>"

					+ "</div>"
					+ "<div id=\"deDiv"+no+"\">"
					+ "<button class=\"btn   btn-primary \" id=\"add"
					+ no
					+ "\" name=\"add"
					+ no
					+ "\" onclick=\"add("
					+ no
					+ ")\"> <span class=\"glyphicon glyphicon-plus\"></span></button>"
					+ "<label style=\"width:20px\"></label>"
					+ "<button class=\"btn   btn-primary \" id=\"delete"
					+ no
					+ "\" onclick=\"del("
					+ no
					+ ")\"><span class=\"glyphicon glyphicon-remove\"></span></button>"
					+ "<p style=\"border-bottom:#000 dashed grey; solid 1px;\"></p></div>";
			document.getElementById("main").appendChild(div);
			//exist.push(qid);
			no++;
			//alert(no);
			break;
		case 2:
			var div = document.createElement("div");
			$(div).addClass("qbox");
			//var qid = 0;
			div.innerHTML = "<div id=\"div"+no+"\">"
					+ "<p id=\"choiceContent\"><input class=\"form-control\" style=\"width: 200px\" id=\"choiceContent\" name=\"choiceContent\" value=\"\" placeholder=\"多选题题目\"/></p>"

					+ "<p id=\"p"+no+"0"+"\" class=\"p"+no+"\"><input type=\"checkbox\" name=\"checkbox\"value=\"2\" />"
					+ "<input class=\"input-medium \" name=\"choice\" value=\"\" placeholder=\"选项\"/> "
					+ "<button class=\"btn   btn-primary \" id=\"dele"
					+ no
					+ "\" onclick=\"delet("
					+ no
					+ ", 0"
					+ ")\"><span class=\"glyphicon glyphicon-remove\"></span></button></p>"

					+ "<p id=\"p"+no+"1"+"\" class=\"p"+no+"\"><input type=\"checkbox\" name=\"checkbox\" value=\"2\" />"
					+ "<input class=\"input-medium \" name=\"choice\" value=\"\" placeholder=\"选项\"/>"
					+ "<button class=\"btn   btn-primary \" id=\"dele"
					+ no
					+ "\" onclick=\"delet("
					+ no
					+ ", 1"
					+ ")\"><span class=\"glyphicon glyphicon-remove\"></span></button></p>"

					+ "<input id=\"choiceType\" type=\"hidden\" name=\"type\" value=\"1\" />"
					+ "<input type=\"hidden\" name=\"no\" value=\""+no+"\"/>"
					+ "</div>"
					+ "<div id=\"deDiv"+no+"\">"
					+ "<button  class=\"btn   btn-primary \" id=\"addCheckbox"
					+ no
					+ "\" name=\"add"
					+ no
					+ "\" onclick=\"addCheckbox("
					+ no
					+ ")\"> <span class=\"glyphicon glyphicon-plus\"></span></button>"
					+ "<label style=\"width:20px\"></label>"
					+ "<button  class=\"btn   btn-primary \" id=\"delete"
					+ no
					+ "\" onclick=\"del("
					+ no
					+ ")\"><span class=\"glyphicon glyphicon-remove\"></span></button>"
					+ "<p style=\"border-bottom:#000 dashed grey; solid 1px;\"></p></div>";
			document.getElementById("main").appendChild(div);
			//exist.push(qid);
			no++;
			//alert(no);
			break;
		case 3:
			var div = document.createElement("div");
			$(div).addClass("qbox");
			div.innerHTML = "<div id=\"div"+no+"\">"
					+ "<p id=\"choiceContent\"><input class=\"form-control\" style=\"width: 200px\" id=\"choiceContent\" name=\"choiceContent\" value=\"\" placeholder=\"是非题题目\"  /></p>"
					+ "<span class=\"choice\" name=\"choice\" value=\"是\">是 <input type=\"radio\" name=\"single\"" +no+ "value=\"3\"/></span>"
					+ "<span class=\"choice\" name=\"choice\" value=\"否\">否<input type=\"radio\" name=\"single\"" +no+ " value=\"3\" /></span><br />"
					+ "<button  class=\"btn   btn-primary \" id=\"delete"
					+ no
					+ "\" onclick=\"del("
					+ no
					+ ")\"><span class=\"glyphicon glyphicon-remove\"></span></button>"
					+ "<input id=\"choiceType\" type=\"hidden\" name=\"type\" value=\"2\" />"
					+ "<input type=\"hidden\" name=\"no\" value=\""+no+"\"/>"
					+ "<div id=\"deDiv"+no+"\"></div>"
					+ "<p style=\"border-bottom:#000 dashed grey; solid 1px;\"></P>"
					+ "</div>";

			document.getElementById("main").appendChild(div);
			//exist.push(qid);
			no++;
			//alert(no);
			break;
		case 4:
			var div = document.createElement("div");
			$(div).addClass("qbox");
			div.innerHTML = "<div id=\"div"+no+"\">"
					+ "<p id=\"choiceContent\"><input  class=\"form-control\" style=\"width: 200px\" id=\"choiceContent\" name=\"choiceContent\" value=\"\" placeholder=\"简答题题目\"/></p>"
					+ "<textarea class=\"col-md-6\"  rows=\"3\" ></textarea><br />"
					+ "<button  class=\"btn   btn-primary \" id=\"delete"
					+ no
					+ "\" onclick=\"del("
					+ no
					+ ")\"><span class=\"glyphicon glyphicon-remove\"></span></button>"
					+ "<input id=\"choiceType\" type=\"hidden\" name=\"type\" value=\"3\" />"
					+ "<input type=\"hidden\" name=\"no\" value=\""+no+"\"/>"
					+ "<div id=\"deDiv"+no+"\"></div>"
					+ "<p style=\"border-bottom:#000 dashed grey; solid 1px;\"></P>"
					+ "</div>";
			document.getElementById("main").appendChild(div);
			no++;
			break;
		default:
			break;

		}
	}
</script>
</head>

<body>
	<div class="navbar navbar-inverse" role="navigation">
		<a class="navbar-brand"
			href="/ideabox/userdashboard/UserDashboard!listAnswered.action">用户问卷管理界面</a>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">

				<li><a href="/ideabox/">返回首页</a>
				</li>
				<li><a href="/ideabox/login/logout.action">登出</a>
				</li>
			</ul>
		</div>
	</div>

	<table
		style="height:100%; width:80%; vertical-align:top; overflow-y:auto"
		border="0">
		<tr style="height:20%">
			<th colspan="2" style="text-align:center"><s:property
					value="#session.title" />
			</th>
		</tr>
		<tr style="height:80%">
			<td style="width:20%; vertical-align:top">
				<div id="y1">
					<ul>
						<button class="btn btn-lg btn-primary btn-block"
							style="width: 100px" onclick="Click(1)">单选题</button>
						<br />
						<button class="btn btn-lg btn-primary btn-block"
							style="width: 100px" onclick="Click(2)">多选题</button>
						<br />
						<button class="btn btn-lg btn-primary btn-block"
							style="width: 100px" onclick="Click(3)">是非题</button>
						<br />
						<button class="btn btn-lg btn-primary btn-block"
							style="width: 100px" onclick="Click(4)">简答题</button>
					</ul>
				</div></td>
			<td id="main" style="width:70%; vertical-align:top"></td>
		</tr>
	</table>
	<!--  <button style="height:30px; width:100px" onclick="complete()">完成</button> -->
	<div style="text-align:right">
		<s:actionerror />
		<s:actionmessage />
		<s:fielderror />
		<!-- Button trigger modal -->
		<button class="btn btn-primary btn-lg" data-toggle="modal"
			data-target="#myModal">问卷提交</button>
		<!--  <form class="form-horizontal" method='post'
								action='./questionnaire/QuesSettings.action' role="form">-->

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
							<label class="col-sm-4 control-label" for="input01" >单用户最大填写份数：</label>
							<span id="1" class="controls col-sm-8"> <input type="text"
								name="usernum" id="input01" placeholder="用户最多只能填写这么多份，请妥善设置哦"
								class="form-control"
								onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();" > </span>
						</div>
						<br />
						<div class="form-group">
							<!-- Text input-->
							<label class="col-sm-4 control-label" for="input02">单IP最大填写份数：</label>
							<span id="2" class="controls col-sm-8"> <input type="text"
								name="ipnum" id="input02" placeholder="一个IP最多只能填写这么多份，请妥善设置哦"
								class="form-control" 
								onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();">
								<p class="help-block"></p> </span>
						</div>
						<br />
						<div class="form-group">
							<label class="col-sm-4 control-label" for="radio01">允许游客填写：</label>
							<span id="3" class="controls col-sm-8" id="radio01"> <!-- Multiple Radios -->
								<input type="radio" value="1" name="anonymous" checked="checked"
								id="optionsRadios1"> 是 </label> <input type="radio" value="0"
								name="anonymous" id="optionsRadios2"> 否 </label> </span>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button class="btn btn-primary" onclick="complete()">提交</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
		<!-- </form>-->
	</div>
</body>
</html>
