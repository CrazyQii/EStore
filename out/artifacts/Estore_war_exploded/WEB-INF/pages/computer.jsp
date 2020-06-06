<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<script type="text/javascript" src="<%=jsUrl%>jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=jsUrl%>bootstrap.min.js"></script>
<%@ include file="/commons/queryCondition.jsp" %>

</head>

<body>
	<%@ include file="/commons/header.jsp"%>
	
	<center>
		<div class="thumbnail">
			<img src="${computer.url }" style="width:180px;height:240px;"/>
		</div>
		<div class="caption">
		<br>
		科目：${computer.brand}
		<br>
		学科: ${computer.model }
		<br>
		价格: ￥ ${computer.price }
		<br>
		发布时间: ${computer.publishingDate }
		<br><br>
		<div style="width: 35%;">商品简介: ${computer.remark }</div>
		<br>
		
		<a href="computerServlet?method=getComputers&pageNo=${param.pageNo }" class="btn btn-default">继续购物</a>
		<a href="computerServlet?method=addToCartInside&pageNo=${computerpage.pageNo }&id=${computer.id}&model=${computer.model}&brand=${computer.brand}" class="btn btn-primary addToCart" role="button"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> 加入购物车</a> 
		</div>
		
	</center>
	<%@ include file="/commons/footer.jsp"%>
</body>
</html>