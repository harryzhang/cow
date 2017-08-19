
/*
 * 
 * 账号格式检查
 * 
 */

function checkAccountFormat(accountNo) {
	var regexPhone=/^[A-Za-z0-9_]{6,11}$/;
	if (!regexPhone.test(accountNo)) {
		return "账号格式不正确,请重新输入";
		
	}else if(accountNo.length>11||accountNo.length<6){
		return "账号格长度正确,请重新输入";
	}
	return "";
	
}

/**
 * 账号是否存在
 */
function checkPhone(phoneNo){
	var result = false;
	$.ajax({
		type : "POST",
		cache : false,
		async : false,// 设置异步为false,重要！
		dataType : "json",
		url : $("#basePath").val() + "account/checkAccount.html",
		data : {"username" : phoneNo},
		success : function(data) {
			if(data.result ==0){
				result = true;
			}
		}
	});
	return result;
}
	


/**
 * 密码检查
 */
function pwdCheckout(password,password2){
	
	if(password != password2){
		return "密码和确认密码不一致" ;
	}
	
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
	
	
	return "";
}


/**
 * 邮箱检查
 */
function checkMailFormat(mailtxt,actionType,username){
	var regMail = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	if (!regMail.test(mailtxt)) {
		flag=false;
		return "邮箱格式不正确,请重新输入";
	}
	return "";
}


/**
 * 邮箱检查
 * actionType: reg, forgetpassword
 */
function checkMailAccount(mailtxt,actionType,username){
	var msg = "";
	var param = {};
	param["mailtxt"] =  mailtxt;
	param["phoneNo"] =  username;
	param["action"] =  actionType;
	$.ajax({
		type : "POST",
		cache : false,
		async : false,// 设置异步为false,重要！
		dataType : "json",
		url : $("#basePath").val() + "account/checkMail.html",
		data : param,
		success : function(data) {
			if(data.result != 0){
				msg = data.msg;
			}
		}
	});
	return msg;
}
