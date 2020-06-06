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
    <title>个人中心</title>
    <link href="<%=cssUrl%>bootstrap.min.css" rel="stylesheet">
    <link href="<%=cssUrl%>index.css" rel="stylesheet">

    <script type="text/javascript" src="<%=jsUrl%>jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="<%=jsUrl%>bootstrap.min.js"></script>
    <%--<%@ include file="/commons/queryCondition.jsp" %>--%>
</head>
<body>

<%@ include file="/commons/header.jsp"%>

<div class="container">
    <form style="margin: 2rem auto; width: 50%;">
        <h3 style="margin-bottom: 2rem;">个人中心</h3>
        <fieldset>
            <div class="form-group">
                <label for="disabledTextInput">用户账号</label>
                <input type="text" id="disabledTextInput" class="form-control" value="${user.username}">
            </div>
            <div class="form-group">
                <label for="pwd">账户密码</label>
                <input type="password" id="pwd" class="form-control" value="${user.username}">
            </div>
            <div class="form-group">
                <label for="disabledSelect">账户余额</label>
                <input type="text" id="disabledSelect" class="form-control" disabled value="${account.balance}">
            </div>
            <button type="submit" class="btn btn-primary">确认修改</button>
        </fieldset>
    </form>
</div>




<%@ include file="/commons/footer.jsp"%>
</body>
</html>