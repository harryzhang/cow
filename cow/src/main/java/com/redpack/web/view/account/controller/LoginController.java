
package com.redpack.web.view.account.controller;

import java.util.HashMap;
import java.util.List;
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
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.redpack.common.account.IUserInfoService;
import com.redpack.common.account.IUserService;
import com.redpack.common.account.model.UserDo;
import com.redpack.common.account.model.UserInfoDo;
import com.redpack.common.active.IActiveService;
import com.redpack.common.basedata.IBannerService;
import com.redpack.common.basedata.model.BannerDo;
import com.redpack.common.constant.WebConstants;
import com.redpack.common.goods.IGoodsService;
import com.redpack.common.goods.model.GoodsDo;
import com.redpack.common.news.ILoanNewsService;
import com.redpack.common.news.model.LoanNewsDo;
import com.redpack.common.notice.INoticeService;
import com.redpack.utils.ResponseUtils;
import com.redpack.web.view.base.controller.BaseController;

/**
 * @Description 描述方法作用
 * @author huangzl QQ: 272950754
 * @date 2015年5月27日 下午5:33:55
 * @Project hehenian-lend-login
 * @Package com.hehenian.login.account
 * @File LoginController.java
 */
@Controller
@RequestMapping(value = "/login")
public class LoginController extends BaseController {
	private static final Logger logger = Logger.getLogger(LoginController.class);

	@Autowired
	private IUserService userService;
	@Autowired
	private IUserInfoService userInfoService;
	
	@Autowired
	private IGoodsService goodsService;
	@Autowired
	private ILoanNewsService loanNewsService;
	@Autowired
	private INoticeService  noticeService;
	@Autowired
	private IBannerService  bannerService;
	@Autowired
	private IActiveService  activeService;
	

	// 登录页验证码标识
	private final static String pageId = "userlogin";

	/**
	 * 登录入口
	 * 
	 * @return
	 * @author: zhangyunhua
	 * @date 2015-3-29 上午3:36:11
	 */
	@RequestMapping(value = "index")
	public String index(HttpServletRequest request) {
		logger.info("----loginInit(初始化登录页面);----");
		return "login/login";
	}

	/**
	 * 登录入口
	 * 
	 * @return
	 * @author: zhangyunhua
	 * @date 2015-3-29 上午3:36:11
	 */
	@RequestMapping(value = "main")
	public String main(ModelMap map, HttpSession sessionS) {
		logger.info("----loginInit(登录成功)----");
		
		//加载认养商品
		Map<String, Object> parameterMap= new HashMap<String,Object>();
		List<GoodsDo> goodLst = goodsService.selectGoods(parameterMap);
		map.addAttribute("goodLst", goodLst);
		
		//加载新闻
		List<LoanNewsDo> newsLst = loanNewsService.getLastNews();
		map.addAttribute("news", newsLst);
		
		//加载公告
		List<Map<String, Object>> noticeLst = noticeService.queryNotice();
		if(!CollectionUtils.isEmpty(noticeLst)){
			map.addAttribute("notice", noticeLst.get(0));
		}
		
		//加载活动广告图片
		Map<String, Object> activePara= new HashMap<String,Object>();
		activePara.put("status", 1);
		List<BannerDo> activeLst = activeService.selectActive(activePara);
		map.put("activeLst", activeLst);
		
		//加载banner图片
		Map<String, Object> bannerPara= new HashMap<String,Object>();
		bannerPara.put("status", 1);
		List<BannerDo> bannerLst = bannerService.selectBanner(bannerPara);
		map.put("bannerLst", bannerLst);
		
		return "main";
	}
	
	/**
	 * 个人中心
	 * 
	 * @return
	 * @author: zhangyunhua
	 * @date 2015-3-29 上午3:36:11
	 */
	@RequestMapping(value = "me")
	public String me(ModelMap map, HttpSession sessionS) {
		logger.info("----loginInit(登录成功)----");
		return "me";
	}

	/**
	 * @Description: 登录
	 * @param response
	 * @param user
	 * @return 1用户名或密码未输入|2验证码输入错误 |用户密码错误
	 */
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public void login(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		session.removeAttribute("userDo");
		JSONObject jsonObject = new JSONObject();
		
		String loginInfo = request.getParameter("username");
		String password = request.getParameter("password");
		String code = request.getParameter("code");
		
		
		// 输入用户名密码
		if (StringUtils.isBlank(loginInfo) || StringUtils.isBlank(password)) {
			jsonObject.put("result", 1);
			jsonObject.put("msg", "用户名或密码不能为空");
			ResponseUtils.renderText(response, null, jsonObject.toString());
			return;
		}


		UserDo loginUser = null;
		if(StringUtils.isNotBlank(loginInfo)){
			Map<String, Object> parameterMap = new HashMap<String, Object>();
			parameterMap.put("userName", loginInfo);
			// 获取登录用户userId
			loginUser = userService.getByUserDo(parameterMap);
		}

		String pwdMd5 = DigestUtils.md5Hex(password + WebConstants.PASS_KEY);

		if (loginUser == null || !pwdMd5.equals(loginUser.getPassword())) {
			// 用户名密码错误
			jsonObject.put("result", 3);	
			jsonObject.put("msg", "用户名或密码错误");
			ResponseUtils.renderText(response, null, jsonObject.toString());
			return;
		}
		
				
		UserInfoDo userInfoDo = userInfoService.getByUserId(loginUser.getId());
		loginUser.setUserInfoDo(userInfoDo);
		
		Long parentId = loginUser.getReferrerId();
		if( parentId != null && 0 != parentId.intValue()){
			UserDo parentDo = userService.getById(parentId);
			loginUser.setParentDo(parentDo);
		}
		session.setAttribute(WebConstants.SESSION_USER, loginUser);

	
		// 取缓存登录信息
		jsonObject.put("result", 0);
		String userLocal =request.getParameter("userLocal");
		loginUser.setUserLocal(userLocal);
		
		userService.saveLoginlog(loginUser.getId(),"login");
		String afterUrl = LoginCheckUtil.getUrlAfterLogin(request, loginUser);
		jsonObject.put("afterUrl", afterUrl);
		
		// 登陆成功
		ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
	}

	/**
	 * 退出登录
	 * 
	 * @param request
	 * @param response
	 * @author: zhanbmf
	 * @date 2015-3-31 下午3:36:21
	 */
	@RequestMapping(value = "loginout")
	public String loginout(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().invalidate();
		return "redirect:/login/index.html";
	}

}
