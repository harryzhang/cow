<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>乐农之家</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <meta HTTP-EQUIV="pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<meta HTTP-EQUIV="expires" CONTENT="0">

<link rel="shortcut icon" href="images/logo.ico" />
<link type="text/css" href="<c:url value='/res-qiquan/css/base.css" rel="stylesheet'/>"/>
    <link type="text/css" href="<c:url value='/res-qiquan/css/common.css" rel="stylesheet'/>"/>
    <link type="text/css" href="<c:url value='/res-qiquan/css/login.css" rel="stylesheet'/>"/>
    <script type="text/jscript" src="<c:url value='/res-qiquan/js/jquery-1.8.3.js'/>"></script>
    <script type="text/jscript" src="<c:url value='/res-qiquan/js/login.js?'/>"></script>
    <!-- <script type="text/javascript" src="<c:url value='/res-qiquan/js/wxajaxsetup.js'/>"></script> -->
    
    <script>
	//定义屏幕字体大小
	document.getElementsByTagName("html")[0].style.fontSize=document.documentElement.clientWidth/10+"px";
	</script>


	<script type="text/javascript">
	        $(document).ready(function(){
	        	var param = {};
	        	param["openid"] = '';
	        	
	    		if(param["openid"] == ""){
	            	$("#bod").show();
	            	return;
	    		}
	    		
	    		if(param["openid"] == "null"){
	            	$("#bod").show();
	            	return;
	    		}
	    		
	    		$.ajax({
	    			type : "POST",
	    			cache : false,
	    			async : false,// 设置异步为false,重要！
	    			dataType : "json",
	    			url : "<c:url value='/login/login.html'/>",
	    			data : param,
	    			success : function(data) {
	    	              if(data.result == "0"){
	    	            	  window.location.href="<c:url value='/login/main.html'/>";
	    	              }else{
	    	            	  $("#bod").show();
	    	              }
	    			}
	    		});
	        });
		    </script>
</head>
<body>
<input id="basePath" type="hidden" value="<c:url value='/'/>"/>
<input id="referer" type="hidden"  value="null"/>
<input id="referer2" type="hidden"  value="null"/>

    <!-- 正式环境 -->
    
	<div class="wrap hide" id="bod">
    	<div class="logo_box">
            <img src="<c:url value='/res-qiquan/images/logo.png'/>" alt="头像" class="head_img">
        </div>
        <div class="main">
        	<!--登录-->
            <form action="" class="form_wrap">
                <div class="formStyle1">
                	<div class="form_box form_line clearfix">
                        <img src="<c:url value='/res-qiquan/images/form_icon1.png'/>" alt="" />
                        <input type="text" placeholder="请输入登录账号" id="emailphone">
                    </div>
                    <div class="form_box clearfix">
                        <img src="<c:url value='/res-qiquan/images/form_icon2.png'/>" alt="" />
                        <input type="password" placeholder="请输入密码" id="password">
                    </div>
                </div>
                
                <div class="error_notice">
                	<p class="hide" id="error-box">错误提示</p>
                </div>
                <a href="javascript:login();" class="btn funcBtn btn_green login_btn">登录</a>
                 <p class="forget clearfix"><a href="<c:url value='/account/reg_step1.html'/>" class="fl">新用户注册>></a> <a href="<c:url value='/account/forgetPwd1.html'/>" class="fr">忘记密码？</a></p>
            </form>
        </div>
    </div>  

    
  
</body>
</html>