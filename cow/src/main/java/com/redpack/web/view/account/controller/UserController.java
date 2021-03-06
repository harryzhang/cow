
/**  
 * @Project: deposit-web
 * @Package com.hehenian.deposit.web.view.account.controller
 * @Title: UserController.java
 * @Description: TODO
 * @author:  zhangyunhua
 * @date 2015年3月5日 上午11:01:51
 * @Copyright: HEHENIAN Co.,Ltd. All rights reserved.
 * @version V1.0  
 */
package com.redpack.web.view.account.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.redpack.common.account.IUserInfoService;
import com.redpack.common.account.IUserService;
import com.redpack.common.account.model.ApplyAgentDo;
import com.redpack.common.account.model.UserDo;
import com.redpack.common.account.model.UserInfoDo;
import com.redpack.common.base.param.IParamService;
import com.redpack.common.base.result.IResult;
import com.redpack.common.constant.WebConstants;
import com.redpack.common.sms.ISmsService;
import com.redpack.service.mail.INotifyComponent;
import com.redpack.service.mail.NotifyDo;
import com.redpack.utils.ResponseUtils;
import com.redpack.web.view.base.controller.BaseController;
import com.redpack.web.view.base.controller.TokenUtil;
import com.redpack.web.view.base.controller.ValidCodeUtil;

/**
 * 
 * @author: zhangyunhua
 * @date 2015年3月5日 上午11:01:51
 */
@Controller
@RequestMapping("/account")
public class UserController extends BaseController{
	private static final Logger logger = Logger.getLogger(UserController.class);
	@Autowired
	private IUserService userService;
	@Autowired
	private IUserInfoService userInfoService;
	@Autowired
	private ISmsService smsService;

	@Autowired
	private INotifyComponent mailService;
	
	@Autowired	
    private IParamService  paramService;

	/**********************************start 忘记密码************************************************/

	/**
	 * 忘记密码第一步
	 * 
	 * @return
	 * @author: huangzl
	 * @date 2015年8月2日 22:45:08
	 */
	@RequestMapping("forgetPwd1")
	public String forgetPwd1(String pwdFlag,Model model,HttpServletRequest request) {
		logger.info("----重置密码跳转页面----");
		return "user/forgetPwd1";
	}
	
	
	/**
	 * 忘记密码第二步
	 * 
	 * @return
	 * @author: huangzl
	 * @date 2015年8月2日 22:45:08
	 */
	@RequestMapping("saveForgetPwd1")
	public void saveForgetPwd1(String pwdFlag,Model model,HttpServletRequest request,HttpServletResponse response) {
		JSONObject jsonObject = new JSONObject();
		
		String phoneNo = request.getParameter("username");
		try{
			if(ValidCodeUtil.checkValidcode(request)){
				jsonObject.put("msg","无效的验证码");
				return;
			}
			
			String mail = request.getParameter("mail");
			
			sendActMail(request, mail, phoneNo,"forgetpassword","找回密码");
			
			jsonObject.put("result", 0);
		
		}catch(Exception e){
			jsonObject.put("msg", e.getMessage());
		}finally{
			ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
		}
	}
	
	

	/**
	 * 修改密码
	 * @param model
	 * @return
	 */
	@RequestMapping("confirmPassword")
	public void confirmPassword(HttpServletRequest request,HttpServletResponse response,Model model) {
		
		logger.info("----修改密码----");
		JSONObject jsonObject = new JSONObject();
		
		try{
			if(TokenUtil.checkToken(request, "forgetpassword")==false){
				jsonObject.put("msg","无效的token");
				return;
			}
			
			UserDo user = (UserDo) request.getSession().getAttribute(WebConstants.SESSION_USER);
			user=userService.getById(user.getId());
			if(user == null){
				jsonObject.put("msg", "账号有误或者会话信息超时"); //账号有误或者会话信息超时
				return;
			}
			
			String newPassword = request.getParameter("password");
			if(StringUtils.isBlank(newPassword)){
				jsonObject.put("msg", "密码不能为空"); 
				return;
			}
			
			String newPass =DigestUtils.md5Hex(newPassword + WebConstants.PASS_KEY);
			UserDo tempSave =new UserDo();
			tempSave.setId(user.getId());
			tempSave.setPassword(newPass);
			
			userService.updateUser(tempSave);//修改登录密码
			jsonObject.put("result", 0);
			
		}catch(Exception e){
			jsonObject.put("msg", e.getMessage());
		}finally{
			String newToken = TokenUtil.putToken(request, "forgetpassword");
			jsonObject.put("token", newToken);
			ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
		}
		
		
	}
	/**********************************end 忘记密码************************************************/
	

	
	
	/********************************** start 登录后修改密码************************************************/
	
