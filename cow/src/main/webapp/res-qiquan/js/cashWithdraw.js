var flag = true;
function tixian(){
	var param = {};
	param["money"] = $("#withdraw_money").val();
	param["paycode"] = $("#password").val();
	var balance_money = $("#balance_money").val();
	param["bankId"] = $("#bankId").val();
	if(!cashCheck(param["money"])){
		return;
	}
	var cha = parseFloat(param["money"]) ;
	var cha2 = parseFloat(param["money"])  - parseFloat(balance_money);
	/*if(cha < 100){
		showTipMsg("兑现金额必须大于100元！");
		//$("#withdraw_money").val("");
		//$("#password").val("");
		return ;
	}*/
	if(cha2 > 0){
		showTipMsg("兑现金额不能大于账户余额！");
		//$("#withdraw_money").val("");
		//$("#password").val("");
		return ;
	}
	if(param["paycode"]==''){
		showTipMsg("兑现密码不能为空");
		//$("#password").val("");
		return ;
	}
	if(isCheckPassword(param["paycode"].toLowerCase())){
		showTipMsg("不能含有非法字符");
		return;
	}
	if(!flag){
		showTipMsg("不能重复点击!");
		return;
	}
	
	flag = false;
	$.ajax({
		type : "POST",
		cache : false,
		async : false,// 设置异步为false,重要！
		dataType : "json",
		url : $("#lnfund").val()+ "lnweixin/withdrawnregister",
		data : param,
		beforeSend:function(XMLHttpRequest){
			$("#sbtn").attr("disabled","disabled");
        },
		success : function(data) {
			flag = true;
			$("#sbtn").removeAttr("disabled");
			if(data.key == 1){
				window.location.href= $("#lnfund").val() + 'lnweixin/withDrawSuccess';
			}else if(data.key == 2){
				showTipMsg(data.msg);
		    }else{
				showTipMsg(data.msg);
			}
		}
	});
}

function cashCheck(money){
	var patrn = /^\d+(\.\d+)?$/ ;
	var patrnDecimal = /^\d+(\.\d{0,2})?$/g;
	if(!patrn.test(money)){
		showTipMsg("请输入正确的金额");
		return false;
	}
	if(money<100){
		showTipMsg("兑现金额必须大于100元");
		return false;
	}
	if(!patrnDecimal.test(money)){
		showTipMsg("兑现金额只能有两位小数");
		return false;
	}
	showTipMsg("");
	return true;
}

function reachmove(money){
	var patrn = /^\d+(\.\d+)?$/ ;
	var patrnDecimal = /^\d+(\.\d{0,2})?$/g;
	if(!patrn.test(money)){
		showTipMsg("请输入正确的金额");
		//$("#withdraw_money").val("");
		isFlag = false;
		return false;
	}else{
		if(money<0.03){
            showTipMsg("充值金额最少为0.03元");
    		//$("#withdraw_money").val("");
    		isFlag = false;
    		return false;
        } 
        if(money>1000000){
        	 showTipMsg("充值金额最多为100万元");
     		//$("#withdraw_money").val("");
     		isFlag = false;
     		return false;
        } 
        if(!patrnDecimal.test(money)){
        	 showTipMsg("充值金额小数不能超过两位");
        	isFlag = false;
     		return false;
        }
		isFlag = true;
		showTipMsg("");
	}
}

$(".tab li").each(function(i){
    $(this).click(function(){
        $(this).addClass('cur').siblings('li').removeClass('cur');
        $(".cption").eq(i).show().siblings('.cption').hide();
        showTipMsg("");//清空提示
        $("#rechargeMoney").val("");//清空充值框
        $("#withdraw_money").val("");//清空兑现框
        $("#password").val("");//清空兑现密码框
        
    })
})

function init(){
	var isRecharge = $("#isRecharge").val();
	if(isRecharge=="no"){
		$("#withdrawDetail").show();
		$("#rechargeDetail").hide();
	}else{
		$("#rechargeDetail").show();
		$("#withdrawDetail").hide();
	}
}


