<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-siteapp">
<meta http-equiv="expires" content="0">
<script type="text/javascript">
//判断是否属于移动端
var userAgent = navigator.userAgent;
userAgent = userAgent.toLowerCase();
var isMobile = "false";
if ( userAgent.indexOf("android") >= 0 || userAgent.indexOf("mini 9.5") >= 0 || userAgent.indexOf("vx1000") >= 0 || userAgent.indexOf("lge") >= 0 || userAgent.indexOf("m800") >= 0 || userAgent.indexOf("3g_t") >= 0 || userAgent.indexOf("windows ce") >= 0 || userAgent.indexOf("opera mobi") >= 0 || userAgent.indexOf("windows ce; smartphone;") >= 0 || userAgent.indexOf("windows ce; iemobile") >= 0 || userAgent.indexOf("ipod") >= 0 || userAgent.indexOf("ipad") >= 0 || userAgent.indexOf("iphone") >= 0 || userAgent.indexOf("opera mini") >= 0 || userAgent.indexOf("blackberry") >= 0 || userAgent.indexOf("palm os") >= 0 || userAgent.indexOf("palm") >= 0 || userAgent.indexOf("mobile") >= 0 || userAgent.indexOf("hiptop") >= 0 || userAgent.indexOf("avantgo") >= 0 || userAgent.indexOf("fennec") >= 0 || userAgent.indexOf("plucker") >= 0 || userAgent.indexOf("xiino") >= 0 || userAgent.indexOf("blazer") >= 0) {
    isMobile = "true";
}
</script> 
	<!-- 
	<link type="text/css" href="<c:url value='/res-qiquan/css/reset.css'/>" rel="stylesheet">
	 
    <link type="text/css" href="<c:url value='/res-qiquan/css/common.css'/>" rel="stylesheet">
    
    <script type="text/jscript" src="<c:url value='/res-qiquan/js/jquery-1.8.3.js'/>"></script>
	-->
	<title>乐农之家</title>
	
	<style type="text/css">
        .banner{
            position: absolute;
            left: 50%;
            top: 0;
            margin-left: -960px;
            width: 1920px;
            height: 350px;
            background: url(/uploadimages/news/new_detail.jpg) no-repeat;
        }
        .new_content{
            position: relative;
            width: 100%;
            overflow: hidden;
           /* background-color: #f1f1f1;
            padding-top: 350px;
            */
        }
        .new_center{
            width: 100%;
            margin: 43px auto 59px;
            /*padding:20px 20px 30px 20px;*/
            background-color: #fff;
            box-shadow: 4px 4px 5px #e0e2de;
        }
        .new_list{
            width: 95%;
            margin: 0 auto 42px;
            padding-bottom: 50px;
        }
        .new_list li{
            position: relative;
            padding-bottom:15px;
            margin-top: 25px;
            border-bottom: 1px solid #d2d2d2;
        }
        .new_list img,
        .new_list p,
        .new_list h2,
        .new_list h3,
        .new_list span{
            display: block;
            float: left;
        }
        .new_list img{
            margin-right: 34px;
        }
        .new_list h2{
            width: 552px;
            color: #676767;
            font-size: 19px;
            font-weight: 800;
            margin-bottom: 16px;
        }
        .new_list a{
        	color: #676767;
            font-size: 19px;
            font-weight: 800;
        }
        .new_list h3{
            color: #aaaaaa;
            font-size: 12px;
            margin-right: 44px;
        }
        .new_list span{
            color: #aaaaaa;
            font-size: 12px;
        }
        .new_list p{
            width: 100%;
            color: #858585;
            font-size: 14px;
            line-height: 22px;
            margin-top: 10px;
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 3;
            overflow: hidden;
        }
    </style>
</head>
<body>
<!-- content -->
<div class="new_content" style="background-color: #f1f1f1; padding-top: 350px;">
    <!--banner-->
    <div class="banner"></div>
    <div class="new_center">
        <div id="newsList">
			<ul class="new_list">
				<li class="clearfix">
					<img src="<c:url value='/uploadimages/news/15020965604000.jpg'/>" width="180" height="120" alt="">
					<h2>
						<a href="javascript:;">
							中国食品报报道乐农之家 深受业内外瞩目
						</a> 
					</h2>
					<h3>来源:中国食品报</h3>
					<span>时间：2017-08-07</span>
					<p>
						
							2017年8月1日，《中国食品报》第八版品牌专题报道了来自深圳的互联网养殖品牌——乐农之家，其全新的线上认养、线下代养的O2O养殖模式，引起了业内外人士...
						
						
					</p>
				</li>
	
				<li class="clearfix">
					<img src="<c:url value='/uploadimages/news/15011368324280.jpg'/>" width="180" height="120" alt="">
					<h2>
						<a href="javascript:;">
							乐农之家携手《中国食品报》助推中国农业3.0发展
						</a> 
					</h2>
					<h3>来源:中国食品报</h3>
					<span>时间：2017-07-25</span>
					<p>
						
						
						   近日，中国互联网养殖最具价值品牌乐农之家与中国食品行业第一报《中国食品报》签订了合作协议。
						
					</p>
				</li>
			
				<li class="clearfix">
					<img src="<c:url value='/uploadimages/news/15005393240030.png'/>" width="180" height="120" alt="">
					<h2>
						<a href="javascript:;">
							乐农之家不仅是一个掘金农场 还是一个欢乐集市
						</a> 
					</h2>
					<h3>来源:中国农业新闻网</h3>
					<span>时间：2017-07-20</span>
					<p>
						
							作为互联网养殖最具价值品牌，乐农之家为互联网用户提供理财与消费为一体的养殖新玩法，互联网用户在乐农之家平台不仅能够收获高额的养殖回报，还能够体验到生态养...
						
						
					</p>
				</li>
			
				<li class="clearfix">
					<img src="<c:url value='/uploadimages/news/14987938650820.jpg'/>" width="180" height="120" alt="">
					<h2>
						<a href="javascript:;">
							乐农之家携手《科学种养》助推中国农业3.0发展
						</a> 
					</h2>
					<h3>来源:广州日报大洋网</h3>
					<span>时间：2017-06-30</span>
					<p>
						
						
						   《科学种养》杂志是中国人民解放军总后勤部主管、金盾出版社主办的国家重点学术期刊和国家级农业期刊。
						
					</p>
				</li>
			
				<li class="clearfix">
					<img src="<c:url value='/uploadimages/news/14987023002000.png'/>" width="180" height="120" alt="">
					<h2>
						<a href="javascript:;">
							乐农之家与金盾出版社《科学种养》签署战略合作协议
						</a> 
					</h2>
					<h3>来源:网易新闻</h3>
					<span>时间：2017-06-29</span>
					<p>
						
							近日，乐农之家与北京金盾出版社正式签署战略合作协议，双方就促进《科学种养》杂志推广和丰富乐农之家网站农业领域内容及《科学种养》杂志社与乐农之家共建科学种...
						
						
					</p>
				</li>
			</ul>
		</div>
	</div>
</div>
</body></html>