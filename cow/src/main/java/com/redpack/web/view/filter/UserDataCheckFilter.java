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
        
        boolean isOKFlag = false; //是否放行通过标记
        
        //已登录不拦截
        UserDo  user = (UserDo)session.getAttribute(WebConstants.SESSION_USER);
        
      //get fromurl
    	StringBuilder severAddress = new StringBuilder();
		severAddress.append(req.getScheme()).append("://").append(req.getServerName());
		int port = req.getServerPort();
		if(80 != port){
			severAddress.append(":").append( req.getServerPort());
		}
    	String fromUrl=severAddress.toString()+uri;
    	String queryParams = req.getQueryString();
    	if(StringUtils.isNotBlank(queryParams)){
    		fromUrl = fromUrl+"?"+ queryParams;
    	}
    	
    	String requestType = req.getHeader("X-Requested-With"); 
    	if (requestType != null && requestType.equals("XMLHttpRequest")) {
	        JSONObject json = new JSONObject();  
	        json.put("resultCode", "-1");  
	        json.put("fromUrl", fromUrl);  
	        PrintWriter pw = response.getWriter();  
	        pw.print(json.toString());  
	        pw.close();  
    	}else{
    		StringBuilder loginUrl = new StringBuilder();
    		loginUrl.append(severAddress+"/login/index.html").append("?fromUrl=");
    		//加refer 地址， 从哪个页面过来的
    		loginUrl.append(URLEncoder.encode(fromUrl,"utf-8"));
        	resp.sendRedirect(loginUrl.toString());
    	}
    	
        
        if(isOKFlag){
        	chain.doFilter(request, response);
        }else{//提示登录
        	
        	
        }
    }


}