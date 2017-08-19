// JavaScript Document
$(function(){

	$(".form_input").focus(function() {
		$(this).siblings(".placeholder").hide();
    }).blur(function() {
        var val = $.trim($(this).val());
		if(val==null || val == ""){
			$(this).siblings(".placeholder").show();
		}
    }).each(function(){
    	var val = $.trim($(this).val());
		if(val!=null && val != ""){
			$(this).siblings(".placeholder").hide();
		}
    });
	$(".placeholder").live("click",function(){
		$(this).siblings(".form_input").focus();
	});
	
});


function showTipMsg(msg) {
	$("#error-box").show();
	$("#error-box").html(msg);
}

//刷新验证码
function switchCode(pageId) {
/* 
	$("#code").css({
		color : '#999'
	}); */
	var url = $('#basePath').val() + 'common/imageCode.html?pageId='+pageId+'&t=' + Math.random();
	$('#codeNum').attr('src', url);
}

