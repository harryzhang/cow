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
				location.href=$("#basePath").val()+'login/login.html';
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
		

		

	
	

