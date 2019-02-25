<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
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
<style type="text/css">
.element.style {
    width: 80px;
}
</style>
</head>
<body>
<article class="page-container">
	<form class="layui-form layui-form-pane" method="post">
<div class="layui-form-item">
<label class="layui-form-label">账号</label>
      <div class="layui-input-inline">
        <input type="text" name="user_code" autocomplete="off" id="user_code" class="layui-input" placeholder="请输入账号" lay-verify="required" readonly="readonly">
      </div>
<label class="layui-form-label">姓名</label>
      <div class="layui-input-inline">
        <input type="text" name="user_name" autocomplete="off" class="layui-input" placeholder="请输入姓名" lay-verify="required" readonly="readonly">
      </div>
</div>
<div class="layui-form-item" style="height: 50px">

  <div class="layui-form-item">
    <label class="layui-form-label">职务：</label>
    <div class="layui-input-block"  style="width:190px">
      <select name="role_name" id="role_name">
				<option value="老板">老板</option>
				<option value="经理">经理</option>
				<option value="管理员">管理员</option>
      </select>
    </div>
  </div>
  
</div>
<div class="layui-form-item" id="rights">

  <div class="layui-form-item" style="height: 200px">
    <label class="layui-form-label">权限</label>
    <div class="layui-input-block">
    <c:forEach items="${menu}" var="menu">
    <label class="layui-form-label">${menu.menu_name}</label>
				<c:forEach items="${menu.list}" var="list">
				 <input type="checkbox" name="aa${list.menu_code}" title="${list.menu_name}" value="${list.menu_code}">
				</c:forEach>
				 <br>
				  <br>
		</c:forEach>
    </div>
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
init()
function init() {
	var user_code='<%=request.getParameter("user_code")%>'
		var user_name='<%=request.getParameter("user_code")%>'
		var role_name='<%=request.getParameter("role_name")%>'
		$("input[name='user_code']").val(user_code);
		$("input[name='user_name']").val(user_name);
		$("#role_name").val(role_name)
	$.ajax({
		url : "/work5/rightsController/select.do",
		data:{role_code:$("#user_code").val()},
		dataType : 'json',
		type : 'post',
		success : function(data) {
			$.each(data.rights, function(i, dom) {
				$("input[name='aa"+dom.menu_code+"']").prop("checked", true);
			});
			form.render("checkbox");
			}	
	})
}

form.on('submit(reg)', function(data){

	var bool = false;
	var menu_code2 = new Array();
	$("input[name^='aa']:checked").each(function(i, d) {
		menu_code2.push(d.value);
	})
    $.ajax({
	url:"/work5/rightsController/reg.do",
	data:{role_code:$("#user_code").val(),aa:menu_code2},
	dataType:'json',
	type:'post',
	traditional:true,
	success:function(data){
		if(data==1){
			alert('添加成功');
		}else if(data==0){
			layer.msg('最高级别无法修改');
		}
	}
})
});
form.render("select");
form.render("checkbox");
</script> 

</body>
</html>