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
			<img src="/res-qiquan/images/animal_4.png" alt="" />第190期榆社笨鸡蛋
		</p>
		<c:forEach items="${goodLst}" var="item">
		<div class="content">
			<img class="pag1" src="<c:url value='${item.imageSrc }'/>" height="120"
				width="120" alt="" />
			<ul class="code">
				<li>
					<p class="set1">
						<em>养殖周期</em> <span class="page1"></span>
					</p>
					<p class="set2">
						<i>${item.peroid}</i>
						天</p>
				</li>
				<li>
					<p class="set1">
						<em>养殖成本</em> <span class="page2"></span>
					</p>
					<p class="set2">
						<i>${item.costPrice}</i>${item.gunite}</p>
				</li>
				<li>
					<p class="set1">
						<em>出栏价格</em> <span class="page3"></span>
					</p>
					<p class="set2">
						<i>${item.price}</i>${item.gunite}</p>
				</li>
			</ul>
			<div class="clear"></div>
		</div>

		<!--   两种状态，1.预售 2.抢购中 3.售空 -->
		<c:choose>
		   <c:when test="${item.status eq 1 }">
		   		<div class="snap_up"></div>
			<div class="list">
				<div class="video" display:inline>
					<a style="color:#d73e2e;" href="javascript:;">${item.bandName}</a>
				</div>
        		<a href="<c:url value='/cart/productDetail?bId=${item.id}'/>" class="btn">立 即<br />领养</a>
				<div class="text">
				         养成收益<br />
					<span>￥${item.income}</span>
				</div>
			</div>
		   </c:when>
		   <c:when test="${item.status eq 2 }">
		   		<div class="end"></div>
		   </c:when>
		</c:choose>
		<div class="clear"></div>
		</c:forEach>
	</div>
</div>
	
	
<a href="<c:url value='/cart/productListEmpty.html'/>" class="issue">往期产品</a>

<!-- <div class="loading" style="margin:0;font-size:0.24rem">已经是最后一条数据</div>  -->