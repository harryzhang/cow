<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!-- saved from url=(0054)https://www.lenongzhijia.com/h5/page/index.jsp#account -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>乐农之家</title>
    
    
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
	<meta http-equiv="expires" content="0">

	<link rel="shortcut icon" href="images/logo.ico">
	
	<script type="text/jscript" src="<c:url value='/res-qiquan/js/jquery-1.8.3.js'/>"></script>
    <script type="text/jscript" src="<c:url value='/res-qiquan/js/index.js'/>"></script>
    <script type="text/jscript" src="<c:url value='/res-qiquan/js/download_base.js'/>"></script>
    <meta name="viewport" content="width=640, user-scalable=no">
    
    <link type="text/css" href="<c:url value='/res-qiquan/css/base.css'/>" rel="stylesheet">
    <link type="text/css" href="<c:url value='/res-qiquan/css/common.css'/>" rel="stylesheet">
    <link type="text/css" href="<c:url value='/res-qiquan/css/index.css'/>" rel="stylesheet">
    <link type="text/css" href="<c:url value='/res-qiquan/css/layout.css'/>" rel="stylesheet">
<style>
	.account_detail{
	height:3.4rem;
	background-size:100% 100%;
	}
	.c_logo{
	height:2.6rem;
	}
	.c_logo img{
	width:1.5rem;
	heigt:1.49rem;
	}
	.c_logo p{
	font-size:0.32rem;
	}
	
	.account_list{
	height:0.8rem;
	}
	.account_list li{
	width:2.12rem;
	height:0.8rem;
	}
	.account_list li p{
		font-size:0.22rem;
		padding-top:0.05rem;
		line-height:0.32rem;
	}
	.account_list li span{
		font-size:0.24rem;
		display:block;
	}
	
	.account_module ul{
	margin-top:0.1rem;
	}
	.account_module li{
	width:2.13rem;
	height:2.13rem;
	}
	.account_module li img{
		height:0.7rem;
	}
	.account_module ul li img{
		height:1.3rem;
		padding-top:0.2rem;
	}
	.account_module {
    width: 100%;
    background: #fff;
    padding-bottom: 0.3rem;
	}
	.account_module li p{
	font-size:0.24rem;
	}
	.account_module li span{
	font-size:0.16rem;
	border-radius:100%;
	height:0.20rem;
	line-height:0.20rem;
	}
	
	
 .mee{
        display:none;
        width:100%;
        height:100%;
        position:fixed;
        left:0;
        top:0;
        z-index: 9;
        background:rgba(0, 0, 0, 0.5);
    }
    .bnak{
        display:none;
        width:80%;
        height:4rem;
        background:#fff;
        position:fixed;
        left:50%;
        top:50%;
        margin-left:-40%;
        margin-top:-2rem;
        z-index: 99;
    }
    .coom{ 
        width:100%;
        height:1.3rem;
        border-bottom: 1px solid #ccc;
        position:relative;
    }
    .coom .end{
        width:0.5797rem;
        height:0.5797rem;;
        display:block;
        background:url("<c:url value='/res-qiquan/images/page/ends.png'/>") no-repeat;
        background-size:contain;
        position:absolute;
        right:0.48rem;
        top:0.48rem;
    }
    .txt{
        font-size:0.53rem;
        color:#939ba1;
        text-align: center;
        margin-top:1.0869rem;
    }
    
   .account_module li{
        width:3.33333rem;
        height:3.33333rem;
    }