	/**
	 * 重置密码跳转页面
	 * 
	 * @return
	 * @author: huangzl
	 * @date 2015年8月2日 22:45:08
	 */
	@RequestMapping("modifyPassword")
	public String modifyPassword(HttpServletRequest request,Model model) {
		logger.info("----修改密码跳转页面----");
		String pwdType = request.getParameter("pwdType");
		if(StringUtils.isBlank(pwdType)){
			pwdType="loginPwd";
		}
		model.addAttribute("pwdType", pwdType);
		return "user/modifyPassword";
	}

	
    /**
     * @Description 登录后修改， 输入二级密码才可以修改
     * @File UserController.java
     * @param request
     * @param response
     * @param session
    */
    @RequestMapping(value = "updatePwd")
    public void updatePwd(HttpServletRequest request,HttpServletResponse response, HttpSession session){
    	logger.info("---- 登录后修改----");
     	
    	JSONObject jsonObject = new JSONObject();
    	String password = request.getParameter("password");
    	String twoPassword = request.getParameter("twoPassword");
    	
		try{
			
			if(StringUtils.isBlank(password)){
				 jsonObject.put("msg", "新密码不能为空");
				 return;
			}
			
			if(password.length()<6 || password.length()>20){
				 jsonObject.put("msg", "新密码长度不够");
				 return;
			 }
			
			if(StringUtils.isBlank(twoPassword)){
				 jsonObject.put("msg", "二级密码不能为空");
				 return;
			}
			
			//userId
			UserDo user = (UserDo) session.getAttribute(WebConstants.SESSION_USER);
			if(user == null){
				jsonObject.put("msg", "账号有误或者会话超时重新登录"); //账号有误或者会话信息超时
				ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
				return;
			}
			
			
			UserDo oldUser = userService.getById(user.getId());
			String twoPwd =DigestUtils.md5Hex(twoPassword + WebConstants.PASS_KEY);
			if(!oldUser.getTwoLevelPwd().equals(twoPwd)){
				jsonObject.put("msg", "二级密码不对,修改失败");
				 return;
			}
			
			UserDo tempSave =new UserDo();
			tempSave.setId(user.getId());
			String newPass =DigestUtils.md5Hex(password + WebConstants.PASS_KEY);
			String  pwdType = request.getParameter("pwdType");
			if("twoPwd".equals(pwdType)){
				tempSave.setTwoLevelPwd(newPass);//修改二级密码
			}else{
				tempSave.setPassword(newPass);
			}

			userService.updateUser(tempSave);//修改密码
			jsonObject.put("result",0);
			
			
		}catch (Exception e) {
			logger.error(e.getMessage());
		}finally{
			ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
		}
    }
    
    /********************************** end 登录后修改密码************************************************/

  
   
    /**********************************start 注册***************************************/
    /**
	 * 注册用户跳转页面
	 * 
	 * @return
	 */
	@RequestMapping("reg_step1")
	public String reg_step1(HttpServletRequest request,Model model) {
		
		
		String view = getLocalPath(request,"user/reg_step1");
		
		//推荐人电话号码
		String refMobile = request.getParameter("mobile");
		
		
		//推荐人手机
		model.addAttribute("refMobile",refMobile);
		
		logger.info("----注册用户跳转页面----");
		
		return view;
	}
    
