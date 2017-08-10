<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- saved from url=(0047)https://www.lenongzhijia.com/h5/page/forget.jsp -->
<html style="font-size: 42.7px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><meta http-equiv="pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
<meta http-equiv="expires" content="0">

<link rel="shortcut icon" href="https://www.lenongzhijia.com/static/images/logo.ico">



    <title>乐农之家</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    
    <link type="text/css" href="<c:url value='/res-qiquan/css/base.css" rel="stylesheet'/>"/>
    <link type="text/css" href="<c:url value='/res-qiquan/css/common.css" rel="stylesheet'/>"/>
    <link type="text/css" href="<c:url value='/res-qiquan/css/login.css" rel="stylesheet'/>"/>
    <script type="text/jscript" src="<c:url value='/res-qiquan/js/jquery-1.8.3.js'/>"></script>
    <script type="text/jscript" src="<c:url value='/res-qiquan/js/formValidatorRegex.js?'/>"></script>
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
            <form action="<c:url value='/account/forgetPwd1.html'/>" class="form_wrap">
            	<div class="formStyle1">
	            	<div class="form_box clearfix">
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
	                    <a href="javascript:;" class="btn codeBtn btn_green code" id="phonecodesend">获取验证码</a>
	                </div>
					
	            </div>
	                <div class="error_notice">
	                	<p class="hide" id="error-box">错误提示</p>
	                </div>
	                <a class="btn funcBtn btn_green login_btn" href="javascript:void(0);" onclick="javascript:forgetPwd1();">下一步</a>
            </form>
        </div>
    </div>
    <script type="text/javascript">
		$(function(){
			$(".reg_link").click(function() {
				$(this).siblings(".reg_phone").hide();
				$(this).siblings(".change_phone").show();
			});
		});
	</script>
	<script type="text/javascript">
var flag = false;
var timer2 = 120;
var tipId2;
var codeValid = false;
var regexPhone = /^13[0-9]{9}|15[0123456789][0-9]{8}|17[0123456789][0-9]{8}|18[0123456789][0-9]{8}|147[0-9]{8}$/;
var chinese = /^[\u4e00-\u9fa5]{0,}$/;
var num = /^-?\d+\.?\d*$/;
$(function() {

	//手机验证
	$("#phoneNo").blur(function() {
		if (!regexPhone.test($(this).val())) {
			flag=false;
			showTipMsg("手机号格式不正确,请重新输入");
			return;
		}else if($(this).val().length>11){
			flag=false;
			showTipMsg("手机号长度不正确,请重新输入");
			return;
		}else{
			checkPhone();
		}
	});
	
	$("#code").blur(function() {
		if ($(this).val() == "") {
			showTipMsg("请输入验证码！");
			return;
		}
	});
	
	$("#idNo").blur(function() {
		if(chinese.test(isCardID($("#idNo").val().replace(/\s/g,"")))){
			flag=false;
			showTipMsg(isCardID($("#idNo").val()));
			return;
		}else{
			showTipMsg("");
		}
	});
	
	
	$("#phonecodesend").click(function(){
			var phoneNo = $("#phoneNo").val();
			if(!regexPhone.test(phoneNo)){
				flag=false;
				showTipMsg("手机号格式不正确,请重新输入");
				return;
			}else if(phoneNo.length>11){
				flag=false;
				showTipMsg("手机号长度不正确,请重新输入");
				return;
			}
			
			if(!checkPhone()){
				showTipMsg("手机号未注册");
				return;
			}
			if(codeValid){
				return;
			}
		    var param = {};
			/* param["phoneNumber"] = phoneNo; */
			param["phoneNo"] = $("#phoneNo").val();
			param["type"] = 3;
				
			$("#phonecodesend").html("发送中...");
			$("#phonecodesend").addClass("btn_grey").attr("disabled","disabled");
			 $.ajax({
				type : "POST",
				cache : false,
				async : false,// 设置异步为false,重要！
				dataType : "json",
				url : $("#basePath").val() + "front/sendPhoneCodeNoode",
				data : param,
				success : function(data) {
					if(data.key==1){
						codeValid = true;
						tipId2 = window.setInterval(rtimer2, 1000);
						showTipMsg("");
					}else if(data.key==2){
						codeValid = true;
						$("#phonecodesend").removeClass("btn_grey").removeAttr("disabled","disabled").attr('value', "次数受限");
						showTipMsg("次数受限，请联系客服");
					}else if(data.key == 3){
						codeValid = true;
						tipId2 = window.setInterval(rtimer2, 1000);
						showTipMsg("发送过于频繁，2分钟后再发送");
					}
				}
			}); 
	});
});

function rtimer2() {
	if (timer2 >= 0) {
		$("#phonecodesend").html(timer2 + "秒后重新获取");
		timer2--;
	} else {
		window.clearInterval(tipId2);
		$("#phonecodesend").removeClass("btn_grey").removeAttr("disabled").html("重新发送");
		timer2 = 120;
		codeValid = false;
//		clearPhoneCode();
	}
}

function checkPhone(){
	return true;
	
	$.ajax({
		type : "POST",
		cache : false,
		async : false,// 设置异步为false,重要！
		dataType : "json",
		url : $("#basePath").val() + "front/checkphonenum",
		data : {
			"mobilePhone" : function() {
				return $("#phoneNo").val();
			}
		},
		success : function(data) {
			if(data.state!=0){
				flag=true;
				showTipMsg("");
				return true;
			}else{
				flag=false;
				showTipMsg("手机号未注册");
				return false;
			}
		}
	});
	return flag;
}


//form验证
function checkform(){
	if(!regexPhone.test($("#phoneNo").val())){
		showTipMsg("手机号格式不正确,请重新输入");
		flag = false;
		return false;
	}else {
		flag = checkPhone();
	}
	if ($("#code").val() == "") {
		showTipMsg("请输入验证码！");
		flag = false;
		return false;
	}
	if ($("#idNo").val().replace(/\s/g,"") == "") {
		showTipMsg("请输入身份证号码！");
		flag = false;
		return false;
	}else{
		if(chinese.test(isCardID($("#idNo").val().replace(/\s/g,"")))){
			showTipMsg(isCardID($("#idNo").val()));
			flag = false;
			return false;
		}else{
			showTipMsg("");
		}
	}
	return flag;
}


function showTipMsg(msg) {
	$("#error-box").show();
	$("#error-box").html(msg);
}


function forgetPwd1(){
	/*
	if(!codeValid){
		showTipMsg("验证码已失效，请重新获取");
		return;
	}
	*/
	if(!checkPhone()){
		showTipMsg("手机号未注册");
		return;
	}
	var code = $("#code").val().replace(/\s/g,"");
	if(!num.test(code)){
		showTipMsg("请输入合法短信验证码");
		return;
	}
	if(!checkform()){
		return;
	}
	var param = {};
	param["phoneNumber"] = $("#phoneNo").val().replace(/\s/g,"");
	param["code"] = $("#code").val().replace(/\s/g,"");
	param["idNo"] = $("#idNo").val().replace(/\s/g,"");
	$.ajax({
		type : "POST",
		cache : false,
		async : false,// 设置异步为false,重要！
		dataType : "json",
		url : $("#basePath").val() + "account/forgetPwd1.html",
		data : param,
		success : function(data) {
			if (data.result == 0) {
				window.location.href = $("#basePath").val()+"account/forgetPwd2Index.html?pn="+data.msg;
			}else{
				showTipMsg(data.msg)
			}
		}
	});
}
</script>

</body></html>