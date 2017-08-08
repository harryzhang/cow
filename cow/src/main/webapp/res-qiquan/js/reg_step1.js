var flag = true;
var flagEffer = true;
//var regexPhone = /^13[0-9]{9}|15[012356789][0-9]{8}|18[012356789][0-9]{8}|147[0-9]{8}$/;

var regexPhone =/^13[0-9]{9}|15[0123456789][0-9]{8}|17[0123456789][0-9]{8}|18[0123456789][0-9]{8}|147[0-9]{8}$/;
var val=0;

$(function(){
	if($("#usrChannel").val()!=null && $("#usrChannel").val()!=''&&$("#usrChannel").val()!='null'){
		setCookie("usrChannel",$("#usrChannel").val());
	}
	switchCode();
	if($("#refferee").val()!=null && $("#refferee").val()!=""){
		$(".reg_recom li[val='1']").addClass("checked");
		$(".reg_recom li[val='1']").siblings().removeClass("checked");
		val = 1 ;
		flagEffer = true;
		//$(".reg_recom li").attr("val");
		$(".reg_recom li").parent().siblings(".input_box2").show();
	}
	
	
	$("#phoneNo").focus();
	$(".reg_recom li").click(function() {
		val = $(this).attr("val");
        $(this).siblings().removeClass("checked");
		$(this).addClass("checked");
		if(val==1){
			$(this).parent().siblings(".input_box2").show();
		}else{
			$(this).parent().siblings(".input_box2").hide();
		}
    });
	
	$("#nextBtn").click(function(){
		var phoneNo = $("#phoneNo").val();
		var code=$("#code").val();  
		var referFlag = $("#referFlag").attr("class");
		var efferPhoneNo = $("#efferPhoneNo").val(); 
		var phoneNum = $("#phoneNo").val();
		if (!regexPhone.test(phoneNum)) {
			flag=false;
			showTipMsg("手机号格式不正确,请重新输入");
			return;
		}else if(phoneNum.length>11){
			flag=false;
			showTipMsg("手机号格式不正确,请重新输入");
			return;
		}
		
		
		if(code == null || code==""){
			showTipMsg("验证码必须填写");
			return;
		}
		if(efferPhoneNo==""&&referFlag=="checked"){
			showTipMsg("请填写推荐人");
			return;
		}
		if(referFlag=="checked"){
			if (!regexPhone.test($("#efferPhoneNo").val())) {
				flagEffer=false;
				showTipMsg("推荐人手机号格式不正确,请重新输入");
				return;
			}
			if($("#efferPhoneNo").val().length>11){
				flagEffer=false;
				showTipMsg("推荐人手机号格式不正确,请重新输入");
				return;
			}
			if(checkPhone($("#efferPhoneNo").val())){
				flagEffer=false;
				showTipMsg("推荐人不存在");
				return;
			}
			if(checkReffereePhone($("#efferPhoneNo").val())){
				flagEffer=false;
				showTipMsg("推荐人异常");
				return;
			}
		}else{
			showTipMsg("");
			flagEffer=true;
		}
		if(!flagEffer){
			return;
		}
		if(!flag){
			return;
		}
		var param = {};
		param["phoneNo"] = phoneNo;
		param["code"] = code;  

		
		if(val == 0){
			efferPhoneNo=null;
		}
		param["efferPhoneNo"] = efferPhoneNo;  
		param["hasEffer"] = val;    //0 无，1有
		$.ajax({
			type : "POST",
			cache : false,
			async : false,// 设置异步为false,重要！
			dataType : "json",
			url : $("#basePath").val() + "account/saveRegStep1",
			data : param,
			success : function(data) {
				if (data.result == 0 || data.result == '0') {
					window.location.href=$("#basePath").val()+"account/reg_step2.html?phoneNo="+data.msg;
				}else{
					showTipMsg(data.msg);
					switchCode();
				}
			}
		});
	});
	
	
	//手机验证
	$("#phoneNo").blur(function() {
		var phoneNum = $("#phoneNo").val();
		if (!regexPhone.test(phoneNum)) {
			flag=false;
			showTipMsg("手机号格式不正确,请重新输入");
		}else if(phoneNum.length>11){
			flag=false;
			showTipMsg("手机号格式不正确,请重新输入");
		}else{
			flag=true;
			showTipMsg("");
		}
	});
	
	
	
	$("#efferPhoneNo").blur(function() {
		if (!regexPhone.test($("#efferPhoneNo").val())) {
			flagEffer=false;
			showTipMsg("推荐人手机号格式不正确,请重新输入");
			return;
		}
		if($("#efferPhoneNo").val().length>11){
			flagEffer=false;
			showTipMsg("推荐人手机号格式不正确,请重新输入");
			return;
		}
		if(checkReffereePhone($("#efferPhoneNo").val())){
			flagEffer=false;
			showTipMsg("推荐人异常");
			return;
		}else{
			showTipMsg("");
			flagEffer=true;
		}
	});
	
	
});	


function checkPhone(phoneNo){
		var phoneflag = false;
		$.ajax({
			type : "POST",
			cache : false,
			async : false,// 设置异步为false,重要！
			dataType : "json",
			url : $("#basePath").val() + "front/checkphonenum",
			data : {"mobilePhone" : phoneNo},
			success : function(data) {
				if(data.state!=0){
				//	showTipMsg("手机号被使用，请重新输入");
					phoneflag = false;
					return false;
				}else{
				//	showTipMsg("");
					phoneflag = true;
					return true;
				}
			}

		});
		return phoneflag;
	}
	
	//校验推荐人的手机号码
	function checkReffereePhone(phoneNo){
		var phoneflag = false;
		$.ajax({
			type : "POST",
			cache : false,
			async : false,// 设置异步为false,重要！
			dataType : "json",
			url : $("#basePath").val() + "front/checkReffereePhone",
			data : {"refferee" : phoneNo},
			success : function(data) {
				if(data.state!=0){
				//	showTipMsg("手机号被使用，请重新输入");
					phoneflag = false;
					return false;
				}else{
				//	showTipMsg("");
					phoneflag = true;
					return true;
				}
			}
		});
		return phoneflag;
		
}


//刷新验证码
function switchCode() {
/* 
	$("#code").css({
		color : '#999'
	}); */
	var url = $('#basePath').val() + 'common/imageCode.html?pageId=register&t=' + Math.random();
	$('#codeNum').attr('src', url);
}


function showTipMsg(msg) {
	$("#error-box").show();
	$("#error-box").html(msg);
}

//写cookies
function setCookie(name,value)
{
    var hour = 24;
    var exp = new Date();
    exp.setTime(exp.getTime() + hour*60*60*1000);
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}

//读取cookies
function getCookie(name)
{
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
 
    if(arr=document.cookie.match(reg))
 
        return unescape(arr[2]);
    else
        return null;
} 