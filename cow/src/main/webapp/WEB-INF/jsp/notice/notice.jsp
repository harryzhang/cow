<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html avalonctrl="appCtrl">
<head>
<script class="$1510998112047" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script><script class="$1510998112047" src="https://static.hehenian.com/m/v4/js/controller/articleDetail.js?v=6413aaa"></script><script class="$1510998112047" src="https://static.hehenian.com/m/v4/js/controller/activeList.js?v=b3d18fa"></script><script class="$1510998112047" src="https://static.hehenian.com/m/v4/js/lib/template.js"></script><script class="$1510998112047" src="https://static.hehenian.com/m/v4/js/lib/scroll_load.js"></script><script class="$1510998112047" src="https://static.hehenian.com/m/v4/js/controller/newsList.js?v=6fbfe7b"></script><script src="https://hm.baidu.com/hm.js?b60a293fee670494b44625d431867f80"></script><script class="$1510998112047" src="https://static.hehenian.com/m/v4/js/plugins/Swiper/dist/js/swiper.min.js"></script><script class="$1510998112047" src="https://static.hehenian.com/m/v4/js/controller/home.js?v=85d3644"></script><script class="$1510998112047" src="https://static.hehenian.com/m/avalon/mmHistory.js"></script><script class="$1510998112047" src="https://static.hehenian.com/m/avalon/mmRouter.js"></script><script class="$1510998112047" src="https://static.hehenian.com/m/avalon/mmPromise.js"></script><script class="$1510998112047" src="https://static.hehenian.com/m/avalon/mmState.js"></script><script class="$1510998112047" src="https://static.hehenian.com/m/v4/js/router/router.js?v=df9710b.js"></script><script class="$1510998112047" src="https://static.hehenian.com/m/v4/js/base.js?v=d52e158.js"></script><script class="$1510998112047" src="https://static.hehenian.com/m/js/widget/modal/modalmin.js"></script><script class="$1510998112047" src="https://static.hehenian.com/m/common/zepto.min.js"></script><script class="$1510998112047" src="https://static.hehenian.com/m/v4/js/app.js?v=5cb209f.js"></script><avalon ms-skip="" class="avalonHide"><style id="avalonStyle">.avalonHide{ display: none!important }</style><a ms-if="channel" href="#!/helper" ms-class="active:navIndex===4">
                <i class="icon icon-helper"></i>
                <p>助手</p>
            </a><div class="notification" ms-if="view.notification.length">
        <ul class="swiper-wrapper" ms-with="view.notification">
            <li class="swiper-slide"><a ms-attr-href="{{el.link?el.link:'javascript:;'}}">{{el.title}}</a></li>
        </ul>
    </div><b ms-if="el.rate1">升至</b><span class="rate" ms-if="el.rate1">
                                 {{el.rate1*1000/10}}<i>%</i>
                             </span></avalon>
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
    <title>新闻资讯</title>
    <meta name="keywords" content="钱生花,qianshenghua,qsh,p2p,p2p网贷,p2p借贷平台,P2P网贷投标平台,人人贷,网络借贷,P2P信贷平台,网络小额贷款,钱生花,互联网金融,P2P投标,债权转让,薪金贷,业主贷,生意贷,工薪贷">
    <meta name="description" content="钱生花,qianshenghua,qsh,钱生花是花样年集团倾力打造的互联网金融P2P信贷平台，为有小额贷款,薪金贷,业主贷,生意贷,等需求的借款人和有投标需求的出借人提供高安全、高收益的互联网投标服务。">
    <link rel="stylesheet" href="https://static.hehenian.com/m/v4/css/base.css?v=06070ad">
    <link rel="stylesheet" href="https://static.hehenian.com/m/v4/css/main.css?v=542fb4e">
</head>

