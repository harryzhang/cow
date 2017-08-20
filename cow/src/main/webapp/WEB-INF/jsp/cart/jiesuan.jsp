<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html style="font-size: 60px;"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>乐农之家</title>

<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
<meta http-equiv="expires" content="0">

<link rel="shortcut icon" href="/res-qiquan/images/logo.ico">
<meta content="telephone=no" name="format-detection">

<script type="text/jscript" src="<c:url value='/res-qiquan/js/jquery-1.8.3.js'/>"></script>
<script type="text/jscript" src="<c:url value='/res-qiquan/js/product_detail2.js'/>"></script>
<script type="text/jscript" src="<c:url value='/res-qiquan/js/formValidatorRegex.js'/>"></script>
<link type="text/css" href="<c:url value='/res-qiquan/css/orderToPay.css'/>" rel="stylesheet"/>
<script type="text/jscript" src="<c:url value='/res-qiquan/js/download_base.js'/>"></script>
<meta name="viewport" content="width=640, user-scalable=no">

</head>
    <body>
        <div class="wrap" style="height: 758px;">
            <div class="content">
                <div class="center">
                	<input type="hidden" value="<c:url value='/'/>" id="basePath">
                	<input type="hidden" value="15006003486783" id="bid">
                	<input type="hidden" value="2" id="borrowWay">
                	<input type="hidden" value="5000.00" id="amount">
                	<input type="hidden" value="1" id="num">
                	<input type="hidden" value="170722180335887480" id="ordId">
                	<input type="hidden" value="0" id="redId">
                	<input type="hidden" value="0" id="fare">
                	<input type="hidden" value="0" id="smsType">
                	<input type="hidden" value="" id="address">
                	<input type="hidden" value="0" id="isAuth">
                    <div class="column">
                       <p>订单号：170722180335887480</p> 
                       <p>总计金额<span>5000.00</span>元</p>
                    </div>
                    <div class="zfs">支付方式</div>
                </div>
                <div class="guild">
                    <div class="center">
                        <div class="menu clear">
                            <i class="d_true" flag="1"></i>
                            <img src="<c:url value='/res-qiquan/images/zf.png'/>" height="41" width="48" alt="">
                            <p>
                                <em>余额支付</em>
                                <span>账户余额：<strong>0.0</strong>元</span>
                            </p>
                        </div><!-- menu end -->
                        <div class="menu clear">
                            <i flag="2"></i>
                            <img src="<c:url value='/res-qiquan/images/zf.png'/>" height="41" width="48" alt="">
                            <p>
                                <em>快捷支付</em>
                                <span>支付各大银行卡，限额由发卡行限定</span>
                            </p>
                        </div><!-- menu end -->
                    </div>
                </div>
                <div class="side">
                    <div class="center">
                        <p>请填写银行卡预留信息</p>
                        <p class="text">*温馨提示：后续银行卡操作只能在绑定的银行卡上操作</p>
                        <div class="bank clear">
                            <em>银行卡</em>
                            <input type="hidden" value="" id="bankCardId">
                            <input type="hidden" value="" id="bankCode">
                            <input type="hidden" value="" id="bankName">
                            <div class="bank_card"><span></span></div>
                        </div>
                    </div>
                </div>
                
                <!-- 提示 -->
		        <div class="mee2 hide"></div>
				<!-- 验证码 -->
		        <div class="sideTip hide">
		            <p class="yz">输入验证码</p>
		            <p><input class="validation" type="text" id="rechargeCode" placeholder="请输入6位短信验证码"><a class="h_btn" href="javascript:" id="reSendCode">获取验证码</a></p>
		            <i id="validateMsg"></i>
		            <div class="button">
		            	<input type="hidden" id="requestNo" value="">
		                <a href="javascript:" class="qx">取 消</a>
		                <a href="javascript:" class="bt_s" id="confirmCode">确 定</a>
		            </div>
		        </div>
                
                <div class="bt">
                    <a href="javascript:" class="btn">支付</a>
                </div>
            </div>
        </div>     
    <script>
             var docEl = document.documentElement;        
                function getSize() {// 获取屏幕的宽度
                    var screenWidth = docEl.clientWidth; 
                    docEl.style.fontSize =  screenWidth / (640/60)  + 'px';
                }
                getSize();// 页面加载完执行一次
                window.onresize = function() {
                    getSize();
            	}   
            $(function(){
                var timer2 = 120;
                var tipId2;
            	var basePath = $("#basePath").val();
                $(".menu i").click(function(){
                    $(this).addClass('d_true').parent().siblings('.menu').find("i").removeClass('d_true');
                    var fn = $(".menu").eq(1).find("i");
                    var flag = $(this).attr('flag');
                    var isAuth = $("#isAuth").val()
                    if(flag==2&& isAuth ==0){
                    	window.location.href = 'https://lnweixin/getSecUserBankList';
                    	return;
                    }
                    if(fn.hasClass('d_true')){
                        $(".side").show();
                    }else{
                        $(".side").hide();
                    }
                })
                 $(".ment i").toggle(function(){
                    $(this).addClass("radio_yes");
                },function(){
                	$(this).removeClass("radio_yes");
                })
                
                $(".btn").click(function(){
                	var _index = null;
                    
                    $(".menu i").each(function(index){
            			if($(".menu i").eq(index).hasClass("d_true")){
            				_index = $(".menu i").eq(index).attr("flag");
            			}
            		});
                    
                    var bid = $("#bid").val();
                    var amount = $("#amount").val();
                    var num = $("#num").val();
                    var borrowWay = $("#borrowWay").val();
                    var ordId = $("#ordId").val();
                    var redId = $("#redId").val();
                    var smsType = $("#smsType").val();
                    if(_index==1){//从账户扣款
                    	sub_account_invest(bid,amount,num,borrowWay,redId,smsType,ordId);
                    	return;
                    }
    				if(_index==2){//从银行卡扣款
    					$(".mee2,.sideTip").show();
    					sub_bank_invest(bid,amount,num,borrowWay,redId,smsType,ordId);
                    }
                })
                
                $(".qx").click(function(){
                	$("#reSendCode").html("获取验证码");
                	 window.clearInterval(tipId2);
                	 timer2 = 120;
                    $(".mee2,.sideTip").hide();
                	$("#validateMsg").html("");
                })
                
                
                 function rtimer2() {
					if (timer2 >= 0) {
						$("#reSendCode").html(timer2 + "秒后获取");
						timer2--;
					} else {
						window.clearInterval(tipId2);
						$("#reSendCode").html("重新发送");
						timer2 = 30;
						codeValid = false;
					}
				}
                
                function sub_account_invest(bid,amount,num,borrowWay,redId,smsType,ordId){
                	var param = {};
                	param['bid']=bid;
                	param['amount']=amount;
                	param['num']=num;
                	param['bidSec']= "";
                	param['borrowWay']= borrowWay;
                	param['redId']= redId;
                	param['smsType']= smsType;//是否发送短信
                	param['fare']= $("#fare").val();
                	param['address']= $("#address").val();
                	param['ordId']= ordId;

                	location.href= "<c:url value='/order/submitOrder.html'/>";
                	/*
                	$.ajax({
            			type:"POST",
            			cache : false,
            			async : false,// 设置同步执行！
            			url:"<c:url value='/order/submitOrder.html'/>",
            			data:param,
            			dataType:"json",
            			success:function(data){
            				if(data.msg==3){
        						location.href=$("#basePath").val()+"login/index.html";
        					}else if(data.msg == 0){//投资成功
        						location.href=$("#basePath").val()+"order/success.html";
        					}else{
        						location.href=$("#basePath").val()+"order/success.html";
        					}
            			},
            		});
            		*/
                }
                
                function sub_bank_invest(bid,amount,num,borrowWay,redId,smsType,ordId){
                	
                	var params = {};
                	params['borrowId'] = bid;
                	params['amount'] = amount;
                	params['redId'] = redId;
                	params['channel'] = 2;
                	location.href= "<c:url value='/order/submitOrder.html'/>";
                	/*
                	$.ajax({
                		type : "POST",
                		cache : false,
                		async : false,
                		dataType : "json",
                		url :"<c:url value='/order/submitOrder.html'/>",
                		data :params,
                		success : function(data) {
                			//tipId2 = window.setInterval(rtimer2, 1000);
                			$("#requestNo").val(data.msg);
                		}
                	});
                	*/
                }
                
                $("#confirmCode").click(function(){
                	var params = {};
                	var validateCode = $("#rechargeCode").val();
                	if(validateCode==""){
                		$("#validateMsg").html("请输入验证码");
                		return;
                	}
                	params['requestNo'] = $("#requestNo").val();
                	params['validateCode'] = $("#rechargeCode").val();
                	params['channel'] = '2';
                	$.ajax({
                		type : "POST",
                		cache : false,
                		async : false,
                		dataType : "json",
                		url : $("#basePath").val()+"lnwxfront/ybOrders",
                		data :params,
                		success : function(data) {
                			if(data.responseCode=="0000"){
                				$("#validateMsg").html("");
                				location.href=$("#basePath").val()+"login/main.html#account";
                			}else{
                				$("#validateMsg").html(data.message);
                			}
                		}
                	})
                 });
            })
        </script>
    
</body></html>