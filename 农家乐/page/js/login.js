var basePath = $("#basePath").val();
$(function() {
	basePath = $("#basePath").val();
	$("#emailphone").blur(function() {
		if ($(this).val() == "") {
			showTipMsg("请输入手机号！");
		}else{
			showTipMsg("");
		}
	});

	$("#password").blur(function() {
		if ($(this).val() == "") {
			showTipMsg("请输入登录密码！");
		}else{
			showTipMsg("");
		}
	});

	// 处理键盘的回车键登录
	$(document).keydown(function(event) {
		if (event.keyCode == 13) {
			login();
		}
	});

});

// 登录
function login() {
		if ($("#emailphone").val() == "" || $("#emailphone").val() == "手机号") {
			showTipMsg("请输入手机号！");
			$("#emailphone").focus();
			return;
		}
		if ($("#password").val() == "") {
			showTipMsg("请输入登录密码！");
			$("#password").focus();
			return;
		}
		var param = {};
		param["username"] = $("#emailphone").val();
		param["password"] = $("#password").val();
		$.ajax({
			type : "POST",
			cache : false,
			async : false,// 设置异步为false,重要！
			dataType : "json",
			url : basePath + "lnwxfront/sublogin",
			data : param,
			success : function(data) {
				if (data.state == 0 || data.state == '0') {
					//控制登录成功后跳回原页面
					//ajax方式
					var toHerf = ("reg_step1.jsp").indexOf($("#referer2").val());
					var toAjax = ("reg_step1.jsp").indexOf($("#referer").val());
                    if( toAjax>=0 &&null !=$("#referer").val()  && $("#referer").val()!="" && 'null'!=$("#referer").val()){
                    	window.location.href = $("#referer").val();
					//普通href
                    }else if( toHerf >=0 && null !=$("#referer2").val()  && $("#referer2").val()!="" && 'null'!=$("#referer2").val()){
                    	window.location.href = $("#referer2").val();
                    
                    }else if(null !=$("#referer").val()  && $("#referer").val()!="" && 'null'!=$("#referer").val()){
                    	window.location.href = $("#referer").val();
                    //默认首页	
                    }else{
//                    	  window.location.href = basePath+"lnweixin/mynewdata";
                    	window.location.href = basePath+"h5/page/index.jsp#list";//先跳转产品列表页面 
                    }
				} else{
					$('#btn_login').val('登录');
					showTipMsg(data.msg);
				}
			}
		});
}

function showTipMsg(msg) {
	$("#error-box").show();
	$("#error-box").html(msg);
}