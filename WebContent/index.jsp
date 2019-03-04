<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>微搜</title>
		<link rel="shortcut icon" href="img/favicon.ico" type="image/ico">
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
		<script src="js/jQuery.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			* {
				padding: 0;
				margin: 0;
				box-sizing: border-box;
			}
			
			body {
				background-image: url(img/bj.jpg);
			}
			
			a {
				transition: all 0.5s;
				color: #000000;
			}
			
			.col-md-2 {
				transition: all 0.5s;
			}
			
			.col-md-2:hover {
				transform: scale(1.1, 1.1);
			}
			
			a:hover {
				text-decoration: none;
			}
			
			.logo img {
				display: block;
				width: 20%;
				height: 20%;
				margin: 80px auto;
			}
			
			.logo img:hover {
				opacity: 0.4;
			}
			
			.search {
				width: 800px;
				margin: 0 auto;
			}
			
			.content {
				margin-top: 80px;
				height: auto;
				background: #F7F7F7;
				border-radius: 5px;
			}
			
			.content ul {
				margin: 10px auto;
			}
			
			.Opacity {
				opacity: 0.8;
			}
			
			.aaa {
				opacity: 1;
			}
			
			.img {
				opacity: 0.8;
			}
			
			.nav-tabs>li {
				width: 90px;
			}
			
			@media (min-width: 1200px) {
				.container {
					width: 970px;
				}
			}
			#Searchtext{
				font-size: 20px;
			}
		</style>

		<script type="text/javascript">
			$(function() {
				
				$("#Searchtext").focus(function() {
					$("#urlbody").fadeOut(300);
					$("img").addClass("img");
					$("#divAdd").hide();
					//					$("#logo").addClass("aaa");
					//					$("#logo").removeClass("Opacity");
				});
				$("#Searchtext").blur(function() {
					$("#urlbody").fadeIn(300);
					$("img").removeClass("img");
				});
				
				$("ul li:first").addClass("active");
				
				$(".tab-content div:first").addClass("active");
				
				$("#close").click(function() {
						$("#divAdd").hide();
				});
		
				   
				   
				   $("#submitBtn").click(function() {
					   if($("#categoryPic").val()==""){
						   alert("图片为空");
							return false;
							}else  if($("#name").val()==""){
						   alert("网址名称为空");
							return false;
							}else if($("#webLink").val()==""){
						   alert("网址为空");
							return false;
						} else {
						   return true;
					}
						
				});
				   
				   $("#logo img").click(function () {
					   var a=$(this).attr("id");
					if(a=="bd"){
						$("#bd").hide();
						$("#bing").fadeIn();
						$("#sou_flag").val("bing");
					}else if (a=="bing") {
						$("#bing").hide();
						$("#bd").fadeIn();
						$("#sou_flag").val("bd");
					}
				});
				   
				   
				   
				   

			});
			function btnAdd(uid){
				 $("#divAdd").fadeIn(1000);
				 $("#add_uid").attr('value',uid);
			 };
			 
			  function  addurl(){
				   var urlName = $(this).val();
			        var page = "url_update";
			        var uid = $(this).attr("uid");
			        var parentSpan = $(this);
			        parentSpan.css("border","1px solid green");
			        $.post(
			                page,
			                {"urlinfo.urlName":urlName,"urlinfo.uid":uid},
			                function(result){
			                    if("success"==result)
			                        parentSpan.css("border","1px solid green");
			                    else
			                        parentSpan.css("border","1px solid red");
			                });
			   }
			  
			  
			  
		</script>
	</head>

	<body>
		<div class="container logo" id="logo">
			<a href="#"><img src="img/logo_baidu.png" title="点击切换" id="bd"/></a>
			<a href="#"><img src="img/logo_bing.png" title="点击切换" id="bing" style="display:  none;"/></a>
		</div>

		<div class="search" id="Search">
		<form action="metaSearch" method="post">
		<input type="text" name="sou_flag" value="bd" style="display: none;" id="sou_flag">
				<div class="input-group">
					<input id="Searchtext" name="Searchtext" type="text" class="form-control" placeholder="" style="height: 50px;">
					<span class="input-group-btn">
        		<button id="but_sou" class="btn btn-block" type="submit" style="height: 50px;"> 搜 一 下 ~</button>
      				</span>
				</div>
		</form>
		</div>
		<div class="container content" id="urlbody">
				<ul class="nav nav-pills nav-justified" role="tablist">
			<s:iterator id="um" value="urlsortinfos">
					<li role="presentation">
					<a href="#${um.urlsortId}" aria-controls="${um.urlsortId}" role="tab" data-toggle="tab">${um.urlsortName}</a>
					</li>
			</s:iterator>
				</ul>
				
			<div class="tab-content col-md-12 col-xs-12">
				<s:iterator id="um" value="urlsortinfos">
					<div role="tabpanel" class="tab-pane" class="asd"  id="${um.urlsortId}">
						<s:iterator id="uu" value="#um.urlinfos">
							<div class="col-md-2 col-xs-2" style="text-align: left; height: 55px">
								<a href="${uu.urlWeblink}"><img  src="img/ico/${uu.uid}.jpg" width="32px" height="32px" class="img-rounded" />${uu.urlName}</a>
							</div>
						</s:iterator>
						<div class="col-md-2 col-xs-2" style="text-align: left; height: 55px">
						<button type="button" uid="${um.urlsortId}" class="btn btn-default" value="${um.urlsortId }" onclick="btnAdd(${um.urlsortId })">点击添加</button>
							</div>
					</div>
				</s:iterator>
			</div>
		</div>

<div class="panel panel-warning addDiv" id="divAdd" style="display: none;width: 20%;margin: 0 auto;" align="center">
	  <div class="panel-heading">新增分类<span style="float:right;color:red;" id="close">X</span></div>
	  <div class="panel-body">
	    	<form method="post" id="addForm" action="urlinsert" enctype="multipart/form-data" > 
	    	<input type="text" id="add_uid" name="urlsortinfo.urlsortId" value="" style="display: none;">
	    		<table  class="addTable">
	    			<tr>
						<td>网站LOGO</td>
						<td>
							<input type="file" name="img" id="categoryPic">
						</td>
					</tr>
					<tr>
						<td>网页名称</td>
						<td>
							<input type="text" name="urlinfo.urlName" class="form-control" id="name">
						</td>
					</tr>
					<tr>
						<td>网页链接</td>
						<td>
							<input type="text" name="urlinfo.urlWeblink" class="form-control" id="webLink">
						</td>
					</tr>
				
					<tr class="submitTR">
						<td colspan="2" align="center">
							<button type="submit" id="submitBtn" class="btn btn-success">提  交</button>
						</td>
					</tr>
				</table>
	    	</form> 
	  </div>
	</div>

	</body>

</html>