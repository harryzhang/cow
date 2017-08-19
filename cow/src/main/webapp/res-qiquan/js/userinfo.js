$(function(){
	
	$("#name").focus();

	
	$("#nextBtn").click(function(){
		var name = $("#name").val();
		var winxinNo = $("#weixin").val(); 
		
		if(name == null || name==""){
			showTipMsg("真实姓名必须填写");
			return;
		}
		
		if(winxinNo == null || winxinNo==""){
			showTipMsg("微信账号必须填写");
			return;
		}
		
		var chkPwdMsg = pwdCheckout($("#password").val(),$("#password2").val());
		
		if(chkPwdMsg !=""){
			showTipMsg(chkPwdMsg);
			return;
		}
		
		var param = {};
		param["name"] = name;
		param["weixin"] = winxinNo;
		param["password"] = $("#password").val();
		
		$.ajax({
			type : "POST",
			cache : false,
			async : false,// 设置异步为false,重要！
			dataType : "json",
			url : $("#basePath").val() + "account/modifyUserinfo.html",
			data : param,
			success : function(data) {
				if (data.result == 0 || data.result == '0') {
					window.location.href=$("#basePath").val()+"login/main.html#account";
				}else{
					showTipMsg(data.msg);
				}
			}
		});
	});
});	

