<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>	
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<%@include file="/WEB-INF/web/header.jsp" %>
<link rel="stylesheet" type="text/css" href="/work5/common/layui/css/layui.css"></link>
<script type="text/javascript" src="/work5/common/layui/layui.js"></script>
<script src="/work5/common/echarts/echarts.min.js"></script>

<title>统计图表</title>
</head>
<body>
<div id="main1" style="width: 600px;height:400px;"></div>
<div id="main2" style="width: 600px;height:400px;"></div>
<script type="text/javascript">
getChart("main1",'bar');
getChart("main2",'line');
function getChart(id,type){
	var myChart = echarts.init(document.getElementById(id));
	myChart.setOption({
	    title: {
	        text: '商品信息统计'
	    },
	    tooltip: {},
	    legend: {
	        data:['库存']
	    },
	    xAxis: {
	        data: []
	    },
	    yAxis: {},
	    series: [{
	        name: '库存',
	        type: type,
	        data: []
	    }]
	});
    $.ajax({
    	url:"/work5/goodsController/charts.do",
    	data:{},
    	dataType:'json',
    	type:'post',
    	traditional:true,
    	success:function(data){
   		 myChart.setOption({
		        xAxis: {
		            data: data.categories
		        },
		        series: [{
		            // 根据名字对应到相应的系列
		            name: '库存',
		            data: data.data
		        }]
		    });
    	}
    })
}
</script>
</body>
</html>