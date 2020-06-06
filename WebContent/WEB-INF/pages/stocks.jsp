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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>库存管理</title>
<link href="<%=cssUrl%>bootstrap.min.css" rel="stylesheet">

<link href="<%=cssUrl%>index.css" rel="stylesheet">

<script type="text/javascript" src="<%=jsUrl%>jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=jsUrl%>bootstrap.min.js"></script>
<script type="text/javascript">

	$(function(){
		//全局变量
		//window.cList = ${cList};
		//alert("${cList}");
		//根据input变化 自动修改 cList中库存数量
		//$("input:text").change(function(){
		//	$(cList).each(function(i,n) {
		//		alert(n.id);
		//		n.storeNumber = $("#"+n.id+" ").val();
		//	});
		//});
	});
	//更新库存
	function updateStock(id){      
		var storeNumber = $("input[name='"+id+"']").val();
		//alert(id+":"+storeNumber);
		$.post("computerServlet?method=updateStock&id="+id+"&storeNumber="+storeNumber,
				{"id":id,"storeNumber":storeNumber},
				function(result){
					var json = eval('(' + result + ')');
					alert("已修改品牌型号"+json.brand+"的库存数量为："+json.storeNumber);
		  });
    }

</script>
</head>
<body>
<%@ include file="/commons/header.jsp"%>
	
	<div class="container">
		<div class="container">
			<h2 style="margin: 2rem auto;">课程信息后台管理</h2>
			<table class="table table-hover table-striped text-center">
				<thead>
				<tr>
					<th class="text-center">序号</th>
					<th class="text-center">科目</th>
					<th class="text-center">学科</th>
					<th class="text-center">价格</th>
					<th class="text-center">库存日期</th>
					<th class="text-center">销售数量</th>
					<th class="text-center">课程评论</th>
					<th class="text-center">操作</th>
				</tr>
				</thead>
			<c:forEach items="${cList}" var="computer">
				<div class="">
			      <tr>
				    <td>${computer.id }</td>
				    <td>${computer.brand }</td>
				    <td>${computer.model }</td>
				    <td>￥${computer.price }</td>
				    <td>${computer.publishingDate }</td>
				    <td><input type="text" name="${computer.id }" style="width:30px"
				    value="${computer.salesAmount }"> </td>
					  <td><a href="/computerServlet?method=getComments&computerId=${computer.id }">查看</a></td>
					  <td><button class="btn btn-primary" type="button" value="修改库存" onclick="updateStock(${computer.id})">修改销售量</button></td>
				  </tr>
			    </div>
			
			</c:forEach>
		</div>
		</table>
		</form>
		</div>
				
		</div>
		<%@ include file="/commons/footer.jsp"%>
		
</body>
</html>