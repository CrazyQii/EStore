<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
	String jsUrl=request.getContextPath()+"/public/js/";
	String cssUrl=request.getContextPath()+"/public/css/";
	String imgUrl=request.getContextPath()+"/public/img/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品详情  ${computer.model} </title>
<link href="<%=cssUrl%>bootstrap.min.css" rel="stylesheet">

<link href="<%=cssUrl%>index.css" rel="stylesheet">
<link href="<%=cssUrl%>computer.css" rel="stylesheet">

<script type="text/javascript" src="<%=jsUrl%>jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=jsUrl%>bootstrap.min.js"></script>
</head>

<body>
	<%@ include file="/commons/header.jsp"%>

	<div class="center">
		<div class="center-top" style="width: 100%; margin-top: 2rem;">
			<div>
				<video width="100%" controls>
					<source src="${computer.video_url}" type="video/mp4">
				</video>
			</div>

			<div class="center-content">
				<div style="display: flex; margin-top: 4rem; overflow: hidden;">
					<img src="${computer.teacher }" style="width:180px;height:240px; float: left;"/>
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">${computer.model}</h5>
							<p>科目：${computer.brand}</p>
							<p>价格: ￥ ${computer.price }</p>
							<p>销量：${computer.salesAmount}</p>
							<p>发布时间: ${computer.publishingDate }</p>
						</div>
					</div>
				</div>

				<h3 style="padding-bottom: 1rem; border-bottom: 1px solid darkgrey;">课程亮点</h3>

				<ul class="list-group">${computer.remark }</ul>

			</div>
			<div>
				<h3 style="padding-bottom: 1rem; border-bottom: 1px solid darkgrey;">用户评价 <button type="button" class="btn btn-primary" style="float:right;" data-toggle="modal" data-target="#exampleModal">我来评价</button>
				</h3>
				<div class="list-group">
					<c:forEach items="${comments}" var="comment">
						<a href="#" class="list-group-item list-group-item-action">
							<div class="d-flex w-100 justify-content-between">
								<h5 class="mb-1">${comment.user}</h5>
								<small>${comment.time}</small>
							</div>
							<p class="mb-1">${comment.content}</p>
						</a>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="caption">
			<div class="caption-content">
				<div style="background-color: rgba(127,51,0,.1); padding: 2rem; margin-top: 2rem;">
					<h3 align="center">课程大纲</h3>
					${computer.syllabus }
				</div>

				<h3>购买须知</h3>
				<div>
					<ol style="margin-left: -2rem;">
						<li>《${computer.model }》为“图文+音频”课程，课程内容已经更新完毕。</li>
						<li>本课程为产品（${computer.price }元），购买成功后即可永久阅读所有内容；</li>
						<li>本课程为虚拟内容服务，一经购买成功概不退款，请你理解。</li>
					</ol>
				</div>
			</div>
		
			<a href="computerServlet?method=getComputers&pageNo=${param.pageNo }" class="btn btn-default">继续购物</a>
			<a href="computerServlet?method=addToCartInside&pageNo=${computerpage.pageNo }&id=${computer.id}&model=${computer.model}&brand=${computer.brand}" class="btn btn-primary addToCart" role="button"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> 加入购物车</a>
			</div>
	</div>

	<div class="modal fade" id="exampleModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">我要评价</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="computerServlet" method="get">
						<input type="text" hidden="hidden" name="method" value="addComment">
						<input type="text" hidden="hidden" name="computerId" value="${computer.id}">
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">我的昵称:</label>
							<input type="text" class="form-control" id="recipient-name" name="user" required>
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">评价内容:</label>
							<textarea class="form-control" id="message-text" name="content" required></textarea>
						</div>
						<button type="submit" class="btn btn-primary">提交</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
					</form>
				</div>
			</div>
		</div>
	</div>


	<script>
		$('#exampleModal').on('show.bs.modal', function (event) {
			var button = $(event.relatedTarget) // Button that triggered the modal
			var modal = $(this)
		})
	</script>
	<%@ include file="/commons/footer.jsp"%>


</body>
</html>