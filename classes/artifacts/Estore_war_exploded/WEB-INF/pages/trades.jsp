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
<title>我的订单</title>
<link href="<%=cssUrl%>bootstrap.min.css" rel="stylesheet">

<link href="<%=cssUrl%>index.css" rel="stylesheet">
	<style>
		.card {
			-webkit-border-radius: 1rem;
			-moz-border-radius: 1rem;
			border-radius: 1rem;
			box-shadow: 6px 6px 5px #E3E3E3;
			background-color: #EDEDED;
			padding-bottom: 1rem;
			padding-top: 1rem;
		}
		.card:hover {
			box-shadow: 10px 10px 5px #EDEDED;
		}
	</style>
<script type="text/javascript" src="<%=jsUrl%>jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=jsUrl%>bootstrap.min.js"></script>
<%--<%@ include file="/commons/queryCondition.jsp" %>--%>
</head>
<body style="background-color:#FCFCFC;">
	<%@ include file="/commons/header.jsp"%>
	<div class="container">
		<div class="card-deck row">
			<c:forEach items="${tradeItem}" var="trade">
				<div class="card col-md-3" style="margin-top: 4rem; margin-right: 2rem;">
					<img src="${trade.computer.url}" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title" style="font-size: 20px; font-weight: 700;">${trade.computer.model}</h5>
						<p class="card-text">购买价格：${trade.computer.price } 元</p>
						<p class="card-text">购买数量：${trade.quantity }</p>
						<p class="card-text">购买时间：${trade.tradeTime}</p>
					</div>
					<div class="card-footer">
						<a href="/computerServlet?method=getComputer&id=${trade.computer.id}" style=""><button  class="btn btn-primary">查看课程</button></a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<%@ include file="/commons/footer.jsp"%>
</body>
</html>