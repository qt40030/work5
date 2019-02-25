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
		<button type="button" class="btn btn-success" id="" name="" onclick="admin_add('添加一级菜单','/work5/jump/menuadd1.do','800','500')"><i class="Hui-iconfont">&#xe665;</i>添加一级菜单</button>
		<button type="button" class="btn btn-success" id="" name="" onclick="admin_add('添加二级菜单','/work5/jump/menuadd2.do','648','500')"><i class="Hui-iconfont">&#xe665;</i>添加二级菜单</button>
		<input type="text" class="input-text" style="width:250px" placeholder="输入菜单名称" id="menu_name" name="">
		<button type="button" class="btn btn-success" id="btn" name=""><i class="Hui-iconfont">&#xe665;</i>搜菜单</button>
	</div>
 <table id="demo" lay-filter="test"></table>
 <script type="text/html" id="barDemo">

  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
 </div>
 
<script type="text/javascript">
$("#btn").click(function(){
		init($("#menu_name").val())
})
init("")
function init(menu_name){
layui.use('table', function(){
	  var table = layui.table;
	  //第一个实例
	  table.render({
	    elem: '#demo'
	    ,url: '/work5/menuController/selectMenu.do' //数据接口
	    ,where:{menu_name:menu_name}
	    ,page: true //开启分页
	    ,cols: [[ //表头
	        {type: 'checkbox', fixed: 'left'}
	      ,{field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
	      ,{field: 'menu_code', title: '菜单编号'}
	      ,{field: 'menu_name', title: '菜单名',edit: 'text'}
	      ,{field: 'menu_url', title: '菜单路径'} 
	      ,{fixed: 'right', title:'操作', toolbar: '#barDemo'}
	    ]],
	    parseData:function(res){
	    	return{
	    		"code":"0",
	    		"count":res.count,
	    		"data":res.menu
	    	}
	    }
	    ,request: {
		    pageName: 'pageIndex' //页码的参数名称，默认：page
		    ,limitName: 'pageLimit' //每页数据量的参数名，默认：limit
		 }
	  });
	  
	    //修改
	    table.on('edit(test)', function(obj){ 
	        $.ajax({
	        	url:"/work5/menuController/update.do",
	        	data:{menu_code:obj.data.menu_code,menu_name:obj.value},
	        	dataType:'json',
	        	type:'post',
	        	traditional:true,
	        	success:function(data){
	        		if(data==1){
	        			layer.msg('修改成功');
	        		}else if(data==2){
	        			layer.msg('最高级别无法修改');
	        		}
	        	}
	        })
	  	});
	  
	});
}
	
	

/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
*/
/*管理员-增加*/
function admin_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*管理员-删除*/
function admin_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}

/*管理员-编辑*/
function admin_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*管理员-停用*/
function admin_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		
		$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_start(this,id)" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">已禁用</span>');
		$(obj).remove();
		layer.msg('已停用!',{icon: 5,time:1000});
	});
}

/*管理员-启用*/
function admin_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_stop(this,id)" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
		$(obj).remove();
		layer.msg('已启用!', {icon: 6,time:1000});
	});
}
</script>
</body>
</html>