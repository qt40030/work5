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
	<form class="layui-form layui-form-pane" method="post">
<div class="layui-form-item">



<label class="layui-form-label">菜单名称</label>
      <div class="layui-input-inline">
        <input type="text" name="menu_name" autocomplete="off" id="menu_name" class="layui-input" placeholder="请输菜单名称" lay-verify="required">
      </div>
      <label class="layui-form-label">菜单编号</label>
      <div class="layui-input-inline">
        <input type="text" name="menu_code" autocomplete="off" id="menu_code" class="layui-input" placeholder="请输编号" lay-verify="required">
      </div>

</div>

<div class="layui-form-item">

  <div class="layui-form-item">
  </div>
   				<label class="layui-form-label">选择分类</label>
				<div class="layui-input-inline">
					<select name="parentcode" id="parent_code">
						<option value="">请选择分类</option>
					</select>
				</div>
</div>


<div class="layui-form-item" style="height: 150px">

  <div class="layui-form-item">
  </div>
   <label class="layui-form-label">菜单URL</label>
    <div class="layui-input-block">
      <input type="text" id="menu_url" lay-verify="title" autocomplete="off" placeholder="请输入URL" class="layui-input" lay-verify="required">
    </div>
</div>

<div class="layui-form-item">
    <div class="layui-input-inline">
      <input value="确定" type="button" class="layui-btn" lay-submit lay-filter="reg"/>
    </div>
    <input value="关闭" type="button" class="layui-btn" id="login">
 </div>
    <input type="hidden" name="action" value="reg">
</form>
</article>

<script type="text/javascript">
var form=layui.form;
form.on('submit(reg)', function(data){
$.ajax({
	url:"/work5/menuController/insert2.do",
	data:{menu_code:$("#menu_code").val(),menu_name:$("#menu_name").val(),menu_url:$("#menu_url").val(),parent_code:$("#parent_code").val()},
	dataType:'json',
	type:'post',
	success:function(data){
		if(data==1){
			alert('添加成功');
			var index = parent.layer.getFrameIndex(window.name); //得到当前iframe层的索引
			parent.layer.close(index);
		}else if(data==0){
			layer.msg('编号已存在');
		}else{
			layer.msg('添加失败');
		}
	}
})
});

init()
function init() {
	$.ajax({
		url : "/work5/menuController/menu2.do",
		dataType : 'json',
		type : 'post',
		success : function(data) {
			console.log(data)
			var html = '<option value="x">请选择</option>';
			$.each(data.menu, function(i, dom) {
				html += '<option value="' + dom.menu_code + '">' + dom.menu_name
						+ '</option>'
			});
			$("select[name='parentcode']").html(html);
			form.render("select");
		}
	})
}
</script> 

</body>
</html>