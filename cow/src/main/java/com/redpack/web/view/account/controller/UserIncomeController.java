
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
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.redpack.common.account.IUserAccountIncomeService;
import com.redpack.common.account.IUserInfoService;
import com.redpack.common.account.model.UserDo;
import com.redpack.common.account.model.UserInfoDo;
import com.redpack.common.base.result.IResult;
import com.redpack.common.constant.WebConstants;
import com.redpack.common.sms.ISmsService;
import com.redpack.utils.ResponseUtils;
import com.redpack.web.view.base.controller.BaseController;

/**
 * 
 * @author: zhangyunhua
 * @date 2015年3月5日 上午11:01:51
 */
@Controller
@RequestMapping("/userIncome")
public class UserIncomeController extends BaseController{
	private static final Logger logger = Logger.getLogger(UserIncomeController.class);
	@Autowired
	private IUserAccountIncomeService userAccountIncomeService;
	@Autowired
	private IUserInfoService userInfoService;

	
	/**
	 * 新增或修改
	 * 
	 */
	public String saveWithdraw() {
		return "";
	}

	/**
	 * 删除
	 * 
	 */
	public String deleteWithdraw() {
		return "";
	}

	/**
	 * 查找
	 * 
	 * @return
	 */
	public String findById() {
		return "";
	}

	/**
	 * 根据条件查找
	 * 
	 * @return
	 */
	public String query() {
		return "";
	}
	

}
