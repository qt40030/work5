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
<script type="text/javascript" src="/work5/common/layui/layui.all.js"></script>
<title>添加管理员 - 管理员管理 - H-ui.admin v3.1</title>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-admin-add" method="post">
	
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>菜单编号：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" value="" placeholder="" id="menu_code" name="menu_code">
		</div>
	</div>

	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>菜单名称：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" value="" placeholder="" id="menu_name" name="menu_name">
		</div>
	</div>


	<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
			<input class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;" lay-submit lay-filter="reg">
		</div>
	</div>
	</form>
</article>

<script type="text/javascript">
var form=layui.form;
form.on('submit(reg)', function(data){
$.ajax({
	url:"/work5/menuController/insert1.do",
	data:{menu_code:$("#menu_code").val(),menu_name:$("#menu_name").val()},
	dataType:'json',
	type:'post',
	success:function(data){
		if(data==1){
			alert('添加成功');
			var index = parent.layer.getFrameIndex(window.name); //得到当前iframe层的索引
			parent.layer.close(index);
		}else if(data==0){
			layer.msg('账号已存在');
		}else if(data==3){
			layer.msg('验证码错误');
		}else{
			layer.msg('添加失败');
		}
	}
})
});
</script> 

</body>
</html>