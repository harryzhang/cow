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
		    			location.href=$("#basePath").val()+'h5/page/login.jsp';
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
			
			/*function dataLoad(target){
				switch(target){
					case 'index':
						break;
					case 'list':
						funcProduct();
						scrollLoad();
						break;
					case 'account':
			    		funcAccount();
						break;
				}
			}*/
			
	    	function Nav(num){
	    		for(var j=0;j<aImg.length;j++){
					aImg[j].src = '../images/nav'+(j+1)+'.png';	
					aa[j].className = '';
				}
				aa[num-1].className = 'nav_current';
				aImg[num-1].src='../images/nav0'+(num)+'.png';
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
						location.href=$("#basePath").val()+'h5/page/login.jsp';
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
			/*downTime();*/
			
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
				url : $("#basePath").val() + 'lnwxfront/productList',
				data : {
					curPage : aPage,
					type:2
				},
				success : function(data) {
					$("#loading").html(data);
					
				}
				});
			}
		
		/*//数据加载
		function loadData(aPage){
			var showData = "";
			//这里加载数据
			$.ajax({
				type : "POST",
				cache : false,
				async : false,// 设置异步为false,重要！
				dataType : "html",
				url : $("#basePath").val() + 'lnwxfront/productList',
				data : {
					curPage : aPage,
					type:2
				},
				success : function(data) {
					if(data=="")return;
					var message = eval('('+data+')');
					var msg = eval('('+message.message+')');
					
					if(msg.dataList.length==0){//如果结果集为0 
						$(".loading").html('暂无数据');
						return;
					}
					if(msg.dataList.length<10){
						$(".loading").html('已经是最后一条数据');
					} 
					var basePath = $("#basePath").val();
					for(var i=0;i<msg.dataList.length;i++){
						var obj = msg.dataList[i]; 
						if(msg.pageCount>=1){
							var url = $("#basePath").val()+"lnwxfront/productDetail?bId="+obj.id;
							var borrowTitle = obj.borrowTitle.length>=10?obj.borrowTitle.substr(0,10):obj.borrowTitle;
							var company = obj.borrowWay == 1?"个":"只";
							var countTime = obj.borrowStatus ==1?obj.countTime:"";
							showData += "<li><a href="+url+"><div class=\"product_tit clearfix\">" +
									"<input type=\"hidden\" class=\"bId\" value="+obj.id+"/>" +
									"<h3>"+borrowTitle+"<img src="+basePath+obj.logoImage+"></h3>"+obj.returnBorrowStatus+countTime+"</div>" +
									"<ul class=\"product_list clearfix\"><li><h4>"+obj.unitPrice+"元</h4><p>单　价</p></li>" +
									"<li><h4>"+obj.annualRate+"%</h4><p>预期年化收益率</p></li>"+
									"<li><h4>"+obj.returnCycle+"</h4><p>预计养殖周期</p></li></ul>";  
						}
					}
					$("#pagesCount").val(msg.pageCount);
					$("#now").val(msg.now);
					offOn = true;
				}
			});	
			return showData;
		}
*/
		
		//倒计时 已经取消
	/*	function downTime(){
			if($("span[name='remainTime']").length>0){
				var d = new Date(Date.parse($("#now").val().replace(/-/g, "/")));
		    	$("span[name='remainTime']").each(function(i){
		    		var obj = $(this);
					var rt=new Date(Date.parse($(this).attr("avalue").replace(/-/g, "/")));
					var mise=(rt.getTime()-d.getTime())/1000;//时间差，单位秒
		    		setInterval(function(){
		    			if(mise>0){
			    	        //计算出相差天数
			    	        var days = Math.floor(mise/(24 * 3600));
			    	        //计算出小时数
			    	        var hours = Math.floor(mise/(3600)- days*24);
			    	        //计算相差分钟数
			    	        var minutes = Math.floor(mise/(60)-days*24*60-hours*60);
			    	        //计算相差秒数
			    	        var seconds = Math.round(mise-days*24*60*60-hours*60*60-minutes*60);
			    			var ss=days+"天"+hours+"时"+minutes+"分"+seconds+"秒";
			    			mise=mise-1;
			    			obj.text(ss);
		    			}else{
		    				location.href=$("#basePath").val()+"lnwxfront/productList";
		    				window.location.reload();
		    			}
			    	},1000);
		    	});
			}
		}*/
		