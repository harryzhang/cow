<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>乐农之家</title>
    <meta HTTP-EQUIV="pragma" CONTENT="no-cache">
	<meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
	<meta HTTP-EQUIV="expires" CONTENT="0">
	
	<link rel="shortcut icon" href="images/logo.ico" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <link type="text/css" href="<c:url value='/res-qiquan/css/base.css'/>" rel="stylesheet"/>
    <link type="text/css" href="<c:url value='/res-qiquan/css/common.css'/>" rel="stylesheet"/>
    <link type="text/css" href="<c:url value='/res-qiquan/css/login.css'/>" rel="stylesheet"/>
    <script type="text/jscript" src="<c:url value='/res-qiquan/js/jquery-1.8.3.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/res-qiquan/js/form.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/res-qiquan/js/account.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/res-qiquan/js/reg_step1.js'/>"></script>
	<script>
	//定义屏幕字体大小
	document.getElementsByTagName("html")[0].style.fontSize=document.documentElement.clientWidth/10+"px";
	</script>
</head>
<input id="usrChannel" name="usrChannel" type="hidden" value="3" />
<body>
 	<input id="basePath" type="hidden" value="<c:url value='/'/>"/>
  	<input id="refferee" type="hidden" value=""/>
	<div class="wrap">
		<div class="logo_box">
            <img src="<c:url value='/res-qiquan/images/logo.png'/>" alt="头像">
        </div>
        <div class="main">
        	<!--注册第一步-->
            <form action="" class="form_wrap">
            	<div class="formStyle1">
	            	<div class="form_box form_line clearfix">
	                	<img src="<c:url value='/res-qiquan/images/form_icon1.png'/>" alt="">
	                    <input type="text" placeholder="请输入登录账号(6-11位大小字母和数字组成)" class="phone_input" id="phoneNo">
	                </div>
	                
					<div class="form_box form_line clearfix">
	                	<img src="<c:url value='/res-qiquan/images/form_icon1.png'/>" alt="">
	                    <input type="password" placeholder="请输入登录密码" class="phone_input" id="password">
	                </div>
					
					<div class="form_box form_line clearfix">
	                	<img src="<c:url value='/res-qiquan/images/form_icon1.png'/>" alt="">
	                    <input type="password" placeholder="确认登录密码" class="phone_input" id="password2">
	                </div>
					
	                <div class="form_box form_line clearfix">
	                    <img src="<c:url value='/res-qiquan/images/form_icon3.png'/>" alt="">
	                    <input type="text" placeholder="请输入验证码" class="code_input" id="code">
	                    <img onclick="javascript:switchCode('register');" src="<c:url value="/common/imageCode.html?pageId=register"/>" id="codeNum" alt="验证码" title="换一张" class="verif_code fl">
	                </div>
	                
	                <div class="form_box clearfix reg_recom">
	                    <span class="fl">推荐人：</span>
	                   
	                    <div >
	                        <input type="text"  class="push_phone_input" placeholder="推荐人登录账号"  autocomplete="off" value="" id="efferPhoneNo">
	                    </div>
	                </div>					
	              </div>
	                <!--<p class="agreement"><a href="page/about/agreement.jsp">查看用户协议</a></p>-->
	                <div class="error_notice">
	                	<p class="hide" id="error-box"></p>
	                </div>
	                <a href="javascript:;" class="btn funcBtn btn_green login_btn" id="nextBtn">下一步</a>
            </form>
        </div>
    </div>
    <script type="text/javascript">
    $(function(){
    	var refferee = $("#refferee").val();
    	$(".push_phone_input").show();
		
    	/*
    	$(".reg_recom li").click(function() {
			var val = $(this).attr("val");
			$(this).addClass("checked").siblings().removeClass("checked");
			if(val==1){
				$("#error-box").html("");
				$(this).parents().find(".push_phone_input").show();
			}else{
				$("#error-box").html("");
				$(this).parents().find(".push_phone_input").hide();
			}
		});
    	*/
		
	});
	</script>
</body>
</html>