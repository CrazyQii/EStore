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
    <title>用户评价</title>
    <link href="<%=cssUrl%>bootstrap.min.css" rel="stylesheet">

    <link href="<%=cssUrl%>index.css" rel="stylesheet">

    <script type="text/javascript" src="<%=jsUrl%>jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="<%=jsUrl%>bootstrap.min.js"></script>
    <%--<%@ include file="/commons/queryCondition.jsp" %>--%>
</head>
<body>

<%@ include file="/commons/header.jsp"%>

<div class="container">
    <div class="container" style="display: flex;">
        <div>
            <h3 style="margin: 4rem auto;">用户评价</h3>
            <p style="font-size: 20px;d">${computer.model}</p>
            <img src="${computer.teacher}" style="width: 80%;">

        </div>

        <div class="list-group" style="width: 80%; padding-top: 4rem;">
            <c:forEach items="${comments}" var="comment">
            <a href="#" class="list-group-item list-group-item-action">
                <div class="d-flex w-100 justify-content-between">
                    <h5 class="mb-1">${comment.user}</h5>
                    <small>${comment.time}</small>
                </div>
                <p class="mb-1">${comment.content}</p>
                <small>《${computer.model}》</small>
            </a>
            </c:forEach>
        </div>
    </div>

</div>

<%@ include file="/commons/footer.jsp"%>
</body>
</html>