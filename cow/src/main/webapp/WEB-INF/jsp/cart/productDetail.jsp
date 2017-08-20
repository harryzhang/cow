<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!-- saved from url=(0071)https://www.lenongzhijia.com/lnwxfront/productDetail?bId=15005139986433 -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>乐农之家-产品详情</title>


<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
<meta http-equiv="expires" content="0">

<link rel="shortcut icon" href="/res-qiquan/images/logo.ico">
<meta content="telephone=no" name="format-detection">
<script type="text/jscript" src="<c:url value='/res-qiquan/js/jquery-1.8.3.js'/>"></script>
<script type="text/jscript" src="<c:url value='/res-qiquan/js/product_detail2.js'/>"></script>
<script type="text/jscript" src="<c:url value='/res-qiquan/js/formValidatorRegex.js'/>"></script>
<link type="text/css" href="<c:url value='/res-qiquan/css/base.css'/>" rel="stylesheet"/>
<link type="text/css" href="<c:url value='/res-qiquan/css/layout.css'/>" rel="stylesheet"/>
<link type="text/css" href="<c:url value='/res-qiquan/css/page.css'/>" rel="stylesheet"/>

<script type="text/jscript" src="<c:url value='/res-qiquan/js/download_base.js'/>"></script>
    
<meta name="viewport" content="width=640, user-scalable=no">
</head>
    <body>
        <div class="wrap" style="height: 3881px;">
        	<input type="hidden" value="<c:url value='/'/>" id="basePath">
            
            <div class="mian"><div class="banner"><img src="<c:url value='${goods.imageSrc}'/>" height="284" width="640" alt=""></div>
                <div class="summary">
                    <p>第187期${goods.bandName}</p>
                </div>
                <div class="column">
                    <ul class="left_column">
                    	<input type="hidden" id="borrowId" value="${goods.id}">
                        <li class="txt1">养殖周期：${goods.peroid}天</li>
                        <li class="txt2">认养成本：${goods.price}元</li>
                        <li class="txt3">养成收益：${goods.income}元</li>
                        </ul>
                    <div class="right_column">
                        <div class="msg">
                            <div class="code">
                                <div class="bg_number" style="height: 0%;"></div>
                            </div>
                            <p class="msg_con">
                                <b>10%</b>
                                <span>剩余<i>500</i>${goods.gunite}</span> 
                            </p>
                        </div>
                    </div>
                     <h4 class="txt5">注：${goods.gdesc}</h4>
                    <div class="clear"></div>
                </div>
                <div class="content">
                    <img src="<c:url value='${goods.bigImageSrc}'/>" height="2051" width="640" alt="">
                    <a href="javascript:" class="state_bt state_bt_grenn">立即认养</a>
	                <!-- <a href="###" class="state_bt state_bt2">已结束</a> -->
                </div>
                
                <!--弹窗-->
                <div class="mee" style="height: 3881px;"></div>
                <div class="sade">
                    <div class="cove">
                        <div class="tes"><img src="<c:url value='${goods.imageSrc}'/>" height="100" width="164" alt="">
                            <p>
                             第187期${goods.bandName}<br>
					                            养殖周期：${goods.peroid}天  <br>   
					                            认养成本：${goods.price}元/${goods.gunite}<br>
					                            养成收益：${goods.income}元/${goods.gunite}<br></p><h4 class="txt5">注：${goods.gdesc}</h4>
                            <p></p>
                            <div class="clear"></div>
                        </div>
                        <div class="abte">
                            <div class="menu">剩余数量：<span>500</span>${goods.gunite}<input type="hidden" value="500" id="lastAmount">
                             <input type="hidden" value="120" id="unitPrice">
                             </div>
                            <p>
                                <a href="javascript:" class="jian">-</a>
                                <input type="text" value="1" placeholder="1" id="inputNum" onkeyup="this.value=this.value.replace(/\D/g,&#39;&#39;)">
                                <a href="javascript:" class="jia">+</a>
                            </p>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <a href="javascript:" class="bt5">下一步</a>
                </div>


            </div>
        </div>
        <script type="text/javascript">
	        $(function(){
// 	        	var schedule = $("#schedule").val();
// 	        	$(".bg_number").attr("style","height:"+schedule);
	        })
        </script>
    
</body></html>