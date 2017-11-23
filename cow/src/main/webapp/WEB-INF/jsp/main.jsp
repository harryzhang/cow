<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script   src="<c:url value ='/res-qiquan/js/swiper.min.js'/>"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"> 
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <!-- UC默认竖屏，UC强制全屏 -->
    <meta name="full-screen" content="yes">
    <meta name="browsermode" content="application">
    <!-- QQ浏览器强制竖屏 QQ浏览器强制全屏 -->
    <meta name="x5-orientation" content="portrait">
    <meta name="x5-fullscreen" content="true"><meta name="x5-page-mode" content="app">
    <meta name="fragment" content="!">
    <title>钱生花</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="stylesheet" href="<c:url value='/res-qiquan/css/home_base.css'/>">
    <link rel="stylesheet" href="<c:url value='/res-qiquan/css/home_main.css'/>">
</head>

<body>
    <div class="oni-mmRouter-slide-wrapper">
        <div class="oni-helper-clearfix slider oni-helper-reset">
        	<!--ms-view:-->
        	<div class="oni-mmRouter-slide oni-mmRouter-leave" ms-skip="true"></div>
        	<div class="oni-mmRouter-slide oni-mmRouter-enter" ui-view="" data-current-cache="false">   
        	<div>
		   <div class="index-slogan">
		        <div class="swiper-container swiper-container-horizontal">
		            <div class="swiper-wrapper" style="transition-duration: 0ms; transform: translate3d(-960px, 0px, 0px);">
		            	<a class="swiper-slide swiper-slide-duplicate" href="javascript:;" data-swiper-slide-index="3" style="width: 320px; background-image: url(&quot;https://images.qianshenghua.com/s_1/static/article/images/201708/s_1502154036492145.jpg&quot;);"></a>
		                <a class="swiper-slide" href="javascript:;" data-swiper-slide-index="0" style="width: 320px; background-image: url(&quot;https://images.qianshenghua.com/s_1/static/article/images/201711/s_1510279197343431.jpg&quot;);"></a>
		                <a class="swiper-slide swiper-slide-prev" href="javascript:;" data-swiper-slide-index="1" style="width: 320px; background-image: url(&quot;https://images.qianshenghua.com/s_4/static/article/images/201711/s_1510276316756322.jpg&quot;);"></a>
		                <a class="swiper-slide swiper-slide-active" href="javascript:;" data-swiper-slide-index="2" style="width: 320px; background-image: url(&quot;https://images.qianshenghua.com/s_2/static/article/images/201711/s_1509673820691866.jpg&quot;);"></a>
		                <a class="swiper-slide swiper-slide-next" href="javascript:;" data-swiper-slide-index="3" style="width: 320px; background-image: url(&quot;https://images.qianshenghua.com/s_1/static/article/images/201708/s_1502154036492145.jpg&quot;);"></a>
		            	<a class="swiper-slide swiper-slide-duplicate" href="javascript:;" data-swiper-slide-index="0" style="width: 320px; background-image: url(&quot;https://images.qianshenghua.com/s_1/static/article/images/201711/s_1510279197343431.jpg&quot;);"></a></div>
		            	<div class="swiper-pagination swiper-pagination-clickable">
		            		<span class="swiper-pagination-bullet"></span>
		            		<span class="swiper-pagination-bullet"></span>
		            		<span class="swiper-pagination-bullet swiper-pagination-bullet-active"></span>
		            		<span class="swiper-pagination-bullet"></span>
		            	</div>
		        </div>
		        <a href="javascript:;" class="index-icon plat-message"></a>
		    </div>
    <!--ms-if-->
    <div class="imenu-list">
        <div class="item" style="margin-top:30px;">
           <a href="javascript:;">
               <i class="index-icon icon-newbie"></i>
               <p>农场风采</p>
           </a>
           <a href="javascript:;">
               <i class="index-icon icon-safe"></i>
               <p>安全保障</p>
           </a>
           <a href="javascript:;">
               <i class="index-icon icon-aboutus"></i>
               <p>关于我们</p>
           </a>
           <a href="<c:url value='/active/activeList.html'/>">
               <i class="index-icon icon-active"></i>
               <p>近期活动</p>
           </a>
        </div> 
    </div>
    
    <div class="wrapper-pannel" style="min-height:200px">
        <div class="title-bar">养殖推荐<a class="more" href="<c:url value='/cart/cart.html'/>">更多</a></div>
        <div class="home-news-list">
        	<c:forEach items="${goodLst}" var="item">
              <a class="item" href="#" style="float: left;width:30%;padding: 0px; margin-left: 8px; margin-top: 10px;">
                <div class="img" style="width=:100%;background-image: url(&quot;${item.imageSrc }&quot;);">
                	<p style="margin-top:85px">${item.bandName}</p>
                </div>
              </a>
            </c:forEach>
        </div>
    </div>
    
    <div class="wrapper-pannel">
        <div class="title-bar">公告：系统最新公告点击更多浏览<a class="more" href="<c:url value='/notice/notice.html'/>">更多</a></div>
    </div>
    
    <div class="wrapper-pannel" style="min-height:142px">
        <div class="title-bar">新闻资讯<a class="more" href="<c:url value='/firstpage/toFirstpage.html'/>">更多</a></div>
        <div class="home-news-list">
        	  <c:forEach items="${news}" var="item">
	              <a class="item" href="#">
	                <div class="img" style="background-image: url(&quot;https://images.qianshenghua.com/s_1/static/article/images/201710/article_1509414684408159.jpg&quot;);"></div>
	                <div class="text">
	                    <h3>${item.newsTitle }</h3>
	                    <p>${item.summary}</p>
	                    <div class="time"><fmt:formatDate type="both" value="${item.createTime}" pattern="yy-MM-dd HH:mm:ss"/></div>
	                </div>
	              </a>
            </c:forEach>
        </div>
    </div>
    <div class="wrapper-pannel" style="min-height:195px">
        <div class="title-bar">农场风采</div>
        <div class="acitvity-list clearfix">
            <div>
                <div class="img">
                    <a href="#" style="background-image: url(&quot;https://images.qianshenghua.com/s_1/static/article/images/201711/s_151028069934116.jpg&quot;);"></a>
                </div>
                <h3>抽大奖，狂返现！</h3>
            </div>
			<div>
                <div class="img">
                    <a href="#" style="background-image: url(&quot;https://images.qianshenghua.com/s_1/static/article/images/201710/s_1509164202741765.jpg&quot;);"></a>
                </div>
                <h3>第三季度运营报告</h3>
            </div>
        </div>
    </div>
<!--     <div class="safe-tip">
        <i class="icon"></i>
        身份信息和资金全部由徽商银行存管
    </div> -->
</div>    

</div>
        </div>
    </div>
    
     <!-- start导航条 -->
    <div class="fix-nav">
        <div class="fix-nav-wrap">
            <a href="#" class="active">
                <i class="icon icon-home"></i>
                <p>首页</p>
            </a>
            <a href="<c:url value='/cart/cart.html'/>">
                <i class="icon icon-product"></i>
                <p>投资</p>
            </a>
            <a href="<c:url value='/active/activeList.html'/>">
                <i class="icon icon-active"></i>
                <p>活动</p>
            </a> 
            <!--ms-if-->      
            <a href="<c:url value='/login/me.html'/>">
                <i class="icon icon-mine"></i>
                <p>我的</p>
            </a>            
        </div>
    </div>
    <!-- end导航条 -->
</body>
</html>
<script type="text/javascript">
     //Initialize Swiper
	var swiper = new Swiper('.swiper-container', {
	    pagination: '.swiper-pagination',
	    paginationClickable: true,
	    spaceBetween: 30,
	    centeredSlides: true,
	    autoplay: 2500,
	    autoplayDisableOnInteraction: false
	});
</script>