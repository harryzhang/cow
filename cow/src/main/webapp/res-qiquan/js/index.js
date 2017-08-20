	$(function(){
			var _height = $(window).height();
			$(".index_bg").css("height",_height);	
			
			var _width = $(document).width();
			/*$(".account_module ul li").css({'width':_width/3 , 'height':_width/3});*/
			//导航
			var oNav = document.getElementsByClassName("nav")[0];
			var aa = oNav.getElementsByTagName("a");
			var aImg = oNav.getElementsByTagName("img");
			
			//历史记录
			var oDiv = document.getElementsByClassName("page");
			
			function init(){
				var firstHash = window.location.href.split("#")[1] || 'index';
				HashTrigger(firstHash,oDiv);
			}
			init();
			
			for(var i=0;i<aa.length;i++){
				aa[i].index = i;
				aa[i].onclick = function(){
					var hash = this.dataset.hash;
					window.location.hash = hash;
					HashTrigger(hash,oDiv);
				}	
			}	
			window.onhashchange = function(){
				var hash = window.location.hash;
				var query = hash.split("#")[1];
				query = query ? query : "index";
				HashTrigger(query,oDiv);
			};
			
			function HashTrigger(target,obj){
				if(target=="account"){ //点击我的账户 如果用户未登录调整登录页面 
					var loginUser = $("#loginUser").val();
		    		if(loginUser==null||loginUser ==""){
		    			location.href=$("#basePath").val()+'login/login.html';
						return;
		    		}
				}
				
				for(var i=0;i<obj.length;i++){
					if( target == obj[i].dataset.hash ){
						for(var j=0;j<obj.length;j++){
							obj[j].style.display = 'none';
						}
						obj[i].style.display = 'block';
					}
				}
				switch(target){
					case 'index':
						Nav(1);
						funcIndex();
						break;
					case 'list':
						Nav(2);
						funcProduct();
						scrollLoad();
						break;
					case 'account':
						Nav(3);
						funcAccount();
						break;
				}
			}
			
	    	function Nav(num){
	    		for(var j=0;j<aImg.length;j++){
					aImg[j].src = $("#basePath").val()+ 'res-qiquan/images/nav'+(j+1)+'.png';	
					aa[j].className = '';
				}
				aa[num-1].className = 'nav_current';
				aImg[num-1].src=$("#basePath").val()+ 'res-qiquan/images/nav0'+(num)+'.png';
				num == 1 ? $(".main").css("padding-bottom",0) : $(".main").css("padding-bottom","1rem");
	    	}
    	});

    	function funcAccount(){
    		//这里加载数据
			$.ajax({
				type : "POST",
				cache : false,
				async : false,// 设置异步为false,重要！
				dataType : "html",
				url : $("#basePath").val() + '/lnwxfront/mynewdata',
				success : function(data) {
					var message = eval('('+data+')');
					var msg = eval('('+message.message+')');
					if(msg.sessionUser=="1"){
						location.href=$("#basePath").val()+'login/login.html';
						return;
					}
					$("#balance").html(msg.balance+'元'); 
					$("#stillMoney").html(msg.stillMoney+'元'); 
					$("#stayBackMoney").html(msg.stayBackMoney+'元');
					msg.niu=="0"?$("#niu").replaceWith($("#niu").html()):$("#niu").html(msg.niu); 
					msg.ji=="0"?$("#ji").replaceWith($("#ji").html()):$("#ji").html(msg.ji); 
					msg.yang=="0"?$("#yang").replaceWith($("#yang").html()):$("#yang").html(msg.yang); 
					msg.zhu=="0"?$("#zhu").replaceWith($("#zhu").html()):$("#zhu").html(msg.zhu); 
					msg.dp=="0"?$("#dp").replaceWith($("#dp").html()):$("#dp").html(msg.dp);
					msg.activityCount=="0"?$("#activityCount").replaceWith($("#activityCount").html()):$("#activityCount").html(msg.activityCount); 
					msg.earTagCount=="0"?$("#earTagCount").replaceWith($("#earTagCount").html()):$("#earTagCount").html(msg.earTagCount); 
				}	
			});	
		};
		
		function funcProduct(){
//			var swiper = new Swiper('.swiper-container', {
//	    		loop : true,
//				autoplay : 3000,
//				autoplayDisableOnInteraction: false
//			});
			var curPage = 1;
			$(".list_box ul").html(loadData(curPage));
		}
		var offOn = true;
		//判断是否到底
		function scrollLoad(){
			var page =1;
			$(window).scroll(function(){
			/*	var wHeight = $(window).height();
				var navHeight = $(".nav").height();
				var liHeight = $(".list li").height();
				var offsetTop = $(".list li:last").offset().top;
				if(liHeight !=0){  
					var scrollTop = $(document).scrollTop();
					if(scrollTop <= 500){
						page = 1;
					};
					if(scrollTop >= offsetTop + navHeight + liHeight - wHeight){ 
						if(offOn){
							offOn = false;
							if(page <= parseFloat($("#pagesCount").val())){
								var str = $(".list ul").html();
								page++; 
								$(".list ul").html(str + loadData(page));
							}else{
								$(".loading").html('已经加载到最后一页');
							}
						}
					}
				}; */
			});
		}
		
	//数据加载
	function loadData(aPage){
		var showData = "";
		//这里加载数据
		$.ajax({
			type : "POST",
			cache : false,
			async : false,// 设置异步为false,重要！
			dataType : "html",
			url : $("#basePath").val() + 'cart/cart.html',
			data : {
				curPage : aPage,
				type:2
			},
			success : function(data) {
				$("#loading").html(data);
				
			}
			});
	}
	
	
	//加载首页
	function funcIndex(){
		
		$.ajax({
			type : "POST",
			cache : false,
			async : false,// 设置异步为false,重要！
			dataType : "html",
			url :$("#basePath").val() + 'firstpage/toFirstpage.html',
			data : {},
			success : function(data) {
				$("#index_content").html(data);
			}
			});
		
		//window.location.href= $("#basePath").val() + 'firstpage/toFirstpage.html';
	}