	 /**
	 * 注册用户跳转页面
	 * 
	 * @return
	 */
	@RequestMapping("saveRegStep1")
	public void saveRegStep1(HttpServletRequest request,
			                 HttpServletResponse response,
			                 Model model) {
		

			JSONObject jsonObject = new JSONObject();
			String mobilePhone = request.getParameter("username");
			String pwd =  request.getParameter("password");
			String referenceId =  request.getParameter("refferee");
			
			if(ValidCodeUtil.checkValidcode(request)){
				jsonObject.put("result", "1");
				jsonObject.put("msg", "验证码不正确");
				ResponseUtils.renderText(response, "UTF-8", JSONObject.fromObject(jsonObject).toString());
				return;
			}
			

			if (StringUtils.isBlank(mobilePhone)) {
				jsonObject.put("result", "1");
				jsonObject.put("msg", "请输入账号");
				ResponseUtils.renderText(response, "UTF-8", JSONObject.fromObject(jsonObject).toString());
				return;
			}
			
			if (StringUtils.isBlank(referenceId)) {
				jsonObject.put("result", "1");
				jsonObject.put("msg", "请输入推荐人账号");
				ResponseUtils.renderText(response, "UTF-8", JSONObject.fromObject(jsonObject).toString());
				return;
			}
			
			
			Map<String, Object> parameterMap = new HashMap<String, Object>();
			parameterMap.put("userName", mobilePhone);
			// 获取登录用户userId
			UserDo temp = userService.getByUserDo(parameterMap);

			if(temp!=null&&temp.getId()!=null){
				jsonObject.put("result", "1");
				jsonObject.put("msg", "输入的账号已存在");
				ResponseUtils.renderText(response, "UTF-8", JSONObject.fromObject(jsonObject).toString());
				return;
			}

			//根据推荐人的手机号码查找推荐人
			parameterMap.clear();
			parameterMap.put("userName", referenceId);
			parameterMap.put("status", "1");
			UserDo refUser = userService.getByUserDo(parameterMap);
			if(refUser == null){
				jsonObject.put("result", "1");
				jsonObject.put("msg", "查找不到对应的推荐用户或者推荐用户为非正式会员");
				ResponseUtils.renderText(response, "UTF-8", JSONObject.fromObject(jsonObject).toString());
				return;
			}
			
			String pwdMd5 =DigestUtils.md5Hex(pwd + WebConstants.PASS_KEY);
			UserDo userDo =new UserDo();
			userDo.setCreateUser(-1L);                 //当前用户是记录创建者
			userDo.setUserName(mobilePhone);
			userDo.setPassword(pwdMd5);
			userDo.setTwoLevelPwd(pwdMd5);
			userDo.setGrade(0);								//当前等级
			userDo.setOrgan("0");								//组织机构
			userDo.setEnabled("0");								//状态  默认激活
		
			userDo.setReferrerId(refUser.getId());				//推荐人ID
			userDo.setParentId(0l);	
			userDo.setStatus(2);//    未激活
			userDo.setTreeNode("");								//业务方向
			UserInfoDo userInfoDo = new UserInfoDo();
			userInfoDo.setMobile(mobilePhone);
			userDo.setCreateTime(new Date());
			userDo.setUserInfoDo(userInfoDo);
			
			//开始保存
			IResult<Long> result = userService.saveUser(userDo);
			if (result.isSuccess()) {
				Long userId = userDo.getId();
				userInfoDo.setUserId(userId);
				userInfoService.saveUserInfo(userInfoDo);
				jsonObject.put("result", "0");
				jsonObject.put("msg", mobilePhone);
				ResponseUtils.renderText(response, null, JSONObject.fromObject(jsonObject).toString());
			} else {
				jsonObject.put("result", "1");
				jsonObject.put("msg", "注册失败:"+result.getErrorMessage());
				ResponseUtils.renderText(response,	"UTF-8",JSONObject.fromObject(jsonObject).toString());
			}
	
	}
	
	 /**
	 * 注册用户跳转页面
	 * 
	 * @return
	 * @author: huangzl
	 * @date 2015年8月2日 22:45:08
	 */
	@RequestMapping("reg_step2")
	public String reg_step2(HttpServletRequest request,Model model) {
		
		
		String view = getLocalPath(request,"user/reg_step2");
		
		//登录账号
		String userName = request.getParameter("phoneNo");
		String mail = request.getParameter("mail");
		model.addAttribute("username",userName);
		if(StringUtils.isNotBlank(mail)){
			model.addAttribute("mail",mail);
		}else{
			model.addAttribute("mail","");
		}
		
		logger.info("----注册用户第二个页面----");
		
		return view;
	}
	
	 /**
	 * 注册用户跳转页面
	 * 
	 * @return
	 * @author: huangzl
	 * @date 2015年8月2日 22:45:08
	 */
	@RequestMapping("saveRegStep2")
	public void saveRegStep2(HttpServletRequest request,
			                 HttpServletResponse response,
			                 Model model) {
		
		String mailtxt = request.getParameter("mailtxt");
		String phoneNo = request.getParameter("phoneNo");
		
		JSONObject jsonObject = new JSONObject();
		
		if(StringUtils.isBlank(mailtxt)){
			jsonObject.put("result", 1);
			jsonObject.put("msg", "无效的邮箱地址");
			ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
			return;
		}
		
		if(StringUtils.isBlank(phoneNo)){
			jsonObject.put("result", 1);
			jsonObject.put("msg", "无效的账号");
			ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
			return;
		}
		
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("userName", phoneNo);
		UserDo temp1 = userService.getByUserDo(parameterMap);
		if(null == temp1){
			jsonObject.put("result", 1);
			jsonObject.put("msg", "账号不存在");
			ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
			return;
		}
		
		parameterMap.clear();
		parameterMap.put("mail", mailtxt);
		UserDo temp = userService.getByUserDo(parameterMap);
		if(null != temp && !phoneNo.equals(temp.getUserName())){
			jsonObject.put("result", 1);
			jsonObject.put("msg", "邮箱已被注册存在");
			ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
			return;
		}
		temp1.setMail(mailtxt);
		userService.updateUser(temp1);
		
		sendActMail(request, mailtxt, phoneNo,"reg","激活账号");
		
		jsonObject.put("result", 0);
		jsonObject.put("msg", phoneNo);
		ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
	}


