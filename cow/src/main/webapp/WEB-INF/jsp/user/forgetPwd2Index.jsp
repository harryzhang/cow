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
    <script type="text/jscript" src="<c:url value='/res-qiquan/js/form.js'/>"></script>
    <script type="text/jscript" src="<c:url value='/res-qiquan/js/account.js'/>"></script>
    
    <script>
	//定义屏幕字体大小
	document.getElementsByTagName("html")[0].style.fontSize=document.documentElement.clientWidth/10+"px";
	</script>
</head>

<body>
<input id="basePath" type="hidden" value="<c:url value='/'/>">
	<div class="wrap">
	<div class="main">
            <form action="<c:url value='/account/confirmPassword.html'/>" class="form_wrap">
            <div class="formStyle2">
            <h2 class="tit1">
            	请输入您的新密码<input id="token" type="hidden" value="${token}">
            </h2>
                <div class="form_item">
                    	<ul>
                    		<li class="form_line1 clearfix">
                            	<span>新密码</span>
                                <input type="password" placeholder="请设置您的新密码" name="" id="password">
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
</body>
</html>

<script type="text/javascript">

	//修改提现密码
	function modifyPaycode() {

		var chkMsg = pwdCheckout($("#password").val(),$("#password2").val());
		if(chkMsg != ""){
			showTipMsg(chkMsg);
			return;
		}	
			 
		var param = {};
		param["password"] = $("#password").val();
		param["token"] = $("#token").val();		
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
					 $("#token").val(data.token);	
					showTipMsg(data.msg);
				}
			},
		}); 
	}

</script>