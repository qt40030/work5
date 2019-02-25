var con = {
	app : "/work4"
};
var form = layui.form;
var $ = layui.jquery;
var layer = layui.layer;
var element = layui.element;
var laypage = layui.laypage;

// layui.use(['form','layer','jquery'], function () {
// var form = layui.form;// 获取操作对象
// var $ = layui.jquery;
// ...
// });

// 强烈不推荐下面的做法
// var form,$;
// layui.use(['form','layer','jquery'], function () {
// form = layui.form;// 获取操作对象
// $ = layui.jquery;
// ...
// });

function goJspLogin() {
	location.href = con.app + '/web/login.jsp';
}
function goJspReg() {
	location.href = con.app + '/web/reg.jsp';
}
function goLogout() {
	openConfirm(function(index) {
		layer.close(index);
		location.href = con.app + "/UserServlet?action=logout";
	}, '确定注销？');
}
function openConfirm(func, title) {
	title = title ? title : "确定进行该操作？";
	layer.confirm(title, {
		icon : 3,
		title : '提示'
	}, func);
}

function formSubmit(url, submit, dataType, func) {
	form.on(submit, function(data) {
		ajax(url, data.field, dataType, func);
	});
}
function ajax(url, field, dataType, func) {
	$.ajax({
		url :url,
		data : field,
		dataType : dataType,
		type : 'post',
		success : func
	});
}
function openLayer(url, end) {
	layer.open({
		type : 2,
		area : [ '800px', '450px' ],
		fixed : false, // 不固定
		maxmin : true,
		end : end,
		content : con.app + url
	});
}
function closeThis(time) {
	time = time ? time : 200;
	setTimeout(function() {
		// 先得到当前iframe层的索引
		var index = parent.layer.getFrameIndex(window.name);
		parent.layer.close(index);
	}, time)
}
function setPageInfo(elem, count, curr, limit, jump) {
	laypage.render({
		elem : elem,
		count : count,
		curr : curr,
		limit : limit,
		layout : [ 'count', 'prev', 'page', 'next', 'limit', 'skip' ],
		jump : jump
	});
}