	private void sendActMail(HttpServletRequest request, String mailtxt,String phoneNo,String actionType,String mailTitle) {
		String regUUID = UUID.randomUUID().toString().replaceAll("-", "");
		String serverAddr=getServerAddress(request);
		StringBuilder  sb = new StringBuilder();
		sb.append("请点击下面链接")
		  .append(mailTitle)
		  .append(":  ")
		  .append(serverAddr)
		  .append("/account/actAccountByMail.html?actAction=")
		  .append(actionType)
		  .append("&actCode=")
		  .append(regUUID);
		  
		   
		NotifyDo notifyDo = new NotifyDo(mailTitle,sb.toString(),mailtxt);
		mailService.send(notifyDo );
		userService.saveActCode(regUUID,phoneNo,actionType);
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
	 * 注册用户跳转页面
	 * 
	 * @return
	 * @author: huangzl
	 * @date 2015年8月2日 22:45:08
	 */
	@RequestMapping("reg_step3")
	public String reg_step3(HttpServletRequest request,Model model) {
		
		
		String view = getLocalPath(request,"user/reg_suc");
		logger.info("----注册用户跳转页面----");
		
		return view;
	}
	
	
	/**
	 * 通过邮箱激活
	 * 
	 * @return
	 */
	@RequestMapping("actAccountByMail")
	public String actAccountByMail(HttpServletRequest request,
			                 HttpServletResponse response,
			                 Model model) {
		
		String actCode = request.getParameter("actCode");
		String actAction = request.getParameter("actAction");
		String view= "user/act_suc";
		if(StringUtils.isBlank(actCode)){
			model.addAttribute("msg", "无效的激活码");
			return view;
		}
		
		if(StringUtils.isBlank(actAction)){
			model.addAttribute("msg", "无效参数");
			return view;
		}
		
		String msg = userService.actAccountByMail(actCode,actAction);
		model.addAttribute("msg", msg);
		
		if("forgetpassword".equals(actAction) && "成功".equals(msg)){
			TokenUtil.putToken(request, "forgetpassword");
			UserDo user = userService.getUserByActCode(actCode);
			if(null != user){
				request.getSession().setAttribute(WebConstants.SESSION_USER, user);
			}
			return "user/forgetPwd2Index";
		}
		
		return view;
	}
	
	
	
	/**
	 * 检查账号是否已注册
	 * 
	 * @return
	 * @author: huangzl
	 * @date 2015年8月2日 22:45:08
	 */
	@RequestMapping("checkAccount")
	public void checkAccount(HttpServletRequest request,
			                 HttpServletResponse response,
			                 Model model) {
		
		String phoneNo = request.getParameter("username");
		
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("userName", phoneNo);
		UserDo temp = userService.getByUserDo(parameterMap);

		JSONObject jsonObject = new JSONObject();
		if(temp!=null&&temp.getId()!=null){
			jsonObject.put("result", 0);
		}else{
			jsonObject.put("result", 1);
		}
		ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
	}
	
	/**
	 * 检查邮箱是否已注册，  检查账号是否存在
	 * 
	 * @return
	 */
	@RequestMapping("checkMail")
	public void checkMail(HttpServletRequest request,
			                 HttpServletResponse response,
			                 Model model) {
		
		String phoneNo = request.getParameter("phoneNo");
		String mailtxt = request.getParameter("mailtxt");
		String action = request.getParameter("action");
		
	
		
		JSONObject jsonObject = new JSONObject();
		
		if("reg".equals(action)){
		
			Map<String, Object> parameterMap = new HashMap<String, Object>();
			parameterMap.put("mail", mailtxt);
			UserDo temp = userService.getByUserDo(parameterMap);
			
			if(temp!=null && !temp.getUserName().equals(phoneNo)){
				jsonObject.put("result", 1);
				jsonObject.put("msg", "邮箱已存在");
			}else{
				jsonObject.put("result", 0);
			}
		}else{ //找回密码
			Map<String, Object> parameterMap = new HashMap<String, Object>();
			parameterMap.put("userName", phoneNo);
			UserDo temp = userService.getByUserDo(parameterMap);
			
			if(temp ==null){
				jsonObject.put("result", 1);
				jsonObject.put("msg", "账号不存在");
			}if(StringUtils.isBlank(temp.getMail()) || !temp.getMail().equals(mailtxt) ){
				jsonObject.put("result", 1);
				jsonObject.put("msg", "邮箱不存在");
			}else{
				jsonObject.put("result", 0);
			}
		}
		ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
	}
	
	/**********************************end 注册***************************************/
	
	/**
	 * 发送短信验证码
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "sendVirifyCode")
    public void sendPhoneVirifyCode(HttpServletRequest request,HttpServletResponse response,
    		HttpSession session) {
		JSONObject jsonObject = new JSONObject();
		String mobilePhone = request.getParameter("mobile");
		if(StringUtils.isBlank(mobilePhone) ){
			jsonObject.put("result", "手机号码为空,请重试"); 
			jsonObject.put("resultCode", "1"); 
			ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
			return;
		}
		
		//发送信息
		int virifyCode = (int)(Math.random()*9000+1000);
		String  message ="您好!你的短信验证码是"+virifyCode+",5分钟内有效。";
        IResult result = smsService.sendMessage(mobilePhone, message);
        
        session.setAttribute(mobilePhone, virifyCode);
     
        if (0 == result.getResultCode()) {
            //发送成功
        	logger.info("向手机号:"+mobilePhone+"发送验证码成功,验证码为:"+message);
            jsonObject.put("ret","0");
            jsonObject.put("resultMessage","短信发送成功!");
        } else {
            //发送失败
        	logger.info("向手机号:"+mobilePhone+"发送验证码失败");
            jsonObject.put("ret","1");
            jsonObject.put("resultMessage","短信发送失败!");
        }
        ResponseUtils.renderText(response, null,jsonObject.toString());
    }
	
	/*
	private static String getIpAddress(HttpServletRequest request) { 
		String ip = request.getHeader("x-forwarded-for"); 
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
		ip = request.getHeader("Proxy-Client-IP"); 
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
		ip = request.getHeader("WL-Proxy-Client-IP"); 
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
		ip = request.getHeader("HTTP_CLIENT_IP"); 
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
		ip = request.getHeader("HTTP_X_FORWARDED_FOR"); 
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
		ip = request.getRemoteAddr(); 
		}
		return ip; 
	}
	*/
	private static String getIpAddress(HttpServletRequest request) { 
		StringBuffer sb = new StringBuffer();
		sb.append("x-forwarded-for:").append(request.getHeader("x-forwarded-for"))
		  .append("Proxy-Client-IP").append(request.getHeader("Proxy-Client-IP"))
		  .append("WL-Proxy-Client-IP").append(request.getHeader("WL-Proxy-Client-IP"))
		  .append("HTTP_CLIENT_IP").append(request.getHeader("HTTP_CLIENT_IP"))
		  .append("HTTP_X_FORWARDED_FOR").append(request.getHeader("HTTP_X_FORWARDED_FOR"));
		
		return sb.toString(); 
	}
	
	private String cutRef(String ref){
		String m = ref.substring(3);
		return m;
	}
	
	
	/**
	 * 新用户注册
	 * @param request
	 * @param response
	 * @param session
	 */
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public void register(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		JSONObject jsonObject = new JSONObject();
			String name = request.getParameter("name");
			String mobilePhone = request.getParameter("mobile");
			String pwd =  request.getParameter("password");
			String referenceId =  request.getParameter("refferee");
			String mobileCode =  request.getParameter("mobileCode");
			String netWork =  request.getParameter("netWork");
			String passwordTwo =  request.getParameter("passwordTwo");
			if(StringUtils.isBlank(netWork)){
				netWork = "A";
			}
			
			Object vc =session.getAttribute(mobilePhone);
			String verifyCode=null;
			if(vc !=null){
				verifyCode= String.valueOf(vc);
			}
			
			// 测试环境注释验证码
			
			// 测试环境注释验证码
			String ifSend = paramService.getByName(WebConstants.IF_SEND_MESSAGE);
			if(StringUtils.isNotBlank(ifSend) && "1".equals(ifSend)){
				if(!mobileCode.equals(verifyCode) ){
					logger.info("手机号:"+mobilePhone+"验证码失败 session verifycode:"+verifyCode+" 参数："+mobileCode);
					jsonObject.put("result", "手机验证码有误");
					ResponseUtils.renderText(response, "UTF-8", JSONObject.fromObject(jsonObject).toString());
					return;
				}
			}
			
			Map<String, Object> parameterMap = new HashMap<String, Object>();
			parameterMap.put("userName", mobilePhone);
			// 获取登录用户userId
			UserDo temp = userService.getByUserDo(parameterMap);

			if(temp!=null&&temp.getId()!=null){
				jsonObject.put("result", "输入的手机号已存在");
				ResponseUtils.renderText(response, "UTF-8", JSONObject.fromObject(jsonObject).toString());
				return;
			}
			if (StringUtils.isBlank(name)) {
				jsonObject.put("result", "请输入昵称");
				ResponseUtils.renderText(response, "UTF-8", JSONObject.fromObject(jsonObject).toString());
				return;
			}
			if (StringUtils.isBlank(mobilePhone)) {
				jsonObject.put("result", "请输入手机号");
				ResponseUtils.renderText(response, "UTF-8", JSONObject.fromObject(jsonObject).toString());
				return;
			}
			if (StringUtils.isBlank(referenceId)) {
				jsonObject.put("result", "请输入推荐人手机号码");
				ResponseUtils.renderText(response, "UTF-8", JSONObject.fromObject(jsonObject).toString());
				return;
			}
			
			if (StringUtils.isBlank(passwordTwo)) {
				jsonObject.put("result", "请输入二级密码");
				ResponseUtils.renderText(response, "UTF-8", JSONObject.fromObject(jsonObject).toString());
				return;
			}
			
			//根据推荐人的手机号码查找推荐人
			//parameterMap.put("mobile", referenceId);
			parameterMap.clear();
			parameterMap.put("userName", referenceId);
			parameterMap.put("status", "1");
			UserDo refUser = userService.getByUserDo(parameterMap);
			if(refUser == null){
				jsonObject.put("result", "查找不到对应的推荐用户或者推荐用户为非正式会员");
				ResponseUtils.renderText(response, "UTF-8", JSONObject.fromObject(jsonObject).toString());
				return;
			}
			
			String pwdMd5 =DigestUtils.md5Hex(pwd + WebConstants.PASS_KEY);
			String pwdTwoMd5 =DigestUtils.md5Hex(passwordTwo + WebConstants.PASS_KEY);
			UserDo userDo =new UserDo();
			userDo.setCreateUser(-1L);                 //当前用户是记录创建者
			userDo.setUserName(mobilePhone);
			userDo.setPassword(pwdMd5);
			userDo.setTwoLevelPwd(pwdMd5);
			userDo.setGrade(0);								//当前等级
			userDo.setOrgan("0");								//组织机构
			userDo.setEnabled("0");								//状态  默认激活
		
			Random ne=new Random();//实例化一个random的对象ne
	        String activeNum="" + (ne.nextInt(9999-1000+1)+1000);
			userDo.setRemark(activeNum);
			userDo.setReferrerId(refUser.getId());				//推荐人ID
			userDo.setParentId(0l);	
			userDo.setStatus(1);//接点人ID
			userDo.setTreeNode("");								//业务方向
			userDo.setName(name);
			userDo.setTwoLevelPwd(pwdTwoMd5);               //二级密码
			UserInfoDo userInfoDo = new UserInfoDo();
			userInfoDo.setRealName(name);
			userInfoDo.setMobile(mobilePhone);

			userDo.setCreateTime(new Date());
			userDo.setUserInfoDo(userInfoDo);
			
			//开始保存
			IResult<Long> result = userService.saveUser(userDo);
			if (result.isSuccess()) {
				Long userId = userDo.getId();
				userInfoDo.setUserId(userId);
				userInfoService.saveUserInfo(userInfoDo);
				
				jsonObject.put("result", "注册成功");
				ResponseUtils.renderText(response, null, JSONObject.fromObject(jsonObject).toString());
			} else {
				jsonObject.put("result", "注册失败:"+result.getErrorMessage());
				ResponseUtils.renderText(response,
				null,JSONObject.fromObject(jsonObject).toString());
			}
	}
	
	
	/********************start 申请代理 ******************/
	
	/**
	 * 申请代理页面
	 * 
	 * @return
	 * @author: huangzl
	 */
	@RequestMapping("/applyAgent")
	public String applyAgent(HttpServletRequest request,Model model) {
		
		String view = getLocalPath(request,"member/applyAgent");
		return view;
	}
	/**
	 * 设置报单中心
	 * 
	 * @return
	 */
	@RequestMapping("/reportCenter")
	public String reportCenter(HttpServletRequest request,Model model) {
		
		String view = getLocalPath(request,"member/reportCenter");
		return view;
	}
	
	/**
	 * 保存报单中以
	 * 
	 * @return
	 */
	@RequestMapping("/saveCenter")
	public void saveCenter(HttpServletRequest request,HttpServletResponse response,Model model) {
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "1");
		//更新用户报单中以人
		HttpSession  session = request.getSession();
		UserDo user = (UserDo) session.getAttribute(WebConstants.SESSION_USER);
		UserDo treeUser = userService.getById(user.getId());
		if(StringUtils.isNotBlank(treeUser.getTreeNode())){
			jsonObject.put("result", "3");
			jsonObject.put("message", "用户已指定报单中心");
			ResponseUtils.renderText(response, null, JSONObject.fromObject(jsonObject).toString());
			return;
		}
		
		String mobile = request.getParameter("mobile");
		Map<String,Object> parm = new HashMap<String,Object>();
		parm.put("userName", mobile);
		UserDo centerUser = userService.getByUserDo(parm);
		
		if( null == centerUser){
			jsonObject.put("result", "0");
			jsonObject.put("message", "手机号码不存在用户");
			ResponseUtils.renderText(response, null, JSONObject.fromObject(jsonObject).toString());
			return;
		}
		String organ = centerUser.getOrgan();
		if(!"3".equals(organ)){
			jsonObject.put("result", "2");
			jsonObject.put("message", "手机号码不是报单中心");
			ResponseUtils.renderText(response, null, JSONObject.fromObject(jsonObject).toString());
			return;
		}
		
	
		 UserDo tempSave = new UserDo();
		 tempSave.setId(user.getId());
		 tempSave.setTreeNode(centerUser.getId().toString());
		 userService.updateUser(tempSave);
		
		
		jsonObject.put("result", "1");
		jsonObject.put("message", "报单中心保存成功");
		ResponseUtils.renderText(response, null, JSONObject.fromObject(jsonObject).toString());
	
	}
	
