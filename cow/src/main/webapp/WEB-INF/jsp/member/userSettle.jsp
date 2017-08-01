<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- saved from url=(0049)https://www.lenongzhijia.com/lnweixin/secUserInfo -->
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
		<div class="logo_box">
			<a href="<c:url value='/login/main.html'/>#account">
	            <img src="<c:url value='/res-qiquan/images/logo.png'/>" alt="头像">
			</a>
        </div>
        
        <p class="invite_code">邀请码：<span>13692177359</span></p>

		<div class="main">
        	<!--账户管理-->
            <div class="account_manage">
            	<div class="account_item">
                	 <ul>
                    	<li class="clearfix">
                           	<a href="https://www.lenongzhijia.com/lnweixin/modifyRealnameIdNoIndex">
              		 				<p><img src="<c:url value='/res-qiquan/images/account_icon1.png'/>" alt="">身份证认证</p>
              		 				<span><em>未认证</em><img src="<c:url value='/res-qiquan/images/arrow1.png'/>" alt=""></span></a>
               				</li>
                    </ul>
                </div>
                <div class="account_item">
                	<ul>
                    	<li class="line clearfix">
                    		<a href="https://www.lenongzhijia.com/lnweixin/newWithdrawtInit?isRecharge=no">
                            	<p><img src="<c:url value='/res-qiquan/images/account_icon2.png'/>" alt="">我要提现</p>
                                <span><em>&nbsp;</em><img src="<c:url value='/res-qiquan/images/arrow1.png'/>" alt=""></span>
                            </a>
                        </li>
                         <li class="line clearfix">
                            <a href="https://www.lenongzhijia.com/lnweixin/getSecUserBankList"><p><img src="<c:url value='/res-qiquan/images/account_icon3.png'/>" alt="">绑定银行卡</p>
                            <span><em>未绑定</em><img src="<c:url value='/res-qiquan/images/arrow1.png'/>" alt=""></span>
								</a>
                        </li> 
                        
                        <li class="line clearfix">
                    	<a href="https://www.lenongzhijia.com/lnweixin/newpeModifyPaycode">
                            	<p><img src="<c:url value='/res-qiquan/images/account_icon4.png'/>" alt="">修改提现密码</p>
                                <span><em>&nbsp;</em><img src="<c:url value='/res-qiquan/images/arrow1.png'/>" alt=""></span>
                          </a>  
                        </li>
                    </ul>
                </div> 
                <div class="account_item">
                	<ul>
                        <li class="line clearfix">
                        	<a href="https://www.lenongzhijia.com/lnweixin/goRealred">
                            	<p><img src="<c:url value='/res-qiquan/images/account_icon7.png'/>" alt="">抵用券</p>
                                <span><em class="ticket_num">19</em><img src="<c:url value='/res-qiquan/images/arrow1.png'/>" alt=""></span>
                            </a>
                        </li>
                        <li class="clearfix">
                        	<a href="https://www.lenongzhijia.com/lnwxfront/clientlist?refferee=c04219de834b457dfe0567a34750b8f2">
                            	<p><img src="<c:url value='/res-qiquan/images/account_icon8.png'/>" alt="">推荐有奖</p>
                                <span><em>&nbsp;</em><img src="<c:url value='/res-qiquan/images/arrow1.png'/>" alt=""></span>
                            </a>
                        </li>
                    </ul>
                </div>
                
                <div class="account_item">
                	<ul>
                        <li class="line clearfix">
                        	<a href="tel:4008-168-803">
                            	<p><img src="<c:url value='/res-qiquan/images/account_icon5.png'/>" alt="">客服热线</p>
                                <span><em class="light_color">4008 168 803</em><img src="<c:url value='/res-qiquan/images/arrow1.png'/>" alt=""></span>
                            </a>
                        </li>
<!--                         <li class="clearfix"> -->
<!--                             </a> -->
<!--                         </li> -->
                    </ul>
                </div>
                <div class="account_item" style="margin-top: 20px;">
                	<a href="<c:url value='/login/loginout.html'/>" class="exit">退出登录</a>
                </div>
            </div>
        </div>
    </div>


</body></html>