/**   
* @Title: ValidCodeUtil.java 
* @Package com.redpack.web.view.base.controller 
* @Description: TODO(用一句话描述该文件做什么) 
* @author zhangyunhmf
* @date 2017年8月14日 上午9:42:36 
* @version V1.0   
*/
package com.redpack.web.view.base.controller;

import java.awt.Color;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

/** 
 * @ClassName: ValidCodeUtil 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 * @author zhangyunhmf
 * @date 2017年8月14日 上午9:42:36 
 *  
 */
public class ValidCodeUtil {
	
	/**
	 * 将验证码存入页面KEY值的SESSION里面
	 * 
	 *
	 */
	public  static String putValidcode(HttpServletRequest request){
		StringBuilder sRand = new StringBuilder();
		// 生成随机类
		Random random = new Random();
		for (int i = 0; i < 4; i++) {
			String rand = String.valueOf(random.nextInt(10));
			sRand.append(rand);
		}
		String pageId = request.getParameter("pageId");
		String key = pageId + "_checkCode";
		String result = sRand.toString();
		request.getSession().setAttribute(key, result);
		return result;
	}
	
	/**
	 *  验证码是否正确
	 * 
	 *
	 */
	public static boolean checkValidcode(HttpServletRequest request){
		String pageId = request.getParameter("pageId");
		String code = request.getParameter("code");
		if(StringUtils.isBlank(pageId)){
			return false;
		}
		if(StringUtils.isBlank(code)){
			return false;
		}
		
		String sessionCode = (String) request.getSession().getAttribute(pageId + "_checkCode");
		if (code.equals(sessionCode)) {
			return true;
		}
		return false;
	}
	

}