	/**
	 * 新用户注册
	 * @param request
	 * @param response
	 * @param session
	 */
	@RequestMapping(value = "saveApplyAgent", method = RequestMethod.POST)
	public void saveApplyAgent(HttpServletRequest request, 
							   HttpServletResponse response) {
		
		JSONObject jsonObject = new JSONObject();
		String agentType = request.getParameter("agentType");
		String province = request.getParameter("province");
		String city =  request.getParameter("city");
		
		HttpSession  session = request.getSession();
		UserDo user = (UserDo) session.getAttribute(WebConstants.SESSION_USER);
		Long userId = user.getId();
			
		if(StringUtils.isBlank(city)){
			jsonObject.put("result", "市区不可以为空");
			ResponseUtils.renderText(response, "UTF-8", JSONObject.fromObject(jsonObject).toString());
			return;
		}
		if (StringUtils.isBlank(province)) {
			jsonObject.put("result", "省不能为空");
			ResponseUtils.renderText(response, "UTF-8", JSONObject.fromObject(jsonObject).toString());
			return;
		}
		if (StringUtils.isBlank(agentType)) {
			jsonObject.put("result", "代理类型不能为空");
			ResponseUtils.renderText(response, "UTF-8", JSONObject.fromObject(jsonObject).toString());
			return;
		}
		
		
		//根据推荐人的手机号码查找推荐人
		ApplyAgentDo agentDo =new ApplyAgentDo();
		agentDo.setUserId(userId);
		agentDo.setCreateTime(new Date());
		agentDo.setAgentType(agentType);
		agentDo.setCity(city);
		agentDo.setProvince(province);
		agentDo.setStatus("F");
		
		//开始保存
		IResult<Long> result = userService.saveApplyAgent(agentDo);
		if (result.isSuccess()) {
			jsonObject.put("result", "代理申请成功");
			ResponseUtils.renderText(response, null, JSONObject.fromObject(jsonObject).toString());
		} else {
			jsonObject.put("result", "代理申请失败:"+result.getErrorMessage());
			ResponseUtils.renderText(response,null,JSONObject.fromObject(jsonObject).toString());
		}
		
	}
	
