<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html style="font-size: 60px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>乐农之家</title>

<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
<meta http-equiv="expires" content="0">

<link rel="shortcut icon" href="/res-qiquan/images/logo.ico">
<meta content="telephone=no" name="format-detection">

<script type="text/jscript" src="<c:url value='/res-qiquan/js/jquery-1.8.3.js'/>"></script>
<script type="text/jscript" src="<c:url value='/res-qiquan/js/product_detail2.js'/>"></script>
<script type="text/jscript" src="<c:url value='/res-qiquan/js/formValidatorRegex.js'/>"></script>
<link type="text/css" href="<c:url value='/res-qiquan/css/orderToPay.css'/>" rel="stylesheet"/>
<link type="text/css" href="<c:url value='/res-qiquan/css/topnav.css" rel="stylesheet'/>"/>

<script type="text/jscript" src="<c:url value='/res-qiquan/js/download_base.js'/>"></script>
<meta name="viewport" content="width=640, user-scalable=no">

</head>
    <body>
        <div class="wrap" style="height: 758px;">
         <div class="top-nav">
	        <a class="link" href="javascript:history.go(-1);">返回</a>
	        <h1>支付</h1>
	    </div>
	    
            <div class="content">
                <div class="center">
                	<input type="hidden" value="<c:url value='/'/>" id="basePath">
                	<input type="hidden" value="${goods.goodsId }" id="bid">
                	<input type="hidden" value="${order.totalPrice }" id="amount">
                	<input type="hidden" value="${order.qty}" id="num">
                	<input type="hidden" value="${order.orderCode }" id="orderCode">
                    <div class="column">
                       <p>订单号：${order.orderCode}</p> 
                       <p>总计金额<span>${order.totalPrice}</span>元</p>
                    </div>
                    <div class="zfs">支付方式</div>
                </div>
                <div class="guild">
                    <div class="center">
                        <!-- 
                        <div class="menu clear">
                            <i class="d_true" flag="1"></i>
                            <img src="<c:url value='/res-qiquan/images/zf.png'/>" height="41" width="48" alt="">
                            <p>
                                <em>余额支付</em>
                                <span>账户余额：<strong>0.0</strong>元</span>
                            </p>
                        </div>
                        <div class="menu clear">
                            <i flag="2"></i>
                            <img src="<c:url value='/res-qiquan/images/zf.png'/>" height="41" width="48" alt="">
                            <p>
                                <em>快捷支付</em>
                                <span>支付各大银行卡，限额由发卡行限定</span>
                            </p>
                        </div>
                         -->
                        <div class="menu clear" onclick="sharePay();">
                            <i flag="2"></i>
                            <img src="<c:url value='/res-qiquan/images/zf.png'/>" height="41" width="48" alt="">
                            <p>
                                <em>共享者支付</em>
                                <span>由系统注册的共享者完成支付</span>
                            </p>
                        </div>
                    </div>
                </div>
               
            </div>
        </div>     
    <script>
             var docEl = document.documentElement;        
                function getSize() {// 获取屏幕的宽度
                    var screenWidth = docEl.clientWidth; 
                    docEl.style.fontSize =  screenWidth / (640/60)  + 'px';
                }
                getSize();// 页面加载完执行一次
                window.onresize = function() {
                    getSize();
            	}   
           
        </script>
        
        <script>
			function sharePay(){
				location.href=$("#basePath").val()+"wallet/sharePay.html";
				}
        </script>
    
</body></html>