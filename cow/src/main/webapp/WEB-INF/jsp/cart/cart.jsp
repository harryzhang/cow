<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<meta HTTP-EQUIV="pragma" CONTENT="no-cache">
	<meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
	<meta HTTP-EQUIV="expires" CONTENT="0">
   	<meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">

	<link rel="shortcut icon" href="images/logo.ico">
	
	<script type="text/jscript" src="<c:url value='/res-qiquan/js/jquery-1.8.3.js'/>"></script>
    <script type="text/jscript" src="<c:url value='/res-qiquan/js/index.js'/>"></script>
    <script type="text/jscript" src="<c:url value='/res-qiquan/js/download_base.js'/>"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui">
    
    <link type="text/css" href="<c:url value='/res-qiquan/css/base.css'/>" rel="stylesheet">
    <link type="text/css" href="<c:url value='/res-qiquan/css/common.css'/>" rel="stylesheet">
    <link type="text/css" href="<c:url value='/res-qiquan/css/index.css'/>" rel="stylesheet">
    <link type="text/css" href="<c:url value='/res-qiquan/css/layout.css'/>" rel="stylesheet">
	<link type="text/css" href="<c:url value='/res-qiquan/css/list_of.css'/>" rel="stylesheet"> 
	<link rel="shortcut icon" href="images/logo.ico" />
	
	<style type="text/css">

.fix-nav{height:50px;margin-top:10px;}
.fix-nav-wrap{position:fixed;height:50px;width:100%;left:0;bottom:0;background:#fff;border-top:1px solid #CDCDCD;display:-webkit-box;display:-webkit-flex;display:flex;z-index:998;}
.fix-nav a{display:block;-webkit-box-flex:1;-webkit-flex:1;flex:1;font-size:24px;text-align:center;color:#7D7D7F;font-size:0;}
.fix-nav a p{font-size:12px;}
.fix-nav a:active{background:#f2f2f2;}
.fix-nav .icon{display:inline-block;width:25px;height:25px;margin-top:4px;background-image: url('<c:url value="/res-qiquan/images/home_nav_icon.png"/>')!important;-webkit-background-size: 50px auto!important;
background-size: 50px auto!important;}
.fix-nav .icon-home{background-position:0 0;}
.fix-nav .icon-product{background-position:0 -25px;}
.fix-nav .icon-helper{background-position:0 -100px;}
.fix-nav .icon-mine{background-position:0 -75px;}
.fix-nav .icon-active{background-position:0 -50px;}
.fix-nav .active p{color:#B68E50}
.fix-nav .active .icon-home{background-position:-25px 0;}
.fix-nav .active .icon-product{background-position:-25px -25px;}
.fix-nav .active .icon-helper{background-position:-25px -50px;}
.fix-nav .active .icon-mine{background-position:-25px -75px;}
.fix-nav .active .icon-active{background-position:0 -25px;}
	</style>
</head>
<body>
<div class="wrap">
	<div class="host" id="hostid">
		<div class="navber">
			<!-- 
			<p class="top_nav">
				<img src="/res-qiquan/images/animal_4.png" alt="" />第190期榆社笨鸡蛋
			</p>
			 -->
			<c:forEach items="${goodLst}" var="item">
			<div class="content">
				<img class="pag1" src="<c:url value='${item.imageSrc }'/>" height="120"
					width="120" alt="" />
					<div class="list">
					<!--
				<div class="video" display:inline>
					<a style="color:#d73e2e;" href="javascript:;">${item.bandName}</a>
				</div>
				-->
        		<a href="<c:url value='/cart/productDetail?bId=${item.goodsId}'/>" class="btn">立 即<br />领养</a>
				<!--
				<div class="text">
				         养成收益<br />
					<span>￥${item.income}</span>
				</div>
				-->
			</div>
				
				<ul class="code">
					
					<li>
						<p class="set1">
							<em>养殖周期</em> 
						</p>
						<p class="set2">
							<i>${item.peroid}</i>
							天</p>
					</li>
					<li>
						<p class="set1">
							<em>养殖成本</em>
						</p>
						<p class="set2">
							<i>${item.costPrice}</i>${item.gunite}</p>
					</li>
					<li>
						<p class="set1">
							<em>出栏价格</em>
						</p>
						<p class="set2">
							<i>${item.price}</i>${item.gunite}</p>
					</li>
				</ul>
				
				
			</div>
	
			<!--   两种状态，1.预售 2.抢购中 3.售空 -->
			
			
			<div class="clear" style="border-bottom: 2px solid #d2d2d2;"></div>
			</c:forEach>
		</div>
	</div>
	
	<!-- start导航条 -->
        <div class="fix-nav" style="height:1rem;">
	        <div class="fix-nav-wrap">
	            <a href="<c:url value='/login/main.html'/>">
	                <i class="icon icon-home"></i>
	                <p>首页</p>
	            </a>
	            <a href="<c:url value='/cart/cart.html'/>" class="active">
	                <i class="icon icon-product"></i>
	                <p>投资</p>
	            </a>
	            <a href="<c:url value='/active/activeList.html'/>" >
	                <i class="icon icon-active"></i>
	                <p>活动</p>
	            </a> 
	            <!--ms-if-->      
	            <a href="<c:url value='/login/me.html'/>">
	                <i class="icon icon-mine"></i>
	                <p>我的</p>
	            </a>            
	        </div>
    	</div>
    	<!-- end导航条 -->
</div>    	
	
<!-- 
<a href="<c:url value='/cart/productListEmpty.html'/>" class="issue">往期产品</a>
 -->
<!-- <div class="loading" style="margin:0;font-size:0.24rem">已经是最后一条数据</div>  -->
</body>
</html>