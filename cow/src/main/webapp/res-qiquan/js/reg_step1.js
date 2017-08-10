var flag = true;
var flagEffer = true;
//var regexPhone =/^13[0-9]{9}|15[0123456789][0-9]{8}|17[0123456789][0-9]{8}|18[0123456789][0-9]{8}|147[0-9]{8}$/;
var regexPhone=/^[A-Za-z0-9_]{6,11}$/;
var val=0;

$(function(){
	if($("#usrChannel").val()!=null && $("#usrChannel").val()!=''&&$("#usrChannel").val()!='null'){
		setCookie("usrChannel",$("#usrChannel").val());
	}
	switchCode();
	
	
	$("#phoneNo").focus();

	
	$("#nextBtn").click(function(){
		var phoneNo = $("#phoneNo").val();
		var code=$("#code").val();  
		//var referFlag = $("#referFlag").attr("class");
		var efferPhoneNo = $("#efferPhoneNo").val(); 
		var phoneNum = $("#phoneNo").val();
		if (!regexPhone.test(phoneNum)) {
			flag=false;
			showTipMsg("登录账号不正确,请重新输入");
			return;
		}else if(phoneNum.length>11 || phoneNum.length<6 ){
			flag=false;
			showTipMsg("登录账号长度为6-11位");
			return;
		}
		
		if(code == null || code==""){
			showTipMsg("验证码必须填写");
			return;
		}
		if(efferPhoneNo==""){
			showTipMsg("请填写推荐人账号");
			return;
		}

		if(checkPhone(phoneNum)){
			showTipMsg("账号已注册");
			return;
		}
		
		if(checkPhone($("#efferPhoneNo").val())){
			showTipMsg("推荐人不存在");
			return;
		}
		
		var chkPwdMsg = pwdCheckout();
		
		if(chkPwdMsg !=""){
			showTipMsg(chkPwdMsg);
			return;
		}
		
		if(!flag){
			return;
		}
		
		var param = {};
		param["username"] = phoneNo;
		param["code"] = code;  
		param["refferee"] = efferPhoneNo;
		param["password"] = $("#password").val();
		
		//param["hasEffer"] = val;    //0 无，1有
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
			showTipMsg("账号格式不正确,请重新输入");
		}else if(phoneNum.length>11||phoneNum.length<6){
			flag=false;
			showTipMsg("账号格长度正确,请重新输入");
		}else{
			flag=true;
			showTipMsg("");
		}
	});
	
	
	
	$("#efferPhoneNo").blur(function() {
		if (!regexPhone.test($("#efferPhoneNo").val())) {
			flag=false;
			showTipMsg("推荐人账号格式不正确,请重新输入");
			return;
		}
		if($("#efferPhoneNo").val().length>11||$("#efferPhoneNo").val().length<6){
			flag=false;
			showTipMsg("推荐人账号长度不正确,请重新输入");
			return;
		}
		if(checkPhone($("#efferPhoneNo").val())){
			flag=false;
			showTipMsg("推荐人不存在");
			return;
		}else{
			showTipMsg("");
			flag=true;
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
			url : $("#basePath").val() + "account/checkAccount.html",
			data : {"username" : phoneNo},
			success : function(data) {
				if(data.result!=0){
					phoneflag = false;
					return false;
				}else{
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

function pwdCheckout(){
	
	var password = $("#password").val();
	
	var lowercase = /[a-z]{1,}/;
	var capital = /[A-Z]{1,}/;
	var num = /[0-9]{1,}/;
	
	if(password.length <6){
		console.log("密码至少要有6位数");
		return "密码至少要有6位数";
	}
	
	if(!lowercase.test(password) || !capital.test(password) || !num.test(password)){
		console.log("密码必须同时包含大小写字母及数字");
		return "密码必须同时包含大小写字母及数字" ;
	}
	var password2 = $("#password").val();
	if(password != password2){
		return "密码和确认密码不一致" ;
	}
	return "";
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
