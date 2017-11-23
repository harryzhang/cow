<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
 	<link type="text/css" href="<c:url value='/res-qiquan/css/topnav.css" rel="stylesheet'/>"/>
 	
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
    <meta name="x5-fullscreen" content="true">
    <meta name="x5-page-mode" content="app">
    <meta name="fragment" content="!">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="stylesheet" href="<c:url value='/res-qiquan/css/home_base.css'/>">
    <link rel="stylesheet" href="<c:url value='/res-qiquan/css/home_main.css'/>">
    <script type="text/jscript" src="<c:url value='/res-qiquan/js/jquery-1.8.3.js'/>"></script>
</head>

<body style="background:#fff">
    <div class="oni-mmRouter-slide-wrapper">
	    <div class="top-nav-new">
	        <a class="link" href="javascript:history.go(-1);">返回</a>
	        <h1>上传付款凭证</h1>
	    </div>
	    
		<img  src="<c:url value='/res-qiquan/images/uploadImg.jpg'/>" id="imgDiv"  style="width:50%;margin: 10% 20%">
		    
		<div style="display:none">
			<input id="token" value="${token}" />
			<input id="file" accept="image/png, image/jpeg, image/jpg" type="file">
		</div>
	</div>
	
</body>
</html>
<script type="text/javascript">

var eleFile = document.querySelector('#file');
var compress = 30;

// base64地址图片加载完毕后
function uploadImag(imgObj){

		// 压缩前尺寸
		var 
			initSize = imgObj.length,
			width = imgObj.width,
			height = imgObj.height
			console.log(initSize, width, height)


		// 如果图片大于四百万像素，计算压缩比并将大小压至400万以下
		var ratio = null
		if ((ratio = width * height / 4000000)>1) {
			
			ratio = Math.sqrt(ratio)
			width /= ratio
			height /= ratio

		}else {
			ratio = 1
		}
		console.log('ratio = ' + ratio)


		// 生成canvas
		var 
			canvas = document.createElement('canvas'),
			tCanvas = document.createElement('canvas')

		canvas.width = width
		canvas.height = height

		// 获取画笔
		var 
			ctx = canvas.getContext('2d'),
		// 切片carvas画笔
			tctx = tCanvas.getContext('2d')


		// 绘制底色
		ctx.fillStyle = "#fff"
		ctx.fillRect(0, 0, canvas.width, canvas.height)


		// 如果图片像素大于100万则使用瓦片绘制
		var count
		if ((count = width * height / 1000000) > 1) {

			//计算要分成多少块瓦片
			count = ~~(Math.sqrt(count)+1)

			// 计算每块瓦片的宽和高
			var nw = ~~(width / count)
			var nh = ~~(height / count)

			tCanvas.width = nw
			tCanvas.height = nh

			for (var i = 0; i < count; i++) {
				for (var j = 0; j < count; j++) {
					tctx.drawImage(imgObj, i * nw * ratio, j * nh * ratio, nw * ratio, nh * ratio, 0, 0, nw, nh)
					ctx.drawImage(tCanvas, i * nw, j * nh, nw, nh)
				}
			}
		} else {
			ctx.drawImage(imgObj, 0, 0, width, height)
		}
		console.log('count = ' + count)


		var qualityImage = canvas.toDataURL('image/jpeg', compress/100)
		console.log("compress:"+compress);
		console.log('压缩前： ' + initSize, '压缩后：' + qualityImage.length)        
				
		
		$.ajax({
			type : "POST",
			cache : false,
			async : false,// 设置异步为false,重要！
			dataType : "json",
			url : "<c:url value='/wallet/uploadPayImg.html'/>",
			data : {"file":qualityImage},
			success : function(data) {
	              if(data.resultCode == "0"){
	            	  document.querySelector('#imgDiv').src="<c:url value='/wallet/showImg.html'/>?imgPath="+data.filePath;
	            	  alert('上传成功');
	            	  setTimeout('window.location.href="<c:url value='/order/success.html'/>"', 3000 )
	              }else{
	            	  alert(data.result);
	              }
			}
		});
		tCanvas.width = tCanvas.height = canvas.width = canvas.height = 0;
		
};

eleFile.addEventListener('change', function (event) {
    var file = event.target.files[0];
    // 选择的文件是图片
    if (file.type.indexOf("image") == 0) {
		var reader = new FileReader();
		// 文件base64化，以便获知图片原始尺寸
		reader.onload = function(e) {
			// 压缩图片需要的一些元素和对象
			var img = new Image();
			img.src = e.target.result;
			uploadImag(img);
		};

        reader.readAsDataURL(file);    
    }
});

var imgDiv = document.querySelector('#imgDiv');
imgDiv.addEventListener('click', function (event) {
    eleFile.click();
});
			
</script>
