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
<link type="text/css" href="<c:url value='/res-qiquan/css/topnav.css" rel="stylesheet'/>"/>

<script type="text/jscript" src="<c:url value='/res-qiquan/js/download_base.js'/>"></script>
    
<meta name="viewport" content="width=640, user-scalable=no">
<style>
  .target_menu {
	border-top: 1px solid #cccccc;
}
.target_menu a {
	display: block;
	font-size: 28px;
	padding: 15px 0px 15px 30px;
	border-bottom: 2px solid #cccccc;
	color: #212121;
	text-indent: 30px;
}

.target_menu a:after {
	content: '';
	display: block;
	background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAgCAYAAAASYli2AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MDVBMkI0QTgwMzAxMTFFN0JBRkVENjQ3QjFGNDdCQzciIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MDVBMkI0QTkwMzAxMTFFN0JBRkVENjQ3QjFGNDdCQzciPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDowNUEyQjRBNjAzMDExMUU3QkFGRUQ2NDdCMUY0N0JDNyIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDowNUEyQjRBNzAzMDExMUU3QkFGRUQ2NDdCMUY0N0JDNyIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PswWF8QAAAGrSURBVHjanJY/SEJRFMavf3BwaXITWqTN2TkhoyAhaYmWcHNwywhpLaLGhpZoCKKtoKAgyqXJOWhyCHJranEQzL4Dn2CH+/Kd+8GPB0f53rv3nvvdm261WifOuR33VwNQBl1nVBLsgitVz4J7UAgxHIM6eFK/5cAjnyZD0RCse4ZY4JdmrYaTeVsDPfWfErgGKauh6Assgb6qV8E5SFgNRR9gFXyr+jY4DDEUvYEap2Fae6ARYijqgE0wUvVTToHZUHQHmqqW4iKVQgxFZ2A/ovEXQgxFBzTWjf8C8iGGjkO/UTUxewBzIYYjLlJH1Yt8UcZqONmiNbbVtCSZLqTx084uafgKeFVptAU+ky5MP6F96JMswLMnKyVT21bDDBeg6NlVkqlji2GKX1GO2PdD65BlD2+oWl8nU1zDtidlJDuXdXbGMWxw6zlPur9bV7nKofp2TNfaNosRZ0mTsWbqQ2mLW89pd+RJnZmG8zpBqEsujulMyXEX5D3JXeelILZh1PWjG3G2/GuY4Zzpc6LH9hhYbg4JZlnF07grfJruNsfMMhfjWjJTvwIMAEU4Vwy3xj+tAAAAAElFTkSuQmCC) no-repeat 0px 0px;
	width: 20px;
	height: 40px;
	background-size: 20px auto;
	-webkit-background-size: 20px auto;
	float: right;
	margin-right: 40px;
	margin-top: 1px;
}
</style>
</head>
    <body>
        <div class="wrap" style="height: 3881px;">
        	<div class="top-nav">
		        <a class="link" href="javascript:history.go(-1);">返回</a>
		        <h1>产品详情</h1>
	    	</div>
	    
        	<input type="hidden" value="<c:url value='/'/>" id="basePath">
            
            <div class="mian"><div class="banner"><img src="<c:url value='${goods.imageSrc}'/>" height="284" width="640" alt=""></div>
                <div class="summary">
                    <p>第187期${goods.bandName}</p>
                </div>
                <div class="column">
                    <ul class="left_column">
                    	<input type="hidden" id="borrowId" value="${goods.goodsId}">
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
                
                <div class="target_menu">
					<a href="<c:url value='/cart/productIncomeDesc.html?bid=${goods.goodsId}'/>">收益说明</a>            
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