<body>
    <div class="oni-mmRouter-slide-wrapper">
        <div class="oni-helper-clearfix slider oni-helper-reset" style="transform: translate(0px, 0px) translateZ(0px);">
            <!--ms-view:--><div class="oni-mmRouter-slide oni-mmRouter-leave" ms-skip="true"></div><div class="oni-mmRouter-slide oni-mmRouter-enter" ui-view="" data-current-cache="false" style="float: left;"><div avalonctrl="articleListCtrl">
    <div class="top-nav">
        <a class="link" href="javascript:history.go(-1);">返回</a>
        <h1>系统公告</h1>
    </div>
    <div class="list-filter border">
        <div class="bd">
            <ul>
                <li class="on">
                    <span class="label">推荐</span>
                </li>
                <li>
                    <span class="label">平台动态</span>
                </li>
                <li>
                    <span class="label">投资攻略</span>
                </li>
                <li>
                    <span class="label">知识讲堂</span>
                </li>
            </ul>
        </div>
    </div>
    <div class="suggest-view">
        <div class="swiper-container swiper-container-horizontal">
            <div class="swiper-wrapper" style="transition-duration: 0ms; transform: translate3d(-720px, 0px, 0px);"><a class="swiper-slide swiper-slide-duplicate" href="http://m.hehenian.com/activity/gift.do " data-swiper-slide-index="2" style="background-image: url(&quot;https://images.qianshenghua.com/s_2/static/article/images/201711/s_151027586153564.jpg&quot;); width: 360px;">
                    <h3 class="title">188大礼包活动</h3>
                </a><!--with329593985394:start-->
                <a class="swiper-slide swiper-slide-prev" href="http://m.hehenian.com/about/detailApp.do?id=620 " data-swiper-slide-index="0" style="background-image: url(&quot;https://images.qianshenghua.com/s_3/static/article/images/201710/s_1509021490367321.jpg&quot;); width: 360px;">
                    <h3 class="title">庆祝彩付宝科技有限公司“再获一城” 金融持牌——企业实力新标杆</h3>
                </a>
            <!--with329593985394-->
                <a class="swiper-slide swiper-slide-active" href="http://m.hehenian.com/about/detailApp.do?id=621" data-swiper-slide-index="1" style="background-image: url(&quot;https://images.qianshenghua.com/s_3/static/article/images/201710/s_1509350951791540.jpg&quot;); width: 360px;">
                    <h3 class="title">热烈庆祝彩付宝科技成功加入中国互联网金融协会</h3>
                </a>
            <!--with329593985394-->
                <a class="swiper-slide swiper-slide-next" href="http://m.hehenian.com/activity/gift.do " data-swiper-slide-index="2" style="background-image: url(&quot;https://images.qianshenghua.com/s_2/static/article/images/201711/s_151027586153564.jpg&quot;); width: 360px;">
                    <h3 class="title">188大礼包活动</h3>
                </a>
            <!--with329593985394--><!--with329593985394:end--><a class="swiper-slide swiper-slide-duplicate" href="http://m.hehenian.com/about/detailApp.do?id=620 " data-swiper-slide-index="0" style="background-image: url(&quot;https://images.qianshenghua.com/s_3/static/article/images/201710/s_1509021490367321.jpg&quot;); width: 360px;">
                    <h3 class="title">庆祝彩付宝科技有限公司“再获一城” 金融持牌——企业实力新标杆</h3>
                </a></div>
        </div>
        <div class="news-list" style="margin:0;"><!--with222471578068:start-->
            <a class="item" "="" href="https://m.hehenian.com/#!/articleDetail/637">
                <div class="img" style="background-image: url(&quot;https://images.qianshenghua.com/s_1/static/article/images/201710/article_1509414684408159.jpg&quot;);"></div>
                <div class="text">
                    <h4>首届用户开放日：是时候见面了！</h4>
                    <div class="time">2017-10-30</div>
                </div>
            </a>
        <!--with222471578068-->
            <a class="item" "="" href="https://m.hehenian.com/#!/articleDetail/635">
                <div class="img" style="background-image: url(&quot;https://images.qianshenghua.com/s_1/static/article/images/201710/article_1509066460925613.png&quot;);"></div>
                <div class="text">
                    <h4>刚刚，我们在一起了！</h4>
                    <div class="time">2017-10-30</div>
                </div>
            </a>
        <!--with222471578068-->
            <a class="item" "="" href="https://m.hehenian.com/#!/articleDetail/630">
                <div class="img" style="background-image: url(&quot;https://images.qianshenghua.com/s_3/static/article/images/201710/article_15090713431482.png&quot;);"></div>
                <div class="text">
                    <h4>喜讯 | 热烈祝贺彩付宝荣获“2017中国金融行业十大影响力品牌”</h4>
                    <div class="time">2017-10-27</div>
                </div>
            </a>
        <!--with222471578068--><!--with222471578068:end--></div>
        <div class="title-bar" style="margin-top:10px;background:#fff;color:#DAA352;border-top:1px solid #ddd;">财经资讯</div>
        <div class="news-list" style="margin:0;border-top:none;"><!--with074820967222:start-->
            <a class="item" "="" href="https://m.hehenian.com/#!/articleDetail/634">
                <div class="img" style="background-image: url(&quot;https://images.qianshenghua.com/s_1/static/article/images/201710/article_1509344600479585.png&quot;);"></div>
                <div class="text">
                    <h4>厉害！深圳法院上线微信小程序：可“刷脸”立案</h4>
                    <div class="time">2017-10-30</div>
                </div>
            </a>
        <!--with074820967222-->
            <a class="item" "="" href="https://m.hehenian.com/#!/articleDetail/633">
                <div class="img" style="background-image: url(&quot;https://images.qianshenghua.com/s_3/static/article/images/201710/article_1509344188850571.png&quot;);"></div>
                <div class="text">
                    <h4>中国平安前三季保费收入领跑 净利润增17.4%</h4>
                    <div class="time">2017-10-30</div>
                </div>
            </a>
        <!--with074820967222-->
            <a class="item" "="" href="https://m.hehenian.com/#!/articleDetail/632">
                <div class="img" style="background-image: url(&quot;https://images.qianshenghua.com/s_5/static/article/images/201710/article_1509332994531963.png&quot;);"></div>
                <div class="text">
                    <h4>比特币到底有多火?竟让120家对冲基金专门盯着</h4>
                    <div class="time">2017-10-30</div>
                </div>
            </a>
        <!--with074820967222--><!--with074820967222:end--></div>
    </div>
    <div style="display: none;">
        <div class="news-list" id="articleList22"></div>
        <input id="articleListScrollLoadView22" type="button" value="点击加载更多" class="scroll-view">
    </div>
    <script id="articleListTpl22" type="text/tpl">
        <#for(var i=0 , len=list.length, el; i < len; i++){el=list[i]#>
            <a href="<#=el.url#>" class="item">
                <div class="img" style="background-image: url(<#=el.img#>);"></div>
                <div class="text">
                    <h4><#=el.title#></h4>
                    <div class="time"><#=el.publishTime#></div>
                </div>
            </a>
        <#}#>   
    </script>
</div></div>
        </div>
    </div>
    <div class="fix-nav">
        <div class="fix-nav-wrap">
            <a href="<c:url value='/login/main.html'/>" class="">
                <i class="icon icon-home"></i>
                <p>首页</p>
            </a>
            <a href="<c:url value='/cart/cart.html'/>">
                <i class="icon icon-product"></i>
                <p>投资</p>
            </a>
            <a href="<c:url value='/active/activeList.html'/>" class="">
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

    <div id="page-loading" style="display: none;">
        <div>
            <div class="rond">
                <div class="test"></div>
            </div>
            <div class="text">
                <p>loading</p>
            </div>
        </div>
    </div>
<script src="https://static.hehenian.com/m/avalon/avalon.mobile.min.js?v=2607718" data-main="https://static.hehenian.com/m/v4/js/app.js?v=5cb209f"></script></body></html>