var timer2 = 120;
var tipId2;
var isFlag = true;
$("#rechargeBtn").click(function(){
	var rechargeMoney = $("#rechargeMoney").val();
	var bankId = $("#bankId").val();
	if(isFlag==false){
		return;
	}
	if(rechargeMoney==""){
		showTipMsg("充值金额不能为空");
		return;
	}
	var params = {};
	params['amount'] = rechargeMoney;
	params['bankId'] = bankId;
	params['channel']=2;
	$.ajax({
		type : "POST",
		cache : false,
		async : false,
		dataType : "json",
		url : $("#lnfund").val()+"lnwxfront/getYBPayCode",
		data :params,
		success : function(data) {
			if(data){
				if(data&&data.success==true){
					tipId2 = window.setInterval(rtimer2, 1000);
					$("#reSendCode").attr("disabled","disabled").addClass("grev");
					$("#requestNo").val(data.msg);
					$('.mtt,.mask_bg').removeClass('hide');
				}else{
					alert(data.msg);
				}
			}else{
				alert("系统繁忙，请稍后重试")
			}
			
		}
	})
//	tipId2 = window.setInterval(rtimer2, 1000);//测试一下这个时间
//	$("#reSendCode").attr("disabled","true").addClass("grev");
//	$('.mtt,.mask_bg').removeClass('hide');
})

$("#reSendCode").click(function(){
	if($("#reSendCode").attr("disabled")){
		return;
	}
	//$("#reSendCode").attr("disabled","disabled").addClass("grev");
	//tipId2 = window.setInterval(rtimer2, 1000);
	var params = {};
	params['requestNo'] = $("#requestNo").val();
	$.ajax({
		type : "POST",
		cache : false,
		async : false,
		dataType : "json",
		url : $("#lnfund").val()+"lnweixin/resendRechargeCode",
		data :params,
		success : function(data) {
			if(data.responseCode=="0000"){
				timer2=120;
				$("#reSendCode").attr("disabled","disabled").addClass("grev");
				tipId2 = window.setInterval(rtimer2, 1000);
				$("#requestNo").val(data.message);
			}else if(data){
				alert(data.message);
			}
			
		}
	})
});

 function rtimer2() {
	if (timer2 > 0) {
		$("#reSendCode").html(timer2 + "秒后重新获取");
		timer2--;
	} else {
		window.clearInterval(tipId2);
		$("#reSendCode").html("重新发送").removeAttr("disabled").removeClass("grev");;
		timer2 = 120;
		codeValid = false;
	}
}

 //验证
function confirmCode(){
	var validateCode =  $("#rechargeCode").val();
	if(validateCode==""){
		$("#validateMsg").html("请输入验证码");
		return;
	}
	var params = {};
	params['requestNo'] = $("#requestNo").val();
	params['validateCode'] = validateCode;
	params['channel'] = '2';
	$.ajax({
		type : "POST",
		cache : false,
		async : false,
		dataType : "json",
		url : $("#lnfund").val()+"lnwxfront/ybOrders",
		data :params,
		success : function(data) {
			if(data.responseCode=="0000"){
				$("#validateMsg").html("");
				alert("充值成功！");
				location.href=$("#lnfund").val()+"lnweixin/userIndex";
			}else{
				$("#validateMsg").html(data.message);
				$('.box_pw').val('');
			}
		}
	})
}
 

$(".qx").click(function(){
	$("#reSendCode").html("获取验证码");
	$("#validateMsg").html("");
	 window.clearInterval(tipId2);
	 timer2 = 120;
    $(".mee2,.side").hide();
})

$('.mtt span').on('click',  function(event) {
	    $('.mtt,.mask_bg').addClass('hide');
	    $('.box_pw').val('');
	    $("#validateMsg").html("");
	    window.clearInterval(tipId2);
		timer2 = 120;
	});

function showTipMsg(msg) {
	$(".error_notice #error-box").show();
	$(".error_notice #error-box").html(msg);
}