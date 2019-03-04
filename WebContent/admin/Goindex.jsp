<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录界面</title>
<link rel="shortcut icon" href="../img/favicon.ico" type="image/ico">
<script type="text/javascript" src="../js/jQuery.js"></script>
</head>
<style>
	body,div{
		margin:0;
		padding: 0;
	}
	#login{
	border-top-right-radius: 5px; 
border-top-left-radius: 5px; 
border-bottom-right-radius:5px;
border-bottom-left-radius:5px;

	color:white;
	
	
		width: 400px;
		height: 250px;
		background: #FFF0;
		margin:200px auto;
		position: relative;
		color: #fff;
	}
	
	#login h1{
		text-align:center;
		position:absolute;
		left:120px;
		top:-10px;
		font-size:21px;
	}
	#login form div {
		text-align: center;
		font-size:13px;
	}
	#username{
		background:url(../img/user.png) rgba(0,0,0,.1) no-repeat;
		width: 200px;
		height: 30px;
		border:solid #ccc 1px;
		border-radius: 3px;
		padding-left: 32px;
		margin-top: 50px;
		margin-bottom: 10px;
		color:white;
	}
	#password{
		background: url(../img/pwd.png) rgba(0,0,0,.1) no-repeat;
		width: 200px;
		height: 30px;
		border:solid #ccc 1px;
		border-radius: 3px;
		padding-left: 32px;
		margin-top:10px;
		margin-bottom: 10px;
		color:white;
	}
	#btn{
	margin-top:10px;
		width: 232px;
		height: 30px;
		background: rgba(0,0,0,.1);
		border:solid #ccc 1px;
		border-radius: 3px;
		margin-bottom: 20px;
	}
	#btn:hover{
		cursor: pointer;
		background:#D8D8D8;
	}
	a {font-size:16px;
	text-decoration:none;
	
	} 
	
	 a:active:{color: red; 
	 }
	 a:hover {color: red; text-decoration:underline;
	 } 

</style>
<body style="background-image: url('../img/admin_background.jpg' )">
<div id="login">
		<form action="login" method="post">
			<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户登录</h1>
			<div>
				<input type="text" placeholder="用户名"  name="userinfo.userAccount"   id="username" /><div id="statuss"></div>
			</div>
			<div>
				<input type="password" placeholder="密码" name="userinfo.userPwd"  id="password" /><div id="status"></div>
			</div>
			<div>
				<input  type="submit"  value="登录"  id="btn"/></div>
		</form>
</div>
<script type="text/javascript">
$("#btn").click(function() {
	var username = $("#username").val();
	var password = $("#password").val();
	 if(username=="" & password ==""){
		 $("#statuss").html("用户名不能为空");
		 $("#status").html("密码不能为空");
			return false;
	 }else if(username==""){
				$("#statuss").html("用户名不能为空");
				$("#status").html("");
				return false;
				}else  if(password ==""){
					$("#statuss").html("");
			$("#status").html("密码不能为空");
				return false;
			} else {
			   return true;
		}
			
	
});

</script>
</body>
</html>