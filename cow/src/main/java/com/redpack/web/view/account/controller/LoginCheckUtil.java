package com.redpack.web.view.account.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.redpack.common.account.model.UserDo;


/**
 * 检查用户资料是否完善， 是否激活
 *
 */
public class LoginCheckUtil  {
    
    Logger logger = Logger.getLogger(this.getClass());
	
	 /**
     * 登录后页面
     * 
     */
	public static String getUrlAfterLogin(HttpServletRequest req,UserDo  user ){
	
        //未激活，跳转去激活页面
    	if(user.getStatus().intValue() == 2){
        	return getActiveUrl(req,user.getUserName(),user.getMail());
        }
        
        //未完善资料，去完善资料
        if(StringUtils.isBlank(user.getName()) || StringUtils.isBlank(user.getTwoLevelPwd())){
        	return getFinishDataUrl(req);
        }
        
		return getLoginSuccUrl(req);
    }
    
	
	/**
	 * 
	 * 本应用的地址
	 *
	 */
	private static String getServerAddress(HttpServletRequest req){
		StringBuilder severAddress = new StringBuilder();
		severAddress.append(req.getScheme()).append("://").append(req.getServerName());
		int port = req.getServerPort();
		if(80 != port){
			severAddress.append(":").append( req.getServerPort());
		}
		return severAddress.toString();
	}
	
	/**
	 * 
	 * 发邮件激活地址
	 *
	 */
	public static String getActiveUrl(HttpServletRequest req,String userName,String mail){
		 StringBuilder toUrl = new StringBuilder();
		 String serverAddress = getServerAddress(req);
	     toUrl.append(serverAddress).append("/account/reg_step2.html?phoneNo=").append(userName);
	     if(StringUtils.isNotBlank(mail)){
	    	 toUrl.append("&mail=").append(mail);
	     }
	     return toUrl.toString();
	}
	
	/**
	 * 
	 * 完善资料地址
	 *
	 */
	public static String getFinishDataUrl(HttpServletRequest req){
		StringBuilder toUrl = new StringBuilder();
		String serverAddress = getServerAddress(req);
		toUrl.append(serverAddress).append("/account/modifyInfo.html");
		return toUrl.toString();
	}
	
	/**
	 * 
	 * 登录成功主页
	 *
	 */
	public static String getLoginSuccUrl(HttpServletRequest req){
		StringBuilder toUrl = new StringBuilder();
		String serverAddress = getServerAddress(req);
		toUrl.append(serverAddress).append("/login/main.html");
		return toUrl.toString();
	}


}