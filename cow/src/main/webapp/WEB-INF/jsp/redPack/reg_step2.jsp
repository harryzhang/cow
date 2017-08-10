﻿<%@ page language="java" contentType="text/html; charset=utf-8"%>
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
<script type="text/javascript">
 
  </script>
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
	
	<script>
	//定义屏幕字体大小
	document.getElementsByTagName("html")[0].style.fontSize=document.documentElement.clientWidth/10+"px";
	</script>
</head>
   <body>
<input id="basePath" type="hidden" value="<c:url value='/'/>"/>
<input id="efferPhoneNo" type="hidden" value="b61f4c4a5d1444e0"/>
<input id="validcode" type="hidden" value="45690ea7687c35c3"/>
	<div class="wrap">
		<div class="logo_box">
            <img src="<c:url value='/res-qiquan/images/logo.png'/>" alt="">
        </div>
        <div class="main">
        
        	<!--注册第二步-->
            <form action="" class="form_wrap">
            	<div class="formStyle1">
	                <div class="form_box form_line clearfix">
	                	<span class="fl">邮箱：</span>
	                    <input type="text" placeholder="请输入邮箱" class="phone_input" id="mailtxt">
	                </div>
	             </div>
	
	                <div class="error_notice">
	                	<p class="hide" id="error-box">错误提示</p>
	                </div>
	                <a href="#" class="btn funcBtn btn_green login_btn" id="nextBtn">提交</a>
            </form>
        </div>
    </div>
 
</body>
</html>
<script type="text/javascript">
var flag = false;
var timer2 = 120;
var tipId2;
var codeValid = false;
var regexPhone =/^13[0-9]{9}|15[0123456789][0-9]{8}|17[0123456789][0-9]{8}|18[0123456789][0-9]{8}|147[0-9]{8}$/;
var inputPhone =false;
var phoneflag =false;
var num = /^-?\d+\.?\d*$/;
$(function(){
	$(".reg_link").click(function() {
		inputPhone = true;
		if(codeValid){
			return;
		}
		$(this).siblings(".reg_phone").hide();
		$(this).siblings(".change_phone").show();
	});
	
	
	//手机验证
	$("#inputPhone").blur(function() {
		var phoneNum = $("#inputPhone").val();
		if (!regexPhone.test(phoneNum)) {
			flag=false;
			showTipMsg("手机号格式不正确,请重新输入");
		}else if(phoneNum.length>11){
			flag=false;
			showTipMsg("手机号格式不正确,请重新输入");
		}else if(!checkPhone($("#inputPhone").val())){
			flag=false;
			showTipMsg("手机号被使用，请重新输入");
		}else{
			flag=true;
			showTipMsg("");
		}
	});
	
	
$("#phonecodesend").click(function(){
	var phoneNoSend
	if(inputPhone){
		phoneNoSend = $("#inputPhone").val();
		//$(".reg_link").siblings(".reg_phone").html(phoneNoSend);
	//	$(".reg_link").siblings(".reg_phone").show();
	//	$(".reg_link").siblings(".input_box2").hide();
	}else{
		phoneNoSend = 13815349876
	}
	
	if(phoneNoSend && !regexPhone.test(phoneNoSend)){
		flag=false;
		showTipMsg("手机号格式不正确,请重新输入");
		return;
	}
	if(phoneNoSend && phoneNoSend.length > 11){
		flag=false;
		showTipMsg("手机号格式不正确,请重新输入");
		return;
	}
	if(inputPhone && !checkPhone(phoneNoSend)){
		showTipMsg("手机号已使用");
		return;
	}
	if(codeValid){
		return;
	}
    var param = {};
	param["phoneNo"] = phoneNoSend;
	param["type"] = 1;  
	param["refer_cust"] = $("#refer_cust").val();
	param["uky"] = "FCC11145E9E4C99A2BD5570D5B09A7C1A8732320DB87465A9D6747F64F2275DE15006933641852167314422075138906530641";
	param["efferPhoneNo"] =$("#efferPhoneNo").val(); 

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
			}else if(data.key == 2){
				codeValid = true;
				$("#phonecodesend").removeClass("btn_grey").addClass("reg_code").removeAttr("disabled","disabled").html("次数受限");
				showTipMsg("次数受限，请联系客服");
			}else if(data.key == 3){
				codeValid = true;
				tipId2 = window.setInterval(rtimer2, 1000);
				showTipMsg("发送过于频繁，2分钟后再发送");
			}else if(data.key == 11){
				codeValid = false;
				showTipMsg("请从正规渠道注册");
			}else if(data.key == 10){
				codeValid = false;
				showTipMsg("该号码检测不通过,请重新输入新号码");
				$("#phonecodesend").removeClass("btn_grey").addClass("reg_code").removeAttr("disabled").html("重新发送");
			}
			}
		}); 
	});
	
	
$("#nextBtn").click(function(){
    /*
	if(!codeValid){
		showTipMsg("验证码已失效,请重新发送");
		return;
	}
	*/
	var phoneNoSend
	if(inputPhone){
		phoneNoSend = $("#inputPhone").val();
	}else{
		phoneNoSend = 13815349876;
	}
	
	var phoneNo = phoneNoSend;
	var code=$("#phonecode").val();  
	var efferPhoneNo =$("#efferPhoneNo").val(); 
	if(inputPhone && !flag){
		return;
	}
	if(code == null || code==""){
		showTipMsg("验证码必须填写");
		return;
	}
	if(!num.test(code)){
		showTipMsg("请输入合法短信验证码");
		return;
	}

	var param = {};
	param["phoneNo"] = phoneNo;
	param["code"] = code;  
	param["efferPhoneNo"] = efferPhoneNo;  
	param["validcode"] = $("#validcode").val();  
	$.ajax({
		type : "POST",
		cache : false,
		async : false,// 设置异步为false,重要！
		dataType : "json",
		url : $("#basePath").val() + "account/saveRegStep2.html",
		data : param,
		success : function(data) {
			if(data.result == 0){
				window.location.href=$("#basePath").val()+"account/reg_step3.html?phoneNo="+data.msg;
			}else{
				showTipMsg(data.msg)
			}
		}
	});
});
	
});


function checkPhone(phoneNo){
	var phoneflag = false;
	$.ajax({
		type : "POST",
		cache : false,
		async : false,// 设置异步为false,重要！
		dataType : "json",
		url : $("#basePath").val() + "front/checkphonenum",
		data : {"mobilePhone" : phoneNo},
		success : function(data) {
			if(data.state!=0){
			//	showTipMsg("手机号被使用，请重新输入");
				phoneflag = false;
				return false;
			}else{
			//	showTipMsg("");
				phoneflag = true;
				return true;
			}
		}
	});
	return phoneflag;
}

function rtimer2() {
	if (timer2 >= 0) {
		$("#phonecodesend").html(timer2 + "秒后获取");
		timer2--;
	} else {
		window.clearInterval(tipId2);
		$("#phonecodesend").removeClass("btn_grey").addClass("reg_code").removeAttr("disabled").html("重新发送");
		timer2 = 120;
		codeValid = false;
	}
}


function showTipMsg(msg) {
	$("#error-box").show();
	$("#error-box").html(msg);
}

</script>
