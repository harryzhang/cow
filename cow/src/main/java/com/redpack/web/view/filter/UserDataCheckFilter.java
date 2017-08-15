package com.redpack.web.view.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Map;
import java.util.Properties;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import com.redpack.common.account.model.UserDo;
import com.redpack.common.base.constant.Constants;
import com.redpack.common.constant.WebConstants;


/**
 * 检查用户资料是否完善， 是否激活
 *
 */
public class UserDataCheckFilter  extends OncePerRequestFilter {
    
    Logger logger = Logger.getLogger(this.getClass());
    
	@Override
	protected void initFilterBean() throws ServletException {
		super.initFilterBean();
		//WebApplicationContext spring = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		//sysconfigProperties = (Properties)spring.getBean("sysconfig");
	}

   
     
    /**
     * 销毁方法
     */
     public void destroy() {
    	 super.destroy();
     	//sysconfigProperties = null;
     }

	 
	
    /**
     * 统计出不需要登录的页面,其他页面判断是否有会话<br>
     * 否则重定向到登录页面
     * 
     */
	@Override
	protected void doFilterInternal(HttpServletRequest request,
			HttpServletResponse response, FilterChain chain)
			throws ServletException, IOException {
    	
        HttpServletRequest req = (HttpServletRequest)request;
        HttpServletResponse resp = (HttpServletResponse) response;        
        HttpSession session = req.getSession();
        String contextPath = session.getServletContext().getContextPath();
        
        
        //未激活，跳转去激活页面
        UserDo  user = (UserDo)session.getAttribute(WebConstants.SESSION_USER);
        if(user != null){
        	if(user.getStatus().intValue() == 2){
            	String toUrl = getActiveUrl(req,user.getUserName(),user.getMail());
            	resp.sendRedirect(toUrl.toString());
            	return;
            }
            
            //未完善资料，去完善资料
            if(StringUtils.isBlank(user.getName()) || StringUtils.isBlank(user.getTwoLevelPwd())){
            	String toUrl = getFinishDataUrl(req);
            	resp.sendRedirect(toUrl.toString());
            	return;
            }
        }
    	chain.doFilter(request, response);
    }
	
	/**
	 * 
	 * 本应用的地址
	 *
	 */
	private String getServerAddress(HttpServletRequest req){
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
	private String getActiveUrl(HttpServletRequest req,String userName,String mail){
		 StringBuilder toUrl = new StringBuilder();
		 String serverAddress = this.getServerAddress(req);
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
	private String getFinishDataUrl(HttpServletRequest req){
		StringBuilder toUrl = new StringBuilder();
		String serverAddress = this.getServerAddress(req);
		toUrl.append(serverAddress).append("/account/reg_step2.html");
		return toUrl.toString();
	}


}