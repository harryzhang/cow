$(function(){
	var basePath = $("#basePath").val();
	var borrowWay = $("#borrowWay").val();
	var company = borrowWay==1?"个":"只";
	$(".company").html(company);
	var startNum = $("#inputNum").val();
	var lastAmount = $("#lastAmount").val();//剩余只数
	var price = $("#unitPrice").val();//产品单价
	if(startNum != null){
		 $("#inputNum").val(startNum);
	}
	//选择数量控件
//	function chooseNum(num){
//		var minus = $(".remove");
//		var plus = $(".add");
		
		 //文本框得到焦点
		 $("#inputNum").click(function(){
			 $("#inputNum").focus();
		});
		//文本框失去焦点
		$("#inputNum").blur(function(){
			var val = $("#inputNum").val();
			if(isNaN(val)){
				getNum(startNum);
				alert("您输入的数量不合法");
				return;
			};
			if (val > parseInt(lastAmount)  ) {
				alert('购买数量不能大于剩余数量');
			}
			val = parseInt(val) >= parseInt(lastAmount) ? lastAmount : val;
			val = val == "" ? 0:val;
			getNum(parseInt(val));
		})
		
		function getNum(val){
			$("#inputNum").val(val);
			var totalNum = dataShow(val,price);	
			var userBalance = $("#userBalance").val();
			var redMoney = $("#redMoney").val();
			$("#total").html(totalNum - redMoney);
		} 
//	};
	
	$(".state_bt_grenn").click(function(){ //显示弹窗
        $(".mee,.sade").slideDown();
	})
	
	$(".mee").click(function(){ //隐藏弹窗
        $(".mee,.sade").hide();
	})
      //减
	$(".jian").on('touchstart',function(){
		var num=$(".menu").find("span").text();
	    var inputVal = $("#inputNum").val();
	    if(num==0){
			alert("当前产品已售罄");
			return;
		}
	    inputVal--;
	    if(parseInt(startNum)>parseInt(inputVal)){
	    	alert("购买数量不能少于"+startNum+"只");
	    }
	    inputVal = inputVal<=1 ? 1 : inputVal;
	    if(parseInt(startNum)>parseInt(inputVal)){
			/*alert("购买数量不能少于"+startNum+"只");*/
			getNum(startNum);
			return;
		}
		getNum(inputVal);
	});
	
	//加
	 $(".jia").on('touchstart',function(){
        var num=$(".menu").find("span").text();
        var inputVal = $("#inputNum").val();
        if(num==0){
			alert("当前产品已售罄");
			return;
		}
        inputVal++;
        if(parseInt(lastAmount) < parseInt(inputVal)){
        	alert("购买数量不能大于"+lastAmount+"只");
        }
        inputVal = inputVal>=num ? num : inputVal;
		if(parseInt(startNum)>parseInt(inputVal)){
			/*alert("购买数量不能少于"+startNum+"只");*/
			getNum(startNum);
			return;
		}
	    var a = getNum(inputVal);
	 });
   
	 $(".bt5").click(function(){
		var inputNum = $("#inputNum").val();
		if(parseInt(inputNum)<=0){
			alert("认养数量不能为0");
			return;
		}
		var bId = $("#borrowId").val(); 
		location.href=basePath+"lnweixin/subOrder?bid="+bId+"&num="+$("#inputNum").val();
//		location.href="http://192.168.0.57:8080/lenong/lnweixin/subOrder?bid="+bId+"&num="+$("#inputNum").val();
	 });
	
	

	
	//这里是剩余只数
	var residueNum = $("#residueNum").html();
	if(residueNum != null){
		residueNum = residueNum.split(',').join('');
		chooseNum(residueNum);
	}
	
	//数据显示
	function dataShow(num1,price){
		return 	num1 * price;
	}
	
	//选择支付方式
	function payStyle(){
		var payStyle = document.getElementsByClassName(".false1");
		for(var i=0;i<payStyle.length;i++){
			payStyle[i].addEventListener('touchend',function(event){
				event.preventDefault();
				if(this.getAttribute('class') != 'true1'){
					for(var i=0;i<payStyle.length;i++){
						payStyle[i].className = 'false1';
						investNum = 0;//重新选择支付方式可重复提交
					}
					this.className = 'false1 true1';
				}
			},false);
		}
	}
	payStyle();

	var investNum = 0;  //点击投资次数
	function payBtn(){
		//购买
		$("#pay_btn").click(function(){
			var totalNum = $("#total").html();
			var userBalance = $("#userBalance").val();
			var realName = $("#realName").val();
			var idNo = $("#idNo").val();
			var num = $("#inputNum").val();//投标个数
			var bankCardNo = $("#bankCardNo").val();//银行卡号\
			if(investNum>0){
				alert("不能重复提交");
				investNum = 0;
				return;
			}
			investNum = 1;
			if(num<1){
				alert("请输入购买数量");
				return;
			}
			if(parseInt(startNum)>parseInt(num)){
				alert("购买数量不能少于"+startNum+"只");
				return;
			}

			if(realName==""&&idNo=="" ){
				location.href=$("#basePath").val()+"lnweixin/getSecUserBankList";//跳转实名认证 绑卡
				return;
			}
			if(bankCardNo==""){
				location.href=$("#basePath").val()+"lnweixin/getSecUserBankList";//跳转绑卡页面
				return;
			}
			var _index = null;
			$(".false1").each(function(index){
				if($(".false1").eq(index).hasClass("true1")){
					_index = $(".false1").eq(index).attr("flag");
				}
			})
			//验证抵用券
			if(!checkVoucher()){
				return;
			}
			if(_index == 2){
				toRecharge();
				return;
			}
			
			
			if(userBalance==""){
				location.href=$("#basePath").val()+"h5/page/login.jsp";
				return;
			}
			
			//体验金可以购买
			if(!($("#usrType").val() == '1')){
				if(parseInt(totalNum)>parseInt(userBalance)){
					alert("您的账户余额不足，请重新选择");
					return;
				}	
			}
			
			
			
			var param = {};
			var bid = $("#borrowId").val();//borrowId
			var borrowWay = $("#borrowWay").val();//borrowWay
			var amount = $("#total").html();//购买金额
			var redId = $("#redId").val();
			param["amount"] = amount;
			param["bid"] = bid;
			param["borrowWay"] = borrowWay;
			param["num"] = num;
			param["redId"] = redId;
			$.ajax({
				type:"POST",
				cache : false,
				async : false,// 设置同步执行！
				url:$("#basePath").val()+"lnweixin/invest",
				data:param,
				dataType:"json",
				success:function(data){
					if(data.msg==3){
						location.href=$("#basePath").val()+"h5/page/login.jsp";
					}else if(data.msg == 0){//投资成功
						location.href=$("#basePath").val()+"lnweixin/investResult?investResult=true";
					}else{
						location.href=$("#basePath").val()+"lnweixin/investResult?investResult=false&state="+data.state;
					}
				},
			});
			
		});
	}
	payBtn();
	
	function checkVoucher(){
		var voucherMoney = $("#voucherMoney").html();
		var redMoney = $("#redMoney").val();
		var total = $("#total").html();
		total = parseInt(total) + parseInt(redMoney);
		if(total<3000&&voucherMoney=="10元"){
			alert("您投资的金额暂不支持使用抵用券");
			return false;
		}
		if(total<6000&&voucherMoney=="20元"){
			alert("您投资的金额暂不支持使用20元抵用券");
			return false;
		}
		if(total<9000&&voucherMoney=="30元"){
			alert("您投资的金额暂不支持使用30元抵用券");
			return false;
		}
		if(total<12000&&voucherMoney=="100元"){
			alert("您投资的金额暂不支持使用100元抵用券");
			return false;
		}
		return true;
	}
	
	function toRecharge(){
		var bid = $("#borrowId").val();//borrowId
		var amount = $("#total").html();//购买金额
		var bankCode = $("#bankCode").val();
		var bankName = $("#bankName").val();
		var redId = $("#redId").val();
		location.href=$("#basePath").val()+"lnwxfront/orders?amount="+amount+"&channel=2&borrowId="+bid+"&bankCode="+bankCode+"&bankName="+bankName+"&redId="+redId;
	}
	
	//选项卡
	function Tab(){
		$(".farm_tab a").click(function(){
			$(this).addClass('current').siblings().removeClass('current');
			var index = $(this).index();
			$(".tab_content > div").eq(index).show().siblings().hide();	
		})
	}
	Tab();
	var curPage = 2;
	//数据加载
	function loadData(aPage){
		//这里加载数据
		$.ajax({
			type : "POST",
			cache : false,
			async : false,// 设置异步为false,重要！
			dataType : "html",
			url : $("#basePath").val() + 'lnwxfront/investrecord',
			data : {
				bid : $("#borrowId").val(),
				curPage : curPage,
				pageSize : 5,
				type:1
			},
			success : function(data) {
				var message = eval('('+data+')');
				var msg = eval('('+message.message+')')
				var payList = $(".list2 ul").html();
				var showData = "";
				var index = $("index").val();
				var pageId = msg.pageUtil.pageId;
				if(msg.list.length==0){//如果结果集为0 
					$("#loading").html('暂无数据');
					return;
				}
				var rowCount = msg.pageUtil.rowCount;
				var nowCount = $(".list2 ul li").length;
				if(rowCount>nowCount){
					for(var i=0;i<msg.list.length;i++){
						var obj = msg.list[i];
						var single = obj.borrowWay == 1?"个":"只";
						if($("#pageCount").val()>1){
							showData += "<li><i>"+(5*pageId-4+i)+"</i><p><em>"+obj.busUserModel.mobilePhone+"</em><strong>"+obj.investTimeStr+"</strong></p>";
							showData +="<span>"+(obj.num*obj.unitPrice)+"元("+obj.num+single+")</span></li>";
						}
					}
					$(".list2 ul").html(payList+showData);
				}
			}
		});	
	}
	
	//滚动加载
	$(window).scroll(function(){ 
		//如果是投资人列表，则运行下一步
		$('.list2 ul').hasClass('current') && scrollLoad();
	})
	
	//判断是否到底
	function scrollLoad(){
		var scrollTop = $(document).scrollTop();
		var wHeight = $(window).height();
		var liHeight = $(".list2 li").height();
		if(liHeight!=null){
			var offsetTop = $(".list2 li:last").offset().top;
		}
		if(offsetTop <= wHeight + scrollTop - liHeight){
			curPage++;
			if(curPage<= parseFloat($("#pageCount").val())){
				loadData(curPage);
			}else{
				$("#loading").html('已经加载到最后一页');
			}
		}
	} 
	
	downTime();
	//刷新页面倒计时
	function downTime(){
		if($(".count_time").length>0){
			var d = new Date(Date.parse($("#now").val().replace(/-/g, "/")));
				$(".count_time").each(function(i){
				var rt=new Date(Date.parse($(this).val().replace(/-/g, "/")));
				var mise=(rt.getTime()-d.getTime())/1000;//时间差，单位秒
				var intervalTime = setInterval(function(){
					if(mise>0){
		    	        //计算出相差天数
		    	        var days = Math.floor(mise/(24 * 3600));
		    	        if (days < 1) {
		    	        	  //计算出小时数
			    	        var hours = Math.floor(mise/(3600)- days*24);
			    	        //计算相差分钟数
			    	        var minutes = Math.floor(mise/(60)-days*24*60-hours*60);
			    	        //计算相差秒数
			    	        var seconds = Math.round(mise-days*24*60*60-hours*60*60-minutes*60);
			    			var ss=hours+"时"+minutes+"分"+seconds+"秒";
			    			mise=mise-1;
			    			$(".time").html(ss);
						}else {
							$(".time").html("剩余"+days+"天");
						}
					}else{
						if(mise==0){
							window.location.reload();
						}
					}
		    	},1000);
			});
		}
	};
	
	
	
	//抵用券
	var h = $(window).height();
	$(".ticket_use").css("top",h);
	
	function ticketShow(){
		var userBalance = $("#userBalance").val();
		if(userBalance==""){
			location.href=$("#basePath").val()+"h5/page/login.jsp";
			return;
		}
		$(".ticket_use").show().animate({'top':0},300,"linear",function(){
			
			$.ajax({
				type : "POST",
				cache : false,
				async : false,// 设置异步为false,重要！
				dataType : "html",
				url : $("#basePath").val() + 'lnwxfront/voucherList',
				data : {
					bid : $("#borrowId").val(),
					curPage : curPage,
					pageSize : 5,
					type:1
				},
				success : function(data) {
					var message = eval('('+data+')');
					var msg = eval('('+message.message+')')
					if(data.msg==3){
						location.href=$("#basePath").val()+"h5/page/login.jsp";
					}
					if(msg.length==0){
						//暂无可使用抵用券
						$(".no_ticket").show();
						$(".ticket_list").hide();
						return;
					}
					var ticket_list = $(".ticket_list").html();
					var show = "";
					for(var i=0;i<msg.length;i++){
						var obj = msg[i]; 
						var remark = "";
						if(obj.voucherHaveAmount==10){
							remark = "<h3>满3000元以上<br/>即可使用"+obj.voucherHaveAmount+"元现金抵用券</h3>";
						}
						if(obj.voucherHaveAmount==20){
							remark = "<h3>满6000元以上<br/>即可使用"+obj.voucherHaveAmount+"元现金抵用券</h3>";
						}
						if(obj.voucherHaveAmount==30){
							remark = "<h3>满9000元以上<br/>即可使用"+obj.voucherHaveAmount+"元现金抵用券</h3>";
						}
						if(obj.voucherHaveAmount==100){
							remark = "<h3>满12000元以上<br/>即可使用"+obj.voucherHaveAmount+"元现金抵用券</h3>";
						}
//						有效期至："+obj.endTimeStr+"
						show +="<li class=\"clearfix\"><div class=\"ticket_left\"><div class=\"ticket_money\">"+obj.voucherHaveAmount+"<span>元</span></div></div>" +
								"<div class=\"ticket_right\">"+remark+"<p>有效期至：长期有效</p></div>" +
								"<em avalue="+obj.voucherHaveAmount+" redId="+obj.id+"></em></li>";
					}
					$(".ticket_list ul").append(show);
					
					$(".ticket_list li").click(function(ev){
						ev.stopPropagation();
						$(this).find('em').addClass("ticket_choose_icon").parents('li').siblings().find('em').removeClass("ticket_choose_icon");	
					});
					$(".ticket_use_btn").click(function(){
						var ticket_money = $(".ticket_choose_icon").attr("avalue");
						if(ticket_money!=undefined){
							$("#redId").val($(".ticket_choose_icon").attr("redId"));
							$("#redMoney").val(ticket_money);
							$("#voucherMoney").html(ticket_money+"元");
							var choose_val = $("#inputNum").val();
							var price = $("#unitPrice").val();
							$("#total").html((choose_val*price)-ticket_money);
						}
						ticketHide();
					});
				}
			});	
			
		});
	};
	function ticketHide(){
		$(".mee").show();	
		/*$(".ticket_use").animate({'top':h},300,"linear",function(){*/
		$(".ticket_use").hide();
			$(".ticket_list li").find('em').removeClass("ticket_choose_icon");
		/*});	*/
	}
	$("#redPacket").click(function(ev){
		ev.stopPropagation();
		ticketShow();
		$(".mee").hide();
	});
	
	$(".ticket_use").click(function(){
		$(".total").html($("#totalHide").val());
		$("#voucherMoney").html("可选择抵用券");
		ticketHide();	
	});
	
	//阻止冒泡
	$(".ticket_use a").click(function(ev){
		ev.stopPropagation();
	})
	
/*	if($(".btn3").attr("id")!="waitTime"){
		$(".btn3").click(function(){
	        $(".mee").show();
	    })
	}else{
		return;
	}*/
	$(".btn3").click(function(){
        $(".mee").show();
    })

$(".cancel").find("a").click(function(){
   $(".mee").hide(); 
})

//复选框切换
$(".host").find(".chebox").toggle(function() {
    $(this).addClass('true');
}, function() {
    $(this).removeClass('true');
});

//下拉
$(".page1").toggle(function(){
    $(this).siblings('.nav').slideDown();
    $(this).css({"background":"url(../h5/images/page/top.png) no-repeat right center"});
},function(){
    $(this).siblings('.nav').slideUp();
    $(this).css({"background":"url(../h5/images/page/bottom.png) no-repeat right center"});
});

//下拉(购买记录)
$(".investRecord").toggle(function(){
    $(this).siblings('.nav').slideDown();
    $(this).css({"background":"url(../h5/images/page/top.png) no-repeat right center"});
    loadData(1);
    $(".list2").show();
},function(){
    $(this).siblings('.nav').slideUp();
    $(this).css({"background":"url(../h5/images/page/bottom.png) no-repeat right center"});
});

//金额支付切换
$(".pay").find("b").click(function(){
    $(this).addClass('true1').parent().siblings('li').find('b').removeClass('true1');
})

var height=$(document).height();
$(".mee,.wrap").css({"height":height});

//剩余多少只
var tage=$('.msg_con').find('b').text();
$('.bg_number').css({"height":0});
$('.bg_number').animate({
    "height":0
},500).animate({
    "height":tage
}, 1000);
});