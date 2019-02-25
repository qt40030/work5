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



<label class="layui-form-label">用户ID</label>
      <div class="layui-input-inline">
        <input type="text" name="cust_code" autocomplete="off" id="cust_code" class="layui-input" placeholder="请输ID" lay-verify="required">
      </div>
   				<label class="layui-form-label">选择分类</label>
				<div class="layui-input-inline">
					<select name="parentcode" id="parent_code">
						<option value="">请选择分类</option>
					</select>
				</div>

</div>

<div class="layui-form-item">

  <div class="layui-form-item">
  </div>
        <label class="layui-form-label">商品数量</label>
      <div class="layui-input-inline">
        <input type="text" name="count" autocomplete="off" id="count" class="layui-input" placeholder="请输数量" lay-verify="required">
      </div>
   				<label class="layui-form-label">选择分类</label>
				<div class="layui-input-inline">
					<select name="status" id="status">
						<option value="">请选择分类</option>
						<option value="已付款">已付款</option>
						<option value="未付款">未付款</option>
					</select>
				</div>
</div>


<div class="layui-form-item" style="height: 150px">

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
	url:"/work5/orderController/insert.do",
	data:{user_code:'${usercode}',cust_code:$("#cust_code").val(),count:$("#count").val(),goods_code:$("#parent_code").val(),status:$("#status").val()},
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
		url : "/work5/goodsController/selectGoods.do",
		dataType : 'json',
		type : 'post',
		success : function(data) {
			console.log(data)
			var html = '<option value="x">请选择</option>';
			$.each(data.goods, function(i, dom) {
				html += '<option value="' + dom.goods_name + '">' + dom.goods_name
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