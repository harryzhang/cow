<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html style="font-size: 59.5px;">
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
<meta http-equiv="expires" content="0">

<link rel="shortcut icon" href="/images/logo.ico">

    <title>乐农之家</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    
    <link type="text/css" href="<c:url value='/res-qiquan/css/base.css'/>" rel="stylesheet"/>
    <link type="text/css" href="<c:url value='/res-qiquan/css/common.css'/>" rel="stylesheet"/>
    <link type="text/css" href="<c:url value='/res-qiquan/css/account.css'/>" rel="stylesheet"/>
    <link type="text/css" href="<c:url value='/res-qiquan/css/layout.css'/>" rel="stylesheet"/>
    <script type="text/jscript" src="<c:url value='/res-qiquan/js/jquery-1.8.3.js'/>"></script>
    <script>
	//定义屏幕字体大小
	document.getElementsByTagName("html")[0].style.fontSize=document.documentElement.clientWidth/10+"px";
	</script>
</head>

<body>
	<div class="wrap">
		<div class="account_detail clearfix">
           	<div class="c_logo">
            	<a href="/member/userSettle.html">
               		<img src="/res-qiquan/images/logo.png" alt="">
                   <p>查看个人设置中心</p>
                </a>
           	</div>
        </div>
        
		<div class="ticket">
        	<div id="ticketList">      	
			<ul>
				<c:forEach items="${userList}" var="row" varStatus="status">
            	<div class="ticket_list">
	            	<ul>
	                    <li>
	                        <div class="ticket_left">
	                            <div class="ticket_money">
		                            ${status.index + 1}<span>&nbsp;</span>
	                            </div>
	                        </div>
	                        <div class="ticket_right">
	                        		<h3>${row.userName}<br>${row.name}</h3>
		                            <p><c:choose>
		                            	<c:when test="${row.status eq 1}">正式会员</c:when>
		                            	<c:when test="${row.status eq 0}">临时式会员</c:when>
		                            	<c:when test="${row.status eq 2}">未激活</c:when>
		                               </c:choose>
		                            </p>
	                        </div>
	                    </li>
	                </ul>
	            </div>
	            </c:forEach>
			</ul>
		</div>
            	<div class="loading"   onclick="javascript:history.go(-1);">返回</div>
       </div>
  </div>
</body>
</html>