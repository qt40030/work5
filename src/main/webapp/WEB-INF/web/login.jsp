<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<title>Login One</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/work5/ccps/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="/work5/ccps/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="/work5/ccps/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
	<link href="/work5/ccps/css/templatemo_style.css" rel="stylesheet" type="text/css">	
	<script type="text/javascript" src="/work5/common/layui/layui.all.js"></script>
    <script type="text/javascript" src="/work5/common/js/jquery-3.3.1.js"></script>

</head>
<body class="templatemo-bg-gray">
	<div class="container">
		<div class="col-md-12">
			<h1 class="margin-bottom-15">用户登录</h1>
			<form class="form-horizontal templatemo-container templatemo-login-form-1 margin-bottom-30 layui-form" onsubmit="return false" >				
		        <div class="form-group">
		          <div class="col-xs-12">		            
		            <div class="control-wrapper">
		            	<label for="username" class="control-label fa-label"><i class="fa fa-user fa-medium"></i></label>
		            	<input type="text" class="form-control" id="username" name="user_code" placeholder="Username">
		            </div>		            	            
		          </div>              
		        </div>
		        <div class="form-group">
		          <div class="col-md-12">
		          	<div class="control-wrapper">
		            	<label for="password" class="control-label fa-label"><i class="fa fa-lock fa-medium"></i></label>
		            	<input type="password" class="form-control" name="user_pass" id="password" placeholder="Password">
		            </div>
		          </div>
		        </div>
		        <div class="form-group">
		          <div class="col-md-12">
	             	<div class="checkbox control-wrapper">
	                	<label>
	                  		<input type="checkbox"> 记住密码
                		</label>
	              	</div>
		          </div>
		        </div>
		        <div class="form-group">
		          <div class="col-md-12">
		          	<div class="control-wrapper">
		          		<input type="button" value="Log in" class="btn btn-info" lay-submit lay-filter="login">
		          		<a href="http://localhost:8080/work5/jump/forgotpassword.do" class="text-right pull-right">忘记密码?</a>
		          	</div>
		          </div>
		        </div>
		        <hr>
		        <div class="form-group">
		        	<div class="col-md-12">
		        		<label>Login with: </label>
		        		<div class="inline-block">
		        			<a href="#"><i class="fa fa-facebook-square login-with"></i></a>
			        		<a href="#"><i class="fa fa-twitter-square login-with"></i></a>
			        		<a href="#"><i class="fa fa-google-plus-square login-with"></i></a>
			        		<a href="#"><i class="fa fa-tumblr-square login-with"></i></a>
			        		<a href="#"><i class="fa fa-github-square login-with"></i></a>
		        		</div>		        		
		        	</div>
		        </div>
		      </form>
		      <div class="text-center">
		      	<a href="http://localhost:8080/work5/jump/create-account.do" class="templatemo-create-new">创建账户<i class="fa fa-arrow-circle-o-right"></i></a>	
		      </div>
		</div>
	</div>
	<script type="text/javascript">

	var form=layui.form;
	form.on('submit(login)', function(data){
	$.ajax({
		url:"/work5/user/login.do",
		data:data.field,
		dataType:'text',
		type:'post',
		success:function(data){
			if(data==0){
				location.href="http://localhost:8080/work5/jump/index.do"
			}else if(data==1){
				location.href="http://localhost:8080/work5/jump/index.do"
			}else if(data==2){
				layer.msg('账号或密码错误');
			}
			else if(data==3){
				layer.msg('验证码错误');
			}
		}
	})
	});
	</script>
</body>
</html>