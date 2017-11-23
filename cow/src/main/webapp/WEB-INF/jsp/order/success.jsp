<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
 	<link type="text/css" href="<c:url value='/res-qiquan/css/topnav.css" rel="stylesheet'/>"/>
 	
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"> 
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <!-- UC默认竖屏，UC强制全屏 -->
    <meta name="full-screen" content="yes">
    <meta name="browsermode" content="application">
    <!-- QQ浏览器强制竖屏 QQ浏览器强制全屏 -->
    <meta name="x5-orientation" content="portrait">
    <meta name="x5-fullscreen" content="true">
    <meta name="x5-page-mode" content="app">
    <meta name="fragment" content="!">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="stylesheet" href="<c:url value='/res-qiquan/css/home_base.css'/>">
    <link rel="stylesheet" href="<c:url value='/res-qiquan/css/home_main.css'/>">
    <script type="text/jscript" src="<c:url value='/res-qiquan/js/jquery-1.8.3.js'/>"></script>
</head>

<body style="background:#fff">
    <div class="oni-mmRouter-slide-wrapper">
	    <div class="top-nav-new">
	        <a class="link" href="#">返回</a>
	        <h1>操作成功</h1>
	    </div>
		<img  src="<c:url value='/res-qiquan/images/success.png'/>" id="imgDiv"  style="width:50%;margin: 10% 20%">
		<p style="margin-top:20px; font-size: x-large;text-align: center;">操作成功</p>
	</div>
	
</body>
</html>


<script type="text/javascript">
	var t=setTimeout("window.location.href='<c:url value='/login/me.html'/>'", 3000);
</script>