	/**
	 * 审批 申请代理页面
	 * 
	 * @return
	 * @author: huangzl
	 */
	@RequestMapping("/approveApplyAgent")
	public String approveApplyAgent(HttpServletRequest request,Model model) {
		String view = getLocalPath(request,"member/approveApplyAgent");
		Map<String,Object> paraMap = new HashMap<String,Object>();
		List<Map<String,Object>>  userAgentList = userService.getApplyAgentUser(paraMap);
		model.addAttribute("applyUserList", userAgentList);
		return view;
	}
	
	
	/**
	 * 审批 申请代理页面
	 * 
	 * @return
	 * @author: huangzl
	 */
	@RequestMapping("/saveApproveApplyAgent")
	public void saveApproveApplyAgent(HttpServletRequest request,HttpServletResponse response,Model model) {
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("resultCode", "1");
		
		String id = request.getParameter("id");
		String status = request.getParameter("status");
		
		HttpSession  session = request.getSession();
		UserDo user = (UserDo) session.getAttribute(WebConstants.SESSION_USER);
		Long userId = user.getId();
			
		if(StringUtils.isBlank(id)){
			jsonObject.put("result", "审批记录ID不能为空");
			ResponseUtils.renderText(response, "UTF-8", JSONObject.fromObject(jsonObject).toString());
			return;
		}
		
		if(StringUtils.isBlank(status)){
			jsonObject.put("result", "审批记录状态不能为空");
			ResponseUtils.renderText(response, "UTF-8", JSONObject.fromObject(jsonObject).toString());
			return;
		}
		
		ApplyAgentDo agentDo =new ApplyAgentDo();
		agentDo.setApproveTime(new Date());
		agentDo.setStatus(status);
		agentDo.setId(Long.valueOf(id));
		
		//开始保存
		IResult<Long> result = userService.updateApplyAgent(agentDo);
		if (result.isSuccess()) {
			jsonObject.put("resultCode", "0");
			jsonObject.put("result", "代理申请审批成功");
			ResponseUtils.renderText(response, null, JSONObject.fromObject(jsonObject).toString());
		} else {
			jsonObject.put("result", "代理申请审批失败:"+result.getErrorMessage());
			ResponseUtils.renderText(response,null,JSONObject.fromObject(jsonObject).toString());
		}
	}

	
	/********************end 申请代理 ******************/
	
	
	
	
  /**************************start 用户信息修改********************/
	
