<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html style="font-size: 59.5px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><meta http-equiv="pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
<meta http-equiv="expires" content="0">

<link rel="shortcut icon" href="images/logo.ico">



    <title>乐农之家</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <link type="text/css" href="<c:url value='/res-qiquan/css/base.css" rel="stylesheet'/>"/>
    <link type="text/css" href="<c:url value='/res-qiquan/css/common.css" rel="stylesheet'/>"/>
    <link type="text/css" href="<c:url value='/res-qiquan/css/account.css" rel="stylesheet'/>"/>
    <link type="text/css" href="<c:url value='/res-qiquan/css/topnav.css" rel="stylesheet'/>"/>
    <script type="text/jscript" src="<c:url value='/res-qiquan/js/jquery-1.8.3.js'/>"></script>
    <script type="text/jscript" src="<c:url value='/res-qiquan/js/form.js'/>"></script>
    <script type="text/jscript" src="<c:url value='/res-qiquan/js/account.js'/>"></script>
    
    <script>
	//定义屏幕字体大小
	document.getElementsByTagName("html")[0].style.fontSize=document.documentElement.clientWidth/10+"px";
	</script>
</head>

<body>
<input id="basePath" type="hidden" value="<c:url value='/'/>">
	<div class="wrap">
	<div class="top-nav-new">
        <a class="link" href="javascript:history.go(-1);">返回</a>
        <h1>共享人收款信息</h1>
    </div>
	
	<div class="main">
			<div style="
					border: 1px solid #dcdcdc;
					font-size: 12px;
					padding: 30px 15px 15px 15px;
					color: #848484;
					border: 1px solid #dcdcdc;
					-webkit-border-radius: 5px;
					border-radius: 5px;">
				<p style="
					font-size: 14px;
					color: #CDDC39;
					font-weight: bold;
					padding-bottom: 10px;">收款人说明</p>
				<p style="
    height: 22px;
    line-height: 22px;
    overflow: hidden;
">共享收款人：<span>张三</span></p>
				<p style="
    height: 22px;
    line-height: 22px;
    overflow: hidden;
">共享收款人电话：<span>136921111</span></p>
			</div>
            <form action="<c:url value='/account/confirmPassword.html'/>" class="form_wrap">
            <div class="formStyle2">
                <div class="form_item">
                    	<ul>
                    		<li class="form_line1 clearfix">
                            	<span>支付宝</span>
                                <input type="text" placeholder="共享收款人支付宝账号" name="" id="payzfb" value="233eee">
                            </li>
                            <li class="form_line1 clearfix">
                            	<span>微信</span>
                                <input type="text" placeholder="共享收款人微信账号" name="" id="paywx" value="2xxdwe">
                            </li>
                    	</ul>
                </div>
			</div>                    
              	<div class="error_notice">
               		<p class="hide" id="error-box">错误提示</p>
               	</div>
                <a href="javascript:toUploadPayImg();" class="btn funcBtn btn_green option_btn">我已支付</a>
            </form>
        </div>
    </div>
</body>
</html>

<script type="text/javascript">

	//修改提现密码
	function toUploadPayImg() {
		window.location.href= "<c:url value='/wallet/toUploadPayImg.html'/>";
	}

</script>