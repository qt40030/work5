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

<title>我的桌面</title>
</head>
<body>
<div class="page-container">
	<p class="f-20 text-success">欢迎使用 <span class="f-14"></span>！</p>
	<p>登录次数：18 </p>
	<p>上次登录IP：222.35.131.79.1  上次登录时间：2019-1-9 11:19:55</p>
	<div id="main1" style="width: 600px;height:400px;"></div>
    <div id="main2" style="width: 600px;height:400px;"></div>
	<table class="table table-border table-bordered table-bg mt-20">
		<thead>
			<tr>
				<th colspan="2" scope="col">服务器信息</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th width="30%">服务器计算机名</th>
				<td><span id="lbServerName">http://127.0.0.1/</span></td>
			</tr>
			<tr>
				<td>服务器IP地址</td>
				<td>192.168.1.1</td>
			</tr>
			<tr>
				<td>服务器域名</td>
				<td>www.h-ui.net</td>
			</tr>
			<tr>
				<td>服务器端口 </td>
				<td>80</td>
			</tr>
			<tr>
				<td>服务器IIS版本 </td>
				<td>Microsoft-IIS/6.0</td>
			</tr>
			<tr>
				<td>本文件所在文件夹 </td>
				<td>D:\WebSite\HanXiPuTai.com\XinYiCMS.Web\</td>
			</tr>
			<tr>
				<td>服务器操作系统 </td>
				<td>Microsoft Windows NT 5.2.3790 Service Pack 2</td>
			</tr>
			<tr>
				<td>系统所在文件夹 </td>
				<td>C:\WINDOWS\system32</td>
			</tr>
			<tr>
				<td>服务器脚本超时时间 </td>
				<td>30000秒</td>
			</tr>
			<tr>
				<td>服务器的语言种类 </td>
				<td>Chinese (People's Republic of China)</td>
			</tr>
			<tr>
				<td>.NET Framework 版本 </td>
				<td>2.050727.3655</td>
			</tr>
			<tr>
				<td>服务器当前时间 </td>
				<td>2014-6-14 12:06:23</td>
			</tr>
			<tr>
				<td>服务器IE版本 </td>
				<td>6.0000</td>
			</tr>
			<tr>
				<td>服务器上次启动到现在已运行 </td>
				<td>7210分钟</td>
			</tr>
			<tr>
				<td>逻辑驱动器 </td>
				<td>C:\D:\</td>
			</tr>
			<tr>
				<td>CPU 总数 </td>
				<td>4</td>
			</tr>
			<tr>
				<td>CPU 类型 </td>
				<td>x86 Family 6 Model 42 Stepping 1, GenuineIntel</td>
			</tr>
			<tr>
				<td>虚拟内存 </td>
				<td>52480M</td>
			</tr>
			<tr>
				<td>当前程序占用内存 </td>
				<td>3.29M</td>
			</tr>
			<tr>
				<td>Asp.net所占内存 </td>
				<td>51.46M</td>
			</tr>
			<tr>
				<td>当前Session数量 </td>
				<td>8</td>
			</tr>
			<tr>
				<td>当前SessionID </td>
				<td>gznhpwmp34004345jz2q3l45</td>
			</tr>
			<tr>
				<td>当前系统用户名 </td>
				<td>NETWORK SERVICE</td>
			</tr>
		</tbody>
	</table>
</div>
<footer class="footer mt-20">
	<div class="container">
		<p>感谢jQuery、layer、laypage、Validform、UEditor、My97DatePicker、iconfont、Datatables、WebUploaded、icheck、highcharts、bootstrap-Switch<br>
			Copyright &copy;2015-2017 H-ui.admin v3.1 All Rights Reserved.<br>
			本后台系统由<a href="http://www.h-ui.net/" target="_blank" title="H-ui前端框架">H-ui前端框架</a>提供前端技术支持</p>
			<p>More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
	</div>
</footer>

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