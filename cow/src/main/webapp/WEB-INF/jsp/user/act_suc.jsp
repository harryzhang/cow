<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html style="font-size: 58.4px;"><head>
    <title>乐农之家</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
	<link type="text/css" href="<c:url value='/res-qiquan/css/base.css'/>" rel="stylesheet"/>
    <link type="text/css" href="<c:url value='/res-qiquan/css/common.css'/>" rel="stylesheet"/>
     <script>
	//定义屏幕字体大小
		document.getElementsByTagName("html")[0].style.fontSize=document.documentElement.clientWidth/10+"px";
	</script>
	<style>
    .notice_box{
		width:100%;
		height:10rem;
		background:#fff;
		margin-bottom:1.5rem;
	}
	.notice_box p{
		text-align:center;
		padding-top:1.5rem;
		font-size:0.8rem;
		color:#54b668;
	}
	.notice_box p img{
		width:1.5rem;
		position:relative;
		top:0.4rem;
		margin-right:5px;
	}
	.notice_btn{
		width:9rem;
		margin:0 auto;
	}
    </style>
</head>

<body>
	<div class="wrap">
        <div class="notice_box">
        	<p class="clearfix"><img src="<c:url value='/res-qiquan/images/true.png'/>" alt=""></p>
        	
        	<p class="clearfix"><span>${msg}</span></p>
        </div>
        <a href="<c:url value='/login/index.html'/>" class="btn funcBtn btn_green notice_btn">我的牧场</a>
    </div>   




</body></html>