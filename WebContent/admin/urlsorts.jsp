<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>后台管理</title>
<link rel="shortcut icon" href="../img/favicon.ico" type="image/ico">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="../css/style.css" />
		<script src="../js/jQuery.js" type="text/javascript" charset="utf-8"></script>
		<script src="../js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
	$(function() {
		
	
		$("input.urlsortName").keyup(function(){
	        var urlsortName = $(this).val();
	        var page = "urlsort_update";
	        var urlsortId = $(this).attr("urlsortId");
	        var parentSpan = $(this);
	        parentSpan.css("border","1px solid green");
	        $.post(
	                page,
	                {"urlsortinfo.urlsortName":urlsortName,"urlsortinfo.urlsortId":urlsortId},
	                function(result){
	                    if("success"==result)
	                        parentSpan.css("border","1px solid green");
	                    else
	                        parentSpan.css("border","1px solid red");
	                });
	   });
		
		$("#submitBtn").click(function() {
			   if($("#name1").val()==""){
				   alert("分类名称为空");
					return false;
			   }else{
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
					<th>网址分类管理</th>
					<th>分类下的网址修改</th>
					<th>删除</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${urlsortinfos}" var="u">
					<tr>
						<td>${u.urlsortId}</td>
						<td>
						<input class="urlsortName" type="text" urlsortId="${u.urlsortId}" name="urlsortinfo.urlsortName" value="${u.urlsortName}">
						</td>
						<td><a href="url_findBysortId?urlsortinfo.urlsortId=${u.urlsortId}"> <span class="glyphicon glyphicon-th-list"></span></a></td>
						<td><a deleteLink="true" href="urlsort_delete?urlsortinfo.urlsortId=${u.urlsortId}"> <span
								class="glyphicon glyphicon-trash"></span></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="panel panel-warning addDiv">
	  <div class="panel-heading">新增分类</div>
	  <div class="panel-body">
	    	<form method="post" id="addForm" action="urlsort_insert" enctype="multipart/form-data1">
	    		<table class="addTable">
	    			<tbody><tr>
	    				<td>分类名称</td>
	    				<td><input id="name1" name="urlsortinfo.urlsortName" type="text" class="form-control"></td>
	    			</tr>
	    			<tr class="submitTR">
	    				<td colspan="2" align="center">
	    					<button type="submit" id="submitBtn" class="btn btn-success">提 交</button>
	    				</td>
	    			</tr>
	    		</tbody></table>
	    	</form>
	  </div>
	</div>
	
	</div>
</body>
</html>