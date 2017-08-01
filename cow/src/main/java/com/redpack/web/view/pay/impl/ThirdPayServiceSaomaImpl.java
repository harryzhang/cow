package com.redpack.web.view.pay.impl;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.springframework.stereotype.Service;

import com.redpack.utils.SwiftpassConfig;
import com.redpack.web.view.pay.controller.PayUtil;
import com.redpack.web.view.pay.service.IThirdPayService;
import com.redpack.web.view.pay.service.PayResult;

/**
 * 第三方支付扫描支付实现
 * 
 * @author harry
 * 
 */
@Service("saomaPayService")
public class ThirdPayServiceSaomaImpl implements IThirdPayService {

	@Override
	public PayResult doPay(Map<String, String> payPara) {

		PayResult pr = new PayResult();
		pr.setPayReturnVal(PayResult.error);
		try {
			
			String body = payPara.get("goodsName");
			String openId = payPara.get("openId");
			String orderNo = payPara.get("out_trade_no");
			String payAmount = payPara.get("payAmount");
			Map<String,String> payResultMap = PayUtil.getSaomaPayInfo(payAmount, orderNo, body, openId);
			if("ok".equals(payResultMap.get("res"))){
				if("0".equals(payResultMap.get("status")) && "0".equals(payResultMap.get("result_code"))){
                    String code_img_url = payResultMap.get("code_img_url");
                    pr.setPayReturnVal(code_img_url);
				}
			}
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return pr;
	}

}
