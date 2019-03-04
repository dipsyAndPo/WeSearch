<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>后台管理</title>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<link rel="shortcut icon" href="../img/favicon.ico" type="image/ico">
<link rel="stylesheet" type="text/css" href="../css/style.css" />
		<script src="../js/jQuery.js" type="text/javascript" charset="utf-8"></script>
		<script src="../js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		
	<script type="text/javascript">
	$(function() {
	   $("input.urlName").keyup(function(){
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
	   });
	   
	   $("input.urlWeblink").keyup(function(){
	        var urlWeblink = $(this).val();
	        var page = "url_update";
	        var uid = $(this).attr("uid");
	        var parentSpan = $(this);
	        parentSpan.css("border","1px solid green");
	        $.post(
	                page,
	                {"urlinfo.urlWeblink":urlWeblink,"urlinfo.uid":uid},
	                function(result){
	                    if("success"==result)
	                        parentSpan.css("border","1px solid green");
	                    else
	                        parentSpan.css("border","1px solid red");
	                });
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
	   
	});
	</script>
</head>
<body>
<%@include file="admin_head.jsp"%>
<div style="width: 60%;margin: 0 auto;" align="center">
	<div class="listDataTableDiv">
		<table
			class="table table-striped table-bordered table-hover ">
			<thead>
				<tr class="success">
					<th>ID</th>
					<th>图片</th>
					<th>网址名称</th>
					<th>网址链接</th>
					<th>删除</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${urlinfos}" var="url">
					<tr>
						<td>${url.uid}</td>
						<td> <img  src="../img/ico/${url.uid}.jpg" width="32px" height="32px" class="img-rounded" /> </td>
						<td><input class="urlName" uid="${url.uid}" type="text" name="urlinfo.urlName" value="${url.urlName}"></td>
						<td><input class="urlWeblink" type="text" uid="${url.uid}" name="urlinfo.urlWeblink" value="${url.urlWeblink}"></td>
						<td><a deleteLink="true" href="url_delete?urlinfo.uid=${url.uid}&urlsortinfo.urlsortId=${url.urlsortinfo.urlsortId}"> <span
								class="glyphicon glyphicon-trash"></span></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="panel panel-warning addDiv">
	  <div class="panel-heading">新增分类</div>
	  <div class="panel-body">
	    	<form method="post" id="addForm" action="url_insert" enctype="multipart/form-data" >
	    	<input type="text" name="urlsortinfo.urlsortId" value="${urlsortinfo.urlsortId}" style="display: none;">
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
	
	</div>
</body>
</html>