.fix-nav{height:100px;margin-top:10px;}
.fix-nav-wrap{position:fixed;height:100px;width:100%;left:0;bottom:0;background:#fff;border-top:1px solid #CDCDCD;display:-webkit-box;display:-webkit-flex;display:flex;z-index:998;}
.fix-nav a{display:block;-webkit-box-flex:1;-webkit-flex:1;flex:1;font-size:24px;text-align:center;color:#7D7D7F;font-size:0;}
.fix-nav a p{font-size:24px;}
.fix-nav a:active{background:#f2f2f2;}
.fix-nav .icon{display:inline-block;width:50px;height:50px;margin-top:8px;background-image: url('<c:url value="/res-qiquan/images/home_nav_icon.png"/>')!important;-webkit-background-size: 100px auto!important;
background-size: 100px auto!important;}
.fix-nav .icon-home{background-position:0 0;}
.fix-nav .icon-product{background-position:0 -50px;}
.fix-nav .icon-helper{background-position:0 -200px;}
.fix-nav .icon-mine{background-position:0 -150px;}
.fix-nav .icon-active{background-position:0 -100px;}
.fix-nav .active p{color:#B68E50}
.fix-nav .active .icon-home{background-position:-25px 0;}
.fix-nav .active .icon-product{background-position:-25px -25px;}
.fix-nav .active .icon-helper{background-position:-25px -100px;}
.fix-nav .active .icon-mine{background-position:-50px -150px;}
.fix-nav .active .icon-active{background-position:-25px -50px;}


	
</style>
</head>

<body>
	<div class="wrap">
	<input type="hidden" value="<c:url value='/'/>" id="basePath">
	<input type="hidden" value="${userDo.userName}" id="loginUser">
	
		<!-- 提示窗 -->
        <div class="mee"></div>
        <div class="bnak">
            <div class="coom">
                <div class="end"></div>
            </div>
            <div class="txt">功能暂未开放，敬请期待</div>
        </div>
	
		<!-- start页面内容 -->
    	<div class="main" style="padding-bottom: 1rem;">
    	  

			
			<!--  start个人中心 -->			
			<div class="page" style="display: block;" data-hash="account">
	        	<!--账户明细-->
	            <div class="account_detail clearfix">
	            	<div class="c_logo">
		            	<a href="<c:url value='/member/userSettle.html'/>">
	                	<img src="<c:url value='/res-qiquan/images/logo.png'/>" alt="">
	                    <p>查看个人设置中心</p>
                    </a>
                	</div>
	            	
	                <div class="account_list">
                	<ul class="clearfix">
                		<li>
                        	<p id="stillMoney">0.00元</p>
                            <span>投资收益</span>
                        </li>
                        <li>
                        	<p id="balance">0.00元</p>
                            <span>投资金额</span>
                        </li>
                        <li>
                        	<p id="stayBackMoney">0.00元</p>
                            <span>推荐奖励</span>
                        </li>
                	</ul>
                </div>
	            </div>
	            <!--账户模块-->
	            <div class="account_module">
	            	<ul class="clearfix">
	            		<li style="width: 213.333px; height: 213.333px;">
                    	<a href="<c:url value='/pay/toChongzhi.html'/>">
                            <img src="<c:url value='/res-qiquan/images/cen_icon1.png'/>" alt="">
                            <p>充值</p>
                        </a>
                    </li>
                    <li style="width: 213.333px; height: 213.333px;">
                    	<a href="<c:url value='/member/withdraw.html'/>">
                            <img src="<c:url value='/res-qiquan/images/cen_icon2.png'/>" alt="">
                            <p>提现</p>
                        </a>
                    </li>
                    <li style="width: 213.333px; height: 213.333px;">
                    	<a href="<c:url value='/member/userIncome.html'/>">
                            <img src="<c:url value='/res-qiquan/images/cen_icon3.png'/>" alt="">
                            <p>财富记录</p>
                        </a>
                    </li>
                    <li style="width: 213.333px; height: 213.333px;">
                    	<a href="<c:url value='/member/refUser.html'/>">
                            <img src="<c:url value='/res-qiquan/images/cen_icon4.png'/>" alt="">
                            <p>推荐列表</p>
                        </a>
                    </li>
                    <li style="width: 213.333px; height: 213.333px;">
                    	<a href="<c:url value='/member/amountDetail.html'/>">
                            <img src="<c:url value='/res-qiquan/images/cen_icon5.png'/>" alt="">
                            <p>资金明细</p>
                        </a>
                    </li>
                    <li style="width: 213.333px; height: 213.333px;">
                    	<a href="javascript:;">
                            <img src="<c:url value='/res-qiquan/images/cen_icon6.png'/>" alt="">
                            <p>认养记录</p>
                        </a>
                    </li>
                    <li style="width: 213.333px; height: 213.333px;">
                    	<a href="<c:url value='/member/orderDetail.html'/>">
                            <img src="<c:url value='/res-qiquan/images/cen_icon7.png'/>" alt="">
                            <p>我的订单</p>
                        </a>
                    </li>
                    <li style="width: 213.333px; height: 213.333px;">
                    	<a href="<c:url value='/member/orderDetail.html'/>">
                            <img src="<c:url value='/res-qiquan/images/cen_icon8.png'/>" alt="">
                            <p>上传付款图片</p>
                        </a>	
                    </li>
                    <li style="width: 213.333px; height: 213.333px;">
                    	<a href="<c:url value='/wallet/listSk.html'/>">
                            <img src="<c:url value='/res-qiquan/images/cen_icon9.png'/>" alt="">
                            <p>收款确认</p>
                        </a>
                    </li>
	            	</ul>
	            </div> 
			</div>
			<!--  end个人中心 -->
        </div>
        <!-- end页面内容 -->
        
        <!-- start导航条 -->
        <div class="fix-nav">
	        <div class="fix-nav-wrap">
	            <a href="<c:url value='/login/main.html'/>">
	                <i class="icon icon-home"></i>
	                <p>首页</p>
	            </a>
	            <a href="<c:url value='/cart/cart.html'/>">
	                <i class="icon icon-product"></i>
	                <p>投资</p>
	            </a>
	            <a href="<c:url value='/active/activeList.html'/>">
	                <i class="icon icon-active"></i>
	                <p>活动</p>
	            </a> 
	            <!--ms-if-->      
	            <a href="#"  class="active">
	                <i class="icon icon-mine"></i>
	                <p>我的</p>
	            </a>            
	        </div>
    	</div>
    	<!-- end导航条 -->
    
    </div>
    <script>
    
    	$(function(){
			var _width = $(document).width();
			$(".account_module ul li").css({'width':_width/3 , 'height':_width/3});
			
			funcAccount();
		})
	
	
		$(function(){
        //提示框
            $(".k").click(function(){
                $(".mee,.bnak").show();
            })
            $(".end").click(function(){
                $(".mee,.bnak").hide();
            })
		})
		
        </script>
   

</body></html>