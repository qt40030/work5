<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
	<title>Forgot Password</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="/work5/ccps/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="/work5/ccps/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="/work5/ccps/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
	<link href="/work5/ccps/css/templatemo_style.css" rel="stylesheet" type="text/css">	
<script type="text/javascript" src="/work5/ccps/lib/jquery/1.9.1/jquery.min.js"></script> 
<link rel="stylesheet" type="text/css" href="/work5/common/layui/css/layui.css"></link>
<script type="text/javascript" src="/work5/common/layui/layui.js"></script>
<script src="/work5/common/echarts/echarts.min.js"></script>

</head>
<body class="templatemo-bg-gray">
	<div class="container">
		<div class="col-md-12">
			<h1 class="margin-bottom-15">Password Reset</h1>
			<form class="form-horizontal templatemo-forgot-password-form templatemo-container" role="form" action="#" method="post">	
				<div class="form-group">
		          <div class="col-md-12">
		          	Please enter your email address that you registered in our website.
		          </div>
		        </div>		
		        <div class="form-group">
		          <div class="col-md-12">
		            <input type="text" class="form-control" id="user_code" placeholder="Your email">	            
		          </div>              
		        </div>
		        <div class="form-group">
		          <div class="col-md-12">
		            <input type="button" value="确定" class="btn btn-danger" onclick="init()">
                    <br><br>
                    <a href="login-1.html">Login One</a> |
                    <a href="login-2.html">Login Two</a>
		          </div>
		        </div>
		      </form>
		</div>
	</div>
	
	<script type="text/javascript">
	function init(){
		$.ajax({
			url:"/work5/user/sel.do",
			data:{user_code:$("#user_code").val()},
			dataType:'json',
			type:'post',
			success:function(data){
				if(data==1){
					reg()
				}else {
					alert('无此用户')
				}
			}
		})
	}

	function reg(){
		$.ajax({
			url:"/work5/user/send.do",
			data:{user_code:$("#user_code").val()},
			dataType:'json',
			type:'post',
			success:function(data){
				if(data==1){
					alert('发送成功');
					inst()
				}else {
					alert('发送失败')
				}
			}
		})
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
			content:'/work5/jump/pass.do'
		});
	}
	</script>
</body>
</html>