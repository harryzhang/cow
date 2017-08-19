var flag = true;

$(function(){
	if($("#usrChannel").val()!=null && $("#usrChannel").val()!=''&&$("#usrChannel").val()!='null'){
		setCookie("usrChannel",$("#usrChannel").val());
	}
	
	$("#phoneNo").focus();
	
	$("#nextBtn").click(function(){
		var phoneNo = $("#phoneNo").val();
		var code=$("#code").val();  
		var efferPhoneNo = $("#efferPhoneNo").val(); 
		var phoneNum = $("#phoneNo").val();
		var accMsg = checkAccountFormat(phoneNum);
		if (accMsg != "") {
			showTipMsg(accMsg);
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
		
		if(!checkPhone($("#efferPhoneNo").val())){
			showTipMsg("推荐人不存在");
			return;
		}
		
		var chkPwdMsg = pwdCheckout($("#password").val(),$("#password2").val());
		
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
		$.ajax({
			type : "POST",
			cache : false,
			async : false,// 设置异步为false,重要！
			dataType : "json",
			url : $("#basePath").val() + "account/saveRegStep1.html",
			data : param,
			success : function(data) {
				if (data.result == 0 || data.result == '0') {
					window.location.href=$("#basePath").val()+"account/reg_step2.html?phoneNo="+data.msg;
				}else{
					showTipMsg(data.msg);
					switchCode('register');
				}
			}
		});
	});
	
	
	//手机验证
	$("#phoneNo").blur(function() {
		var phoneNum = $("#phoneNo").val();
		var accMsg = checkAccountFormat(phoneNum);
		if (accMsg != "") {
			flag=false;
			showTipMsg(accMsg);
			return;
		}
		
		showTipMsg("");
		flag=true;
		
	});
	
	
	
	$("#efferPhoneNo").blur(function() {
		var accMsg = checkAccountFormat($("#efferPhoneNo").val());
		if (accMsg != "") {
			flag=false;
			showTipMsg(accMsg);
			return;
		}
		
		if(!checkPhone($("#efferPhoneNo").val())){
			flag=false;
			showTipMsg("推荐人不存在");
			return;
		}
		
		showTipMsg("");
		flag=true;
		
	});
	
	
});	


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
