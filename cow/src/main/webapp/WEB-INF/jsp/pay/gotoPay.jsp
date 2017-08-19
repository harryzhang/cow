<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="font-size: 42.7px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>乐农之家</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
   	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
	<meta http-equiv="expires" content="0">

	<script type="text/jscript" src="<c:url value='/res-qiquan/js/jquery-1.8.3.js'/>"></script>
	<link type="text/css" href="<c:url value='/res-qiquan/css/chongzhi.css'/>" rel="stylesheet"> 
	<link rel="shortcut icon" href="/images/logo.ico">
	
    <script>
	//定义屏幕字体大小
	document.getElementsByTagName("html")[0].style.fontSize=document.documentElement.clientWidth/10+"px";
	</script>
</head>
<body onload="init()">
	<input id="lnfund" type="hidden" value="https://www.lenongzhijia.com:443/">
	<div class="warp">
			<ul class="tab clear">
            	<input type="hidden" value="yes" id="isRecharge">
	                <li class="cur">我要充值</li>
            </ul>
            <div class="cption" id="rechargeDetail" style="display: block;">
                <div class="news">                
                    <div class="balance">余额：<span>0.00</span>元</div>
                </div>
                <div class="colnnmn">
                    <div class="news">
                        <div class="cation">
                            <div class="cant"><span>充值 (元)</span>
                            <input id="requestNo" value="" type="hidden">
                            <input class="" id="rechargeMoney" placeholder="充值金额" type="text" onkeyup="reachmove(this.value)"></div>
                            <h3 class="mg">使用银行卡</h3>
                            <div class="cant"><span>银行卡</span>
                            <input placeholder="招商银行(尾号5545)" type="text" readonly="readonly"></div>
                            <div class="error_notice">
	                			<p class="hide" id="error-box" style="display: block;"></p>
	                		</div>
                        </div>
                        <a class="btn" id="rechargeBtn" href="javascript:">确认提交</a>
                    </div>
                </div>
            </div>
        </div>
	
		<!-- 提示 -->
		<div class="mask_bg hide"></div>
        <!-- <div class="mee2 hide"></div> -->
        <!-- 验证码 -->
        <!-- <div class="side hide">
            <p class="yz">输入验证码</p>
            <p><input class="validation" type="text" id="rechargeCode" placeholder="请输入6位短信验证码" /><a class="h_btn" href="javascript:" id="reSendCode">获取验证码</a></p>
            <i id="validateMsg"></i>
            <div class="button">
                <a href="javascript:" class="qx">取 消</a>
                <a href="javascript:" class="bt_s" id="confirmCode">确 定</a>
            </div>
        </div> -->
        <div class="mtt hide">
            <span></span>
            <h2>支付</h2>
            <h3>付款确认：本次交易需要短信确认，校验码已发送至您手机138****7264</h3>
            <div class="box clearfix">
                <input type="tel" id="rechargeCode" name="" class="box_pw" maxlength="6">
            </div>
            <em id="validateMsg">短信验证码无效或超时，请重新获取</em>
            <!-- 进入计时的时候加类grev,重新加return 确定的时候不用加类-->
            <a title="" class="mtt_btn grev" id="reSendCode">获取验证码</a>
        </div>
    	

<script type="text/javascript" src="<c:url value='/res-qiquan/js/passwordKeyword.js'/>"></script>
<script type="text/javascript" src="<c:url value='/res-qiquan/js/cashWithdraw.js'/>"></script>
<!-- 弹窗 -->
<script>
	
	$(".box_pw").on("input propertychange",function(){
        /* Act on the event */
        /* $('.box_pw').val(''); */
           if($('.box_pw').val().length == 6){
               $('.box_pw').blur();
               confirmCode();//提交
           }
         
    });
</script>

</body>
</html>