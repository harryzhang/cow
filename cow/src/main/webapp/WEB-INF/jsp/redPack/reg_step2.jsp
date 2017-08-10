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
	                <a href="#" class="btn funcBtn btn_green login_btn" id="nextBtn"><span id="btTxt">提交</span></a>
            </form>
        </div>
    </div>
 
</body>
</html>
<script type="text/javascript">
var flag = false;
var regMail = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
$(function(){
	//邮箱验证
	$("#mailtxt").blur(function() {
		var phoneNum = $("#mailtxt").val();
		if (!regMail.test(phoneNum)) {
			flag=false;
			showTipMsg("邮箱格式不正确,请重新输入");
		}else{
			flag=true;
			showTipMsg("");
		}
	});
	
	
$("#nextBtn").click(function(){

	if(flag==false){
		return;
	}
	
	var param = {};
	param["mailtxt"] =  $("#mailtxt").val();
	$("#btTxt").html("正在发送邮件验证你的邮箱，请勿重复点击");
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
				$("#btTxt").html("提交");
				showTipMsg(data.msg)
			}
		}
	});
});
	
});


function showTipMsg(msg) {
	$("#error-box").show();
	$("#error-box").html(msg);
}

</script>
