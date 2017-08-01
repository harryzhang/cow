<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta HTTP-EQUIV="pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<meta HTTP-EQUIV="expires" CONTENT="0">

<link rel="shortcut icon" href="images/logo.ico" />
<input type="hidden" class="bId" value="15009446367253" />
			<div class="host" id="hostid">
				<div class="navber">
					<p class="top_nav">
						<img src="https://www.lenongzhijia.com:443/h5/images/animal_4.png" alt="" />第190期榆社笨鸡蛋</p>
					<div class="content">
						<img class="pag1" src="https://www.lenongzhijia.com:443/uploadimages/20170725/15009447112350.jpg" height="120"
							width="120" alt="" />
						<ul class="code">
							<li>
								<p class="set1">
									<em>养殖周期</em> <span class="page1"></span>
								</p>
								<p class="set2">
									<i>1</i>
									个月</p>
							</li>
							<li>
								<p class="set1">
									<em>养殖成本</em> <span class="page2"></span>
								</p>
								<p class="set2">
									<i>120.00</i>元/笼</p>
							</li>
							<li>
								<p class="set1">
									<em>出栏价格</em> <span class="page3"></span>
								</p>
								<p class="set2">
									<i>121.20</i>元/笼</p>
							</li>
						</ul>
						<div class="clear"></div>
					</div>

					<!--   两种状态，1.预售 2.抢购中 3.售空 -->
					<div class="snap_up"></div>
							<div class="list">
								<div class="video" display:inline><a style="color:#d73e2e;" href="javascript:tou();">推荐有礼</a></div>
            					<a href=https://www.lenongzhijia.com:443/lnwxfront/productDetail?bId=15009446367253 class="btn">立 即<br />领养</a>
								<div class="text">养成收益<br />
									<span>￥1.20</span>
								</div>
							</div>
						<div class="clear"></div>
				</div>
			</div>
		<a href="<c:url value='/cart/productListEmpty.html'/>" class="issue">往期产品</a>
<!-- <div class="loading" style="margin:0;font-size:0.24rem">已经是最后一条数据</div> -->



<script>
function tou(){
		 gologin($("#basePath").val() +'login/login.jsp',$("#basePath").val() +'login/main.html#list');
	}
	
function gologin(url,referer) {
			var form = document.createElement("form");
			var input = document.createElement("input");
		    
			input.setAttribute("value", referer);
			input.setAttribute("name", "referer");
			
			form.setAttribute("action", url);
			form.setAttribute("method", "post");
			
			form.appendChild(input);
			
		    document.getElementsByTagName("body")[0].appendChild(form);
		    form.submit();
		}
	</script>


