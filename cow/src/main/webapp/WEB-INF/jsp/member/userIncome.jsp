<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html style="font-size: 59.5px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><meta http-equiv="pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
<meta http-equiv="expires" content="0">

<link rel="shortcut icon" href="images/logo.ico">



    <title>乐农之家</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
	<link type="text/css" href="<c:url value='/res-qiquan/css/base.css'/>" rel="stylesheet">
    <link type="text/css" href="<c:url value='/res-qiquan/css/common.css'/>" rel="stylesheet">
    <link type="text/css" href="<c:url value='/res-qiquan/css/account.css'/>" rel="stylesheet">
    <script type="text/jscript" src="<c:url value='/res-qiquan/js/jquery-1.8.3.js'/>"></script>
    <script>
	//定义屏幕字体大小
	document.getElementsByTagName("html")[0].style.fontSize=document.documentElement.clientWidth/10+"px";
	</script>
</head>

<body>
	<div class="wrap">
	    <div   style="width:100%;background: url(/res-qiquan/images/c_head.png) no-repeat top center;margin-bottom: 10px;">
		<div class="logo_box">
			<a href="<c:url value='/login/main.html'/>#account">
	            <img src="<c:url value='/res-qiquan/images/logo.png'/>" alt="头像">
			</a>
        </div>
        </div>
		<div class="main">
        	<!--账户管理-->
            <div class="account_manage">
                
                <div class="account_item">
                	<ul>
                        <li class="line clearfix" style="height:3rem;">
                    	<a href="javascript:;">
                            	<p>
                            		<img src="<c:url value='/res-qiquan/images/account_icon4.png'/>" alt="">
                            		  余额<font> 80${userAccount.rmb} 元</font>                            		
                            	</p>
                                <span>
                                		<em onclick="window.location.href='<c:url value='/member/withdraw.html'/>'">提现</em><img src="<c:url value='/res-qiquan/images/arrow1.png'/>" alt="">
                                		<br>
                                		<em onclick="window.location.href='<c:url value='/member/accountDetail.html?accountType=rmb'/>'">查看明细</em><img src="<c:url value='/res-qiquan/images/arrow1.png'/>" alt="" >
                                </span>
                          </a>  
                        </li>
                    </ul>
                </div> 
                
                
                <div class="account_item">
                	<ul>
                        <li class="line clearfix" style="height:3rem;">
                    	<a href="javascript:;">
                            	<p>
                            		<img src="<c:url value='/res-qiquan/images/account_icon4.png'/>" alt="">
                            		  奖金<font> 200${userAccount.rmb} 元</font>                            		
                            	</p>
                                <span>
                                		<em onclick="window.location.href='<c:url value='/member/withdraw.html'/>'">提现</em><img src="<c:url value='/res-qiquan/images/arrow1.png'/>" alt="">
                                		<br>
                                		<em onclick="window.location.href='<c:url value='/member/accountDetail.html?accountType=rmb'/>'">查看明细</em><img src="<c:url value='/res-qiquan/images/arrow1.png'/>" alt="" >
                                </span>
                          </a>  
                        </li>
                    </ul>
                </div> 
                
            </div>
        </div>
    </div>


</body></html>