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

<title>管理员列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>管理员管理 <span class="c-gray en">&gt;</span> 管理员列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div style="margin-left:20px;">
 	<div class="text-c"> 
		<input type="text" class="input-text" style="width:250px" placeholder="输入管理员名称" id="" name="">
		<button type="button" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i>搜用户</button>
		<button type="button" class="btn btn-success" id="" name="" onclick="admin_add('添加管理员','/work5/jump/rightsadd.do','800','500')"><i class="Hui-iconfont">&#xe665;</i>添加用户</button>
	</div>
 <table id="demo" lay-filter="test"></table>
 <script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
 </div>
 
<script type="text/javascript">

layui.use('table', function(){
	  var table = layui.table;
	  //第一个实例
	  table.render({
	    elem: '#demo'
	    ,height: 312
	    ,url: '/work5/user/selectUser.do' //数据接口
	    ,page: true //开启分页
	    ,cols: [[ //表头
	        {type: 'checkbox', fixed: 'left'}
	      ,{field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
	      ,{field: 'user_code', title: '用户名'}
	      ,{field: 'user_name', title: '姓名',edit: 'text'}
	      ,{field: 'role_code', title: '角色编号'} 
	      ,{field: 'role_age', title: '级别'}
	      ,{fixed: 'right', title:'操作', toolbar: '#barDemo'}
	    ]],
	    parseData:function(res){
	    	return{
	    		"code":"0",
	    		"count":res.count,
	    		"data":res.user
	    	}
	    }
	  });

	  
	  //监听行工具事件
	  table.on('tool(test)', function(obj){
	    var data = obj.data;
	    if(obj.event === 'del'){
	      layer.confirm('真的删除行么', function(index){
	    	  alert(data.id)
	        layer.close(index);
	      });
	    } else if(obj.event === 'edit'){
	    	admin_add('添加管理员' ,'/work5/jump/rightsadd.do?user_code='+data.user_code+"&user_name="+data.user_name+"&role_name="+data.role_age,'800','500')
	    }
	  });
	});
	
	
	
	
function admin_add(title,url,w,h){
	layer_show(title,url,w,h);
}
	
</script>
</body>
</html>