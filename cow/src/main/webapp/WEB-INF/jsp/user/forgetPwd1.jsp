<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- saved from url=(0047)https://www.lenongzhijia.com/h5/page/forget.jsp -->
<html style="font-size: 42.7px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><meta http-equiv="pragma" content="no-cache">
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
    <link type="text/css" href="<c:url value='/res-qiquan/css/login.css" rel="stylesheet'/>"/>
    <script type="text/jscript" src="<c:url value='/res-qiquan/js/jquery-1.8.3.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/res-qiquan/js/form.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/res-qiquan/js/account.js'/>"></script>
    <script>
	//定义屏幕字体大小
	document.getElementsByTagName("html")[0].style.fontSize=document.documentElement.clientWidth/10+"px";
	</script>
</head>

<body>
	<input id="basePath" type="hidden" value="<c:url value='/'/>">
	<div class="wrap">
	<div class="logo_box">
            <img src="<c:url value='/res-qiquan/images/logo.png'/>" alt="头像" class="head_img">
        </div>
        <div class="main">
        	<!--忘记密码-->
            <form action="<c:url value='/account/saveForgetPwd1.html'/>" class="form_wrap">
            	<div class="formStyle1">
	            	<div class="form_box form_line clearfix">
	                	<img src="<c:url value='/res-qiquan/images/form_icon4.png'/>" alt="">
	                    <input type="text" placeholder="请输入您的登录账号" class="phone_input" id="username">
	                </div>
	                
	            	<div class="form_box form_line clearfix">
	                	<img src="<c:url value='/res-qiquan/images/form_icon1.png'/>" alt="">
	                    <input type="text" placeholder="请输入你的邮箱" class="phone_input" id="mailtxt">
	                </div>
	                
	                
	            	<div class="form_box form_line clearfix">
	                    <img src="<c:url value='/res-qiquan/images/form_icon3.png'/>" alt="">
	                    <input type="text" placeholder="请输入验证码" class="code_input" id="code">
	                    <img onclick="javascript:switchCode('restpassword');" src="<c:url value="/common/imageCode.html?pageId=restpassword"/>" id="codeNum" alt="验证码" title="换一张" class="verif_code fl">
	                </div>
					
	            </div>
	                <div class="error_notice">
	                	<p class="hide" id="error-box">错误提示</p>
	                </div>
	                <a class="btn funcBtn btn_green login_btn" href="javascript:void(0);" onclick="javascript:forgetPwd1();">提交</a>
            </form>
        </div>
    </div>

<script type="text/javascript">

	function forgetPwd1(){

		var code=  $("#code").val().replace(/\s/g,"");
		var username = $("#username").val();
		var mailtxt = $("#mailtxt").val();
		
		var accMsg = checkAccountFormat(username);
		if (accMsg != "") {
			flag=false;
			showTipMsg(accMsg);
			return;
		}
		
		if(code == null || code==""){
			showTipMsg("验证码必须填写");
			return;
		}

		/*
		if(!checkPhone(username)){
			showTipMsg("账号不存在");
			return;
		}
		*/
		var mailMsg = checkMailFormat(mailtxt);
		if (mailMsg != "" ) {
			flag=false;
			showTipMsg(mailMsg);
			return ;
		}

		var checkMsg = checkMailAccount(mailtxt,"forgetpassword",username);
		if (checkMsg != "" ) {
			flag=false;
			showTipMsg(checkMsg);
			return ;
		}
		

		
		var param = {};
		param["username"] = username;
		param["code"] = $("#code").val().replace(/\s/g,"");
		param["mail"] = mailtxt;
		$.ajax({
			type : "POST",
			cache : false,
			async : false,// 设置异步为false,重要！
			dataType : "json",
			url : $("#basePath").val() + "account/saveForgetPwd1.html",
			data : param,
			success : function(data) {
				if (data.result == 0) {
					showTipMsg("已成功发送找回密码邮件");
					setTimeout('goLoginPage()',3000);
				}else{
					showTipMsg(data.msg);
				}
			}
		});
	}

	function goLoginPage(){
		window.location.href=$("#basePath").val() + "login/index.html";
	}
</script>

</body></html>