	/**
	 * 用户信息修改查看
	 * 
	 */
	@RequestMapping("viewUserInfo")
	public String viewUserInfo(String pwdFlag,Model model) {
		logger.info("----更新用户信息跳转页面----");
		return "user/viewuserinfo";
	}
	
	
	/**
	 * 修改资料跳转方法
	 * 
	 * @param model
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping("/modifyInfo")
	public String modifyInfo(Model model, HttpSession session, HttpServletRequest request) {
		logger.info("----------修改用户资料---------");
		UserDo user = (UserDo) session.getAttribute(WebConstants.SESSION_USER);
		return "user/userInfo";
	}
	
	/**
	 * 修改资料保存方法
	 *  
	 * @param model
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/modifyUserinfo", method = RequestMethod.POST)
	public void modifyUserinfo(HttpServletRequest request,
							HttpServletResponse response,Model model) {
		
		JSONObject jsonObject = new JSONObject();
		try{
			UserDo user = (UserDo) request.getSession().getAttribute(WebConstants.SESSION_USER);
			if(user == null){
				jsonObject.put("msg", "请重新登录");
				return;
			}
			
			String wx = request.getParameter("weixin");
			if(StringUtils.isBlank(wx)){
				jsonObject.put("msg", "微信账号不能为空");
				ResponseUtils.renderText(response, "UTF-8", JSONObject.fromObject(jsonObject).toString());
				return;
			}
			
			String name = request.getParameter("name");
			if(StringUtils.isBlank(name)){
				jsonObject.put("msg", "真实姓名不能为空");
				return;
			}
			
			String password = request.getParameter("password");
			if(StringUtils.isBlank(password)){
				jsonObject.put("msg", "二级密码不能为空");
				return;
			}
			
			//更新用户表的name
			UserDo tempSave = new UserDo();
			tempSave.setId(user.getId());
			tempSave.setName(name);
			tempSave.setWeixin(wx);
			String pwdMd5 = DigestUtils.md5Hex(password + WebConstants.PASS_KEY);
			tempSave.setTwoLevelPwd(pwdMd5);
			userService.updateUser(tempSave);
			
			/*
			UserInfoDo userInfo = userInfoService.getByUserId(user.getId());
			if(null == userInfo ){
				userInfo = new UserInfoDo();
				userInfo.setUserId(user.getId());
			}
			userInfo.setRealName(userInfoDo.getRealName());
			userInfo.setZfbNumber(userInfoDo.getZfbNumber());
			userInfo.setWeixiNumber(userInfoDo.getWeixiNumber());
			userInfo.setBankName(userInfoDo.getBankName());
			userInfo.setBankSubbranch(userInfoDo.getBankSubbranch());
			userInfo.setBankAccount(userInfoDo.getBankAccount());
			userInfo.setRealName(userInfoDo.getRealName());
			userInfo.setIdCardNo(userInfoDo.getIdCardNo());
			userInfo.setIdCardNoString(userInfoDo.getIdCardNoString());
			userInfo.setContactAddress(userInfoDo.getContactAddress());
			userInfo.setProvince(userInfoDo.getProvince());
			userInfo.setCity(userInfoDo.getCity());
			if(userInfo.getId() == null){
				userInfoService.saveUserInfo(userInfo);
			}else{
				userInfoService.updataUserInfo(userInfo);
			}
			*/
			request.getSession().setAttribute(WebConstants.SESSION_USER, user);
			jsonObject.put("result", 0);
		}catch(Exception e){
			jsonObject.put("msg", e.getMessage());
		}finally{
			ResponseUtils.renderText(response, "UTF-8", JSONObject.fromObject(jsonObject).toString());
		}
	}
	
	 /**************************end 用户信息修改********************/
}
