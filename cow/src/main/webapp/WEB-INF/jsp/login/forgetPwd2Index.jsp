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
    <script type="text/jscript" src="<c:url value='/res-qiquan/js/jquery-1.8.3.js'/>"></script>
    <script type="text/jscript" src="<c:url value='/res-qiquan/js/passwordKeyword.js'/>"></script>
    
    <script>
	//定义屏幕字体大小
	document.getElementsByTagName("html")[0].style.fontSize=document.documentElement.clientWidth/10+"px";
	</script>
</head>

<body>
<input id="basePath" type="hidden" value="<c:url value='/'/>">
	<div class="wrap">
	<div class="main">
        	<!--重设提现密码-->
            <form action="<c:url value='/account/confirmPassword.html'/>" class="form_wrap">
            <div class="formStyle2">
            <h2 class="tit1">
            	请输入您的新密码<input id="activeCodeByMail" type="hidden" value="${activeCodeByMail}">
            </h2>
                <div class="form_item">
                    	<ul>
                    		<li class="form_line1 clearfix">
                            	<span>新密码</span>
                                <input type="password" placeholder="请设置您的新密码" name="" id="password1">
                            </li>
                            <li class="clearfix">
                            	<span>确认密码</span>
                                <input type="password" placeholder="请重新输入您的新密码" name="" id="password2">
                            </li>
                    	</ul>
                    </div>
				</div>                    
                    <div class="error_notice">
                		<p class="hide" id="error-box">错误提示</p>
                	</div>
                <a href="javascript:modifyPaycode();" class="btn funcBtn btn_green option_btn">确定</a>
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
var flag1 = false,flag2 = false,flag3 = true;
$(function(){
	//密码验证
	$("#password1").blur(function() {
		var pass1 = $("#password1").val();
		if (!(pass1.length >= 6 && pass1.length<=16)) {
			showTipMsg("6~16个字符，包括字母、数字、特殊符号");
			flag1=false;
		}else if(isCheckPassword(pass1.toLowerCase())){
			flag1=false;
			showTipMsg("不能含有非法字符");
		}else{
			if(pass1 == $("#oldPassword").val()){
				flag1=false;
				showTipMsg("提现密码不能与原密码相同");
			}else{
				flag1=true;
				showTipMsg("");
			}
		}
	});
	
	$("#password2").blur(function() {
		var pass1=$("#password1").val();
		var pass2=$("#password2").val();
		if (!(pass2.length >= 6 && pass2.length<=16)) {
			showTipMsg("6~16个字符，包括字母、数字、特殊符号");
			flag2=false;
		}else if(isCheckPassword(pass2.toLowerCase())){
			flag2 = false;
			showTipMsg("不能含有非法字符");
		}else{
			if(pass1 != pass2){
				flag2=false;
				showTipMsg("两次输入的密码不一致，请重新输入");
			}else{
				flag2=true;
				showTipMsg("");
			}
		}
	});	
	
	
	$("#oldPassword").blur(function() {
		var pass = $("#oldPassword").val();
		if (!(pass.length >= 1)) {
			showTipMsg("请输入原提现密码");
			flag3=false;
		}else if(isCheckPassword(pass.toLowerCase())){
			flag3 = false;
			showTipMsg("不能含有非法字符");
		}else{
			$.ajax({
				type : "POST",
				cache : false,
				async : true,
				dataType : "json",
				data : {paycodePwd:pass},
				url : $("#basePath").val() + "front/ajaxCheckPaycodePwd",
				success : function(data) {
					if(data.state == 0){
						flag3 = true;
						showTipMsg("");
					}else{
						showTipMsg("原密码错误,请重新输入");
						flag3 = false;
					}
				},
			});
		}
	});
});

function showTipMsg(msg) {
	$("#error-box").show();
	$("#error-box").html(msg);
}

//修改提现密码
function modifyPaycode() {
		check();
		var dealpwd=$("#dealpwd").val();
		if(dealpwd!=null&&dealpwd!=''){
			if(!(flag1&&flag2&&flag3)){
				return;
			}
		}else{
			if(!(flag1&&flag2)){
				return;
			}
		}
		
		 
		var param = {};
		param["oldpwd"] = $("#oldPassword").val();
		param["newpwd"] = $("#password1").val();
		param["confirmpwd"] = $("#password2").val();
		$.ajax({
			type : "POST",
			cache : false,
			async : true,
			dataType : "json",
			data : param,
			url : $("#basePath").val() + "account/confirmPassword.html",
			success : function(data) {
				if(data.result == 0){
					window.location.href = $("#basePath").val()+"login/index.html";
				}else {
					flag = false;
					showTipMsg(data.msg);
				}
			},
		}); 
}

function check(){
	var pass = $("#oldPassword").val();
	var pass1 = $("#password1").val();
	var pass2=$("#password2").val();
	var dealpwd=$("#dealpwd").val();
	if(dealpwd!=null&&dealpwd!=''){
		if (!(pass.length >= 1)) {
			showTipMsg("请输入原提现密码");
			return;
		}else{
			$.ajax({
				type : "POST",
				cache : false,
				async : true,
				dataType : "json",
				data : {paycodePwd:pass},
				url : $("#basePath").val() + "front/ajaxCheckPaycodePwd",
				success : function(data) {
					if(data.state != 0){
						showTipMsg("原密码错误,请重新输入");
						return;
					}
				},
			});
		};
	}
	
	if (!(pass1.length >= 6 && pass1.length<=16)) {
		showTipMsg("6~16个字符，包括字母、数字、特殊符号");
		flag1=false;
	}else if(isCheckPassword(pass1.toLowerCase())){
		flag1=false;
		showTipMsg("不能含有非法字符");
	}else{
		if(pass1 == $("#oldPassword").val()){
			flag1=false;
			showTipMsg("提现密码不能与原密码相同");
		}else{
			flag1=true;
			showTipMsg("");
		}
	}
	
	
	if (!(pass2.length >= 6 && pass2.length<=16)) {
		showTipMsg("6~16个字符，包括字母、数字、特殊符号");
		flag2=false;
	}else if(isCheckPassword(pass2.toLowerCase())){
		flag2=false;
		showTipMsg("不能含有非法字符");
	}else{
		if(pass1 != pass2){
			flag2=false;
			showTipMsg("两次输入的密码不一致，请重新输入");
		}else{
			flag2=true;
			showTipMsg("");
		}
	}
}
</script></body></html>