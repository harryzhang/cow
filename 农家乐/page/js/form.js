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
