<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>多引擎搜索</title>
		<link rel="shortcut icon" href="img/favicon.ico" type="image/ico">
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
		<script src="js/jQuery.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			#Searchtext {
				width: 400px;
			}
			
			.ifd1iv {
				width: 100%;
			}
			
			#headd {
				height: 55px;
				z-index: 3;
				background-color: #ececec;
				display: block;
				overflow: visible;
				top: 0;
				left: 0;
				text
			}
			#sou_ul{
				display: inline-block;
			}
			 iframe {
			 padding-top:-40px; width:100%;
    		}
    		.homediv{
    			width: 70px;
    			height: 54px;
    			padding: 10px 20px;
    			display: inline-block;
    		}
    		#sou_div{
    			display: inline-block;
    			margin-left: 100px;
    		}
    		#sou_ul li{
    			margin-right: 80px;
    			width: 70px;
    			height: 21px;
    			cursor: pointer;  
    			transition: all 0.5s;
    		}
			#sou_ul li img{
				width: 34px;
				height: 34px;
				border:	 1px #bcbcbc  solid;
			}
			#sou_ul li:hover {
				transform: scale(1.3, 1.3);
			}
			.homediv{
			cursor: pointer;  
    			transition: all 0.5s;
			}
			.homediv:hover {
				transform: scale(1.3, 1.3);
			}
		</style>
		
		<script type="text/javascript">
			$(function(){
				
				
				
				var flag = $("#sou_flag").val();
				  if(flag=="bd"){
					  $("iframe").attr("src","https://www.baidu.com/s?wd="+$("#Searchtext").val());
						$("#from1").attr("action","https://www.baidu.com/s?wd=");
						$("#Searchtext").attr("name","wd");
				  }else if(flag=="bing"){
					  $("iframe").attr("src","https://cn.bing.com/search?q="+$("#Searchtext").val());
					  $("#from1").attr("action","https://cn.bing.com/search?q=");
					  $("#Searchtext").attr("name","q");
				  }
				  
				
				
				$("#sou_ul img").click(function(){
					var baidu="https://www.baidu.com/s?wd=";
					var bing="https://cn.bing.com/search?q=";
					var sougou="https://www.sogou.com/web?query=";
					var s360="https://www.so.com/s?q=";
					var action=$("#from1").attr("action");
					
					var ttext=$(this).attr("title");
					
					
					var sou=$("#Searchtext").val();
					if(ttext == '百度'){
						$("iframe").attr("src",baidu+sou);
						$("#from1").attr("action",baidu);
						$("#Searchtext").attr("name","wd");
					}else if(ttext == '必应'){
						$("iframe").attr("src",bing+sou);
						$("#from1").attr("action",bing);
						$("#Searchtext").attr("name","q");
					}else if(ttext == '搜狗'){
						$("iframe").attr("src",sougou+sou);
						$("#from1").attr("action",sougou);
						$("#Searchtext").attr("name","query");
					}else if(ttext == '360搜索'){
						$("iframe").attr("src",s360+sou);
						$("#from1").attr("action",s360);
						$("#Searchtext").attr("name","q");
					}
				});
				
				
			});
		</script>
	</head>

	<body>
	<input type="text" id="sou_flag" value="${sou_flag}" style="display: none">
		<form id="from1" action="https://www.baidu.com/s?wd=" method="get" target="content" class="form-inline" >
	<div id="headd">
			<div class="homediv"><a href="index"><img src="img/home.png" style="border: 1px #bcbcbc  solid;" width="34" height="34" class="img-circle"></a></div>
			<input name="q" type="text" value="${Searchtext}" class="form-control" id="Searchtext">
			<div id="sou_div">
			<ul class="nav nav-pills" id="sou_ul">
				<li role="presentation">
					<img src="img/sou_baidu.png" width="34px" height="34px" class="img-circle" title="百度" />
				</li>
				<li role="presentation">
					<img src="img/sou_bing.png" width="34px" height="34px" class="img-circle"  title="必应" />
				</li>
				<li role="presentation">
					<img src="img/sou_sogou.png" width="34px" height="34px" class="img-circle"  title="搜狗" />
				</li>
				<li role="presentation">
					<img src="img/sou_360.png"   width="34px" height="34px" class="img-circle"  title="360搜索" />
				</li>
			</ul>
			</div>
		</div>
		</form>
		<div class="ifdiv">
		<iframe src="https://www.baidu.com"  height="850px" frameborder="0" name="content"></iframe>
		</div>
	</body>
</html>