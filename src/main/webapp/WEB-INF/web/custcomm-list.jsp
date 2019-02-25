<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
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

<title>管理员列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>管理员管理 <span class="c-gray en">&gt;</span> 管理员列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div style="margin-left:20px;">
 	<div class="text-c"> 
		<button type="button" class="btn btn-success" id="" name="" onclick="inst()"><i class="Hui-iconfont">&#xe665;</i>添加用户沟通信息</button>
		<input type="text" class="input-text" style="width:250px" placeholder="输入管理员名称" id="cust_code" name="">
		<button type="button" class="btn btn-success" id="btn" name=""><i class="Hui-iconfont">&#xe665;</i>搜用户</button>
	</div>
 <table id="demo" lay-filter="test"></table>
 <script type="text/html" id="barDemo">

  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
 </div>
 
<script type="text/javascript">
$("#btn").click(function(){
		init($("#cust_code").val())
})
init("")
function init(cust_code){
layui.use('table', function(){
	  var table = layui.table;
	  //第一个实例
	  table.render({
	    elem: '#demo'
	    ,url: '/work5/custcommController/select.do' //数据接口
	    ,where:{cust_code:cust_code,user_code:'${usercode}'}
	    ,page: true //开启分页
	    ,cols: [[ //表头
	        {type: 'checkbox', fixed: 'left'}
	      ,{field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
	      ,{field: 'user_code', title: '用户名称'}
	      ,{field: 'cust_code', title: '用户ID'}
	      ,{field: 'time', title: '时间'} 
	      ,{field: 'content', title: '内容',edit: 'text',width:500} 
	      ,{fixed: 'right', title:'操作', toolbar: '#barDemo'}
	    ]],
	    parseData:function(res){
	    	return{
	    		"code":"0",
	    		"count":res.count,
	    		"data":res.cust
	    	}
	    }
	    
	  });
	  
// 	    修改
	    table.on('edit(test)', function(obj){ 
                 var aaa=obj.field
     
    	        $.ajax({
    	        	url:"/work5/customerController/update.do",
    	        	data:{id:obj.data.id,content:obj.value},
    	        	dataType:'text',
    	        	type:'post',
    	        	traditional:true,
    	        	success:function(data){
    	        		if(data==1){
    	        			layer.msg('修改成功');
    	        		}else{
    	        			layer.msg('修改失败');
    	        		}
    	        	}
    	        })
	  	});
	  
		  //监听行工具事件
		  table.on('tool(test)', function(obj){
		    var data = obj.data;
		    if(obj.event === 'del'){
		      layer.confirm('真的删除行么', function(index){
		        $.ajax({
		        	url:"/work5/customerController/del.do?id="+data.id,
		        	dataType:'json',
		        	type:'post',
		        	traditional:true,
		        	success:function(data){
		        		if(data==1){
		        			layer.msg('删除成功');
		                    obj.del();
		                    layer.close(index);
		        		}else{
		        			layer.msg('删除失败');
		        		}
		        	}
		        })

		      });
		    }
		  });
	  
	});
}
	
	

layui.use('layer',function(){
	var layer=layui.layer;
});
function inst() {
	layer.open({
		type:2,
		shadeClose:true,
		area:['800px','500px'],
		maxmin:true,
		end:function(){window.location.reload()},
		content:'/work5/jump/custcommadd.do'
	});
}

</script>
</body>