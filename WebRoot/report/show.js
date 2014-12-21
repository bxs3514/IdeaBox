//depend on underscore.string
$(function() {
	var charts = []
	function getParameterByName(name, href) {
	  name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
	  var regexS = "[\\?&]"+name+"=([^&#]*)";
	  var regex = new RegExp( regexS );
	  var results = regex.exec( href );
	  if( results == null )
	    return "";
	  else
	    return decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	function getData() {
		var qid = getParameterByName("qid", window.location.href) || $("#qid").val();
		console.log("qid = " + qid)
		$.get("./report/getAnswers.action?qid=" + qid)
			.done(function(data) {
				data = JSON.parse(data)
				show(data, "#report-pane")
				//console.log(data)
			})
	}

	function show(answers, paneId) {
		var $pane = $(paneId);
		$pane.append($("<h2>问卷统计报告</h2>"))
		for (var i = 0; i < answers.length; i++) {
			var answer = answers[i]
			$pane.append(generateAnswer(i, answer))
			switch (answer.type) {
			case 0:
			case 2:
				charts[i].drawPie();
				break;
			case 1:
				charts[i].drawBar();
				break;
			default:
				break;
			}

		};
	}

	function generateAnswer(index, answer) {
		var chartType = ["pie", "bar", "line"]
		var questionType = ["单选题", "多选题", "是非题", "简答题"]
		var $answer = $('<div id="answer' + index + '" class="row question"></div>')
		$answer.append($($.sprintf('<p class="alert alert-info">%d %s (%s)</p>', index+1, answer.content, questionType[answer.type])))
		switch (answer.type) {
		case 0:
		case 1:
		case 2:
			$answer.append($($.sprintf('<div class="col-xs-6"><div><button id="pie_%d">饼图</button><button id="line_%d">折线图</button><button id="bar_%d">柱状图</button></div><canvas width="360px" height="360px" class="question-graph" id="graph%d"></canvas></div>', index, index, index, index)));
			function genCallback(index, answer, type) {
				var chart = new ChartWrapper("graph" + index, answer)
				charts[index] = chart
				return function() {
					switch (type) {
					case "pie":
						chart.drawPie();
						break;
					case "bar":
						chart.drawBar();
						break;
					case "line":
						chart.drawLine();
						break;
					}
				}

			}
			for (var i = 0; i<chartType.length; i++) {
				$("#" + chartType[i] + "_" + index, $answer).click(genCallback(index, answer, chartType[i]))
			}
			var $items = $('<div class="question-items col-xs-6"><p>回答该问题的总人数:%d</p><table class="table table-bordered"><thead><tr><td>序号</td><td>选项</td><td>人数</td><td>比例</td></tr></thead><tbody></tbody></table></div>').format(answer.total)
			var $tbody = ($('tbody', $items));
			for (var j = 0; j < answer.items.length; j++) {
				var item = answer.items[j];
				var $row = $('<tr><td>%d</td>' +
							'<td>%s</td>' +
							'<td>%d</td>' +
							'<td>%s%%</td>' +
							'</tr>')
							.format(j + 1, item.content, item.count, (item.count / answer.total * 100).toFixed(2));
				$tbody.append($row);
			};
			$answer.append($items)
			break;
		case 3:
			$answer.append($('<p>回答该问题的总人数:%d</p><p>以下是来自用户的回答<p>').format(answer.total))
			var $items = $("<div class='essay-container'></div>")
			for (var j = 0; j < answer.items.length; j++) {
				var item = answer.items[j];
				$items.append($('<p>%s</p>').format(item.content))
			};
			$answer.append($items)
			break;
		default:
			break;
		}

		return $answer;
	}

	function ChartWrapper(graphId, answer) {
		this.graphId = graphId
		this.answer = answer
		try {
			this.ctx = document.getElementById(graphId).getContext("2d")
			this.chart = new Chart(this.ctx)
		} catch (e) {
			this.ctx = null
			this.ctx = null
		}
	}

	ChartWrapper.prototype.clear = function() {
		this.ctx.fill();
		this.ctx.clearRect(0,0,360,360)
		this.ctx.canvas.onmousemove = null
		this.ctx.canvas.ondrag = null
		this.ctx.canvas.ondragenter = null
		this.ctx.canvas.onmouseenter = null
	}
	ChartWrapper.prototype.drawBar = function() {
		if (!this.chart) {
			this.ctx = document.getElementById(this.graphId).getContext("2d")
			this.chart = new Chart(this.ctx)
		}
		var answer = this.answer
		var data = {
			labels: [],
			datasets: [{
				fillColor: "rgba(151,187,205,0.5)",
				strokeColor: "rgba(151,187,205,0.8)",
				data : []
			}]
		}
		var colors = ["#F38630", "#CCFF99", "#69D2E7", "#E0E4CC"]
		for (var i = 0; i < answer.items.length; i++) {
			var item = answer.items[i];
			data.labels.push(item.content)
			data.datasets[0].data.push(item.count)
		};
		console.log(data);
		var options = {
			scaleOverride : true,
			scaleShowLabels : false,
			scaleShowGridLines : false,
		}
		this.clear()
		this.chart.Bar(data)
	}
	
	ChartWrapper.prototype.drawLine = function() {
		if (!this.chart) {
			this.ctx = document.getElementById(this.graphId).getContext("2d")
			this.chart = new Chart(this.ctx)
		}
		var answer = this.answer
		var data = {
			labels: [],
			datasets: [{
				fillColor : "rgba(255,255,255,0)",
				strokeColor : "#69D2E7",
				pointColor : "rgba(220,220,220,1)",
				pointStrokeColor : "#000",
				data : []
			}]
		}
		var colors = ["#F38630", "#CCFF99", "#69D2E7", "#E0E4CC"]
		for (var i = 0; i < answer.items.length; i++) {
			var item = answer.items[i];
			data.labels.push(item.content)
			data.datasets[0].data.push(item.count)
		};
		var options = {
				scaleOverride : false,
				scaleSteps : answer.total,
				scaleStartValue: 0,
				scaleLineColor : "rgba(0, 0, 0, 1)",
				scaleLineWidth : 1,
				scaleShowLabels: true,
				scaleShowGridLines : false,
				bezierCurve : false,
			}
		this.clear()
		this.chart.Line(data, options)
	}

	ChartWrapper.prototype.drawPie = function() {
		if (!this.chart) {
			this.ctx = document.getElementById(this.graphId).getContext("2d")
			this.chart = new Chart(this.ctx)
		}
		var answer = this.answer
		var data = []
		var colors = ["#F38630", "#CCFF99", "#69D2E7", "#E0E4CC"]
		for (var i = 0; i < answer.items.length; i++) {
			var item = answer.items[i];
			data.push({
				value: item.count,
				color: colors[i % colors.length]
			})
		};
		this.clear()
		this.chart.Pie(data)
	}
	getData()

});