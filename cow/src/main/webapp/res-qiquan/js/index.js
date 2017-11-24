function funcAccount(){
	//这里加载数据
	$.ajax({
		type : "POST",
		cache : false,
		async : false,// 设置异步为false,重要！
		dataType : "json",
		url : $("#basePath").val() + 'member/getUserIncome.html',
		success : function(data) {
			
			if(data.sessionUser=="1"){
				location.href=$("#basePath").val()+'login/login.html';
				return;
			}
			if(data.invest){
				$("#balance").html(data.invest+'元');
			}
			if(data.rmb){
				$("#stillMoney").html(data.rmb+'元');
			}
			if(data.reffer){
				$("#stayBackMoney").html(data.reffer+'元');
			}
		}	
	});	
};
		

		

	
	

