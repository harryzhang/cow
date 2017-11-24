package com.redpack.web.view.wallet;

import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.redpack.common.account.model.UserDo;
import com.redpack.common.base.constant.Constants;
import com.redpack.common.base.exception.BusinessException;
import com.redpack.common.base.result.IResult;
import com.redpack.common.constant.WebConstants;
import com.redpack.common.order.IOrderService;
import com.redpack.common.order.model.OrderDo;
import com.redpack.common.wallet.IWalletService;
import com.redpack.common.wallet.model.WalletDo;
import com.redpack.utils.ResponseUtils;
import com.redpack.utils.UploadUtil;
import com.redpack.web.view.base.controller.BaseController;
import com.redpack.web.view.base.controller.TokenUtil;

/**
 * 收款，付款管理
 * 
 * @author: zhangyunhua
 * @date 2015年3月5日 上午11:01:51
 */
@Controller
@RequestMapping("/wallet")
public class WalletController extends BaseController {

	private static final Logger logger = Logger.getLogger(WalletController.class);

	@Autowired
	private IWalletService walletService;
	@Autowired
	private IOrderService  orderService;


	/**
	 * 跳转付款页面
	 * 
	 * @return
	 * @author: zhangyunhua
	 * @date 2015年8月2日 22:45:08
	 */
	@RequestMapping("sharePay")
	public String sharePay(HttpServletRequest request, HttpServletResponse response, Model model) {
		logger.info("----跳转付款页面----");
		// model.addAttribute("pwdFlag", pwdFlag);
		List<Map> sharePayLst = walletService.selectSharePay();
		model.addAttribute("sharePayLst", sharePayLst);
		return "wallet/sharePay";
	}

	/**
	 * 跳转付款页面
	 * 
	 * @return
	 * @author: zhangyunhua
	 * @date 2015年8月2日 22:45:08
	 */
	@RequestMapping("listFk")
	public String listFk(HttpServletRequest request, HttpServletResponse response, Model model) {
		logger.info("----跳转付款页面----");
		// model.addAttribute("pwdFlag", pwdFlag);
		List<Map> walletList = walletService.selectUserFk(getUserId(request), null);
		model.addAttribute("walletList", walletList);
		return "wallet/listFk";
	}

	/**
	 * 确认收款
	 * 
	 * @return
	 */
	@RequestMapping("confirmSK")
	public void confirmSK(HttpServletRequest request, String password, String newPassword,
	        Model model, HttpSession session, HttpServletResponse response) {
		logger.info("----确认收款----");
		UserDo user = (UserDo) session.getAttribute(WebConstants.SESSION_USER);
		String recordIdStr = request.getParameter("recordId");

		// result json
		JSONObject jsonObject = new JSONObject();

		// valid parameter
		if (StringUtils.isBlank(recordIdStr)) {
			jsonObject.put("result", "参数无效,请重试");
			jsonObject.put("resultCode", "1");
			ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
			return;
		}

		long recordId = Long.valueOf(recordIdStr);

		try {
			IResult result = walletService.confirmSK(user.getId(), recordId);
			if (result == null) {
				jsonObject.put("result", "网络异常");
				jsonObject.put("resultCode", "1");
				ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
				return;
			}

			if (!result.isSuccess()) {
				jsonObject.put("result", "网络异常" + result.getErrorMessage());
				jsonObject.put("resultCode", "1");
				ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
				return;
			}
		} catch (BusinessException be) {
			jsonObject.put("result", be.getMessage());
			jsonObject.put("resultCode", "1");
			ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
			return;
		} catch (Exception e) {
			jsonObject.put("result", "网络异常");
			jsonObject.put("resultCode", "1");
			ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
			return;
		}

		jsonObject.put("result", "成功");
		jsonObject.put("resultCode", "0");
		ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
	}

	/**
	 * 确认 付款
	 * 
	 * @return
	 */
	@RequestMapping("confirmFK")
	public void confirmFK(Model model, HttpSession session, HttpServletResponse response,
	        HttpServletRequest request) {
		logger.info("----确认收款----");
		UserDo user = (UserDo) session.getAttribute(WebConstants.SESSION_USER);
		String recordIdStr = request.getParameter("recordId");

		// result json
		JSONObject jsonObject = new JSONObject();

		// valid parameter
		if (StringUtils.isBlank(recordIdStr)) {
			jsonObject.put("result", "参数无效,请重试");
			jsonObject.put("resultCode", "1");
			ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
			return;
		}

		long recordId = Long.valueOf(recordIdStr);

		IResult result = walletService.confirmFK(user.getId(), recordId);

		if (result == null) {
			jsonObject.put("result", "网络异常" + result.getErrorMessage());
			jsonObject.put("resultCode", "1");
			ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
			return;
		}

		if (!result.isSuccess()) {
			jsonObject.put("result", "网络异常" + result.getErrorMessage());
			jsonObject.put("resultCode", "1");
			ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
			return;
		}

		jsonObject.put("result", "成功");
		jsonObject.put("resultCode", "0");
		ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
	}

	/**
	 * 处理等待的用户
	 * 
	 * @return
	 */
	@RequestMapping("processWaitingUser")
	public void processWaitingUser(Model model, HttpSession session, HttpServletResponse response,
	        HttpServletRequest request) {
		logger.info("----处理等待的用户----");
		UserDo user = (UserDo) session.getAttribute(WebConstants.SESSION_USER);
		String groupName = request.getParameter("groupName");

		// result json
		JSONObject jsonObject = new JSONObject();

		// valid parameter
		if (StringUtils.isBlank(groupName)) {
			jsonObject.put("result", "参数无效,请重试");
			jsonObject.put("resultCode", "1");
			ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
			return;
		}

		try {
			walletService.processWaitingUser(groupName);
		} catch (Throwable e) {
			jsonObject.put("result", "网络异常");
			jsonObject.put("resultCode", "1");
			ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
			e.printStackTrace();
			return;

		}

		jsonObject.put("result", "成功");
		jsonObject.put("resultCode", "0");
		ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
	}

	/**
	 * 跳转收款页面
	 * 
	 * @return
	 * @author: zhangyunhua
	 * @date 2015年8月2日 22:45:08
	 */
	@RequestMapping("listSk")
	public String listSk(HttpServletRequest request, HttpServletResponse response, Model model) {
		logger.info("----跳转收款页面----");
		// model.addAttribute("pwdFlag", pwdFlag);
		List<Map> walletList = walletService.selectUserSk(getUserId(request), null);
		model.addAttribute("walletList", walletList);
		return "wallet/listSk";
	}

	/**
	 * 跳转付款凭证上传页面
	 * 
	 * @return
	 * @author: zhangyunhua
	 * @date 2015年8月2日 22:45:08
	 */
	@RequestMapping("toUploadPayImg")
	public String toUploadPayImg(HttpServletRequest request, HttpServletResponse response,
	        Model model) {
		logger.info("----跳转付款凭证上传页面----");
		String shareUser = request.getParameter("shareUser");
		if(StringUtils.isBlank(shareUser)){
			model.addAttribute("errorMsg", "无效的共享者");
			return "/error";
		}
		OrderDo  newOrder = (OrderDo)request.getSession().getAttribute(Constants.SESSION_CART);
		Map<String, Object> paraM = new HashMap<String,Object>();
		paraM.put("orderNo", newOrder.getOrderCode());
		List<WalletDo> wallLst = walletService.selectWallet(paraM);
		if(!CollectionUtils.isEmpty(wallLst)){
			WalletDo newWalletDo = wallLst.get(0);
			newWalletDo.setSkUserId(Long.valueOf(shareUser));
			walletService.updateWalletById(newWalletDo);
		}
		
		String token = TokenUtil.putToken(request, "upload");
		model.addAttribute("token", token);
		return "wallet/uploadPayImg";
	}

	/**
	 * 付款凭证上传
	 * 
	 * @return
	 * @author: zhangyunhua
	 * @date 2015年8月2日 22:45:08
	 */
	@RequestMapping("uploadPayImg")
	public void uploadPayImg(HttpServletRequest request, HttpServletResponse response, Model model) {
		logger.info("----跳转付款凭证上传页面----");
		// result json
		JSONObject jsonObject = new JSONObject();
		try {
			long userId = getUserId(request);
			String file = getString(request, "file");

			// 允许png
			String pngHeader = "data:image/png;base64,";
			// 允许jpeg
			String jpgHeader = "data:image/jpeg;base64,";

			if (StringUtils.isBlank(file)) {
				jsonObject.put("result", "请选择要上传的图片");
				jsonObject.put("resultCode", 1);
				ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
				return;
			}

			if (!(file.indexOf(pngHeader) == 0 || file.indexOf(jpgHeader) == 0)) {
				jsonObject.put("result", "错误的文件格式");
				jsonObject.put("resultCode", 1);
				ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
				return;
			}

			logger.info("开始保存资料信息至服务器本地......");
			// 去掉头部
			int zmHeaderLength = file.indexOf(";base64,") + ";base64,".length();
			file = file.substring(zmHeaderLength);

			// 文件保存服务器 和 文件保存数据库
			String filePath = UploadUtil.saveMaterialInfo(file);
			logger.info("保存资料信息的结果是否成功：......filePath：" + filePath);

			if (filePath != null) {
				jsonObject.put("result", "上传资料成功");
				jsonObject.put("filePath", filePath);
				jsonObject.put("resultCode", 0);
				
				OrderDo  newOrder = (OrderDo)request.getSession().getAttribute(Constants.SESSION_CART);
				
				walletService.confirmUpload(newOrder.getOrderCode(),filePath);
				ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
				return;
			} else {
				jsonObject.put("result", "上传图片失败！");
				jsonObject.put("resultCode", 1);
				ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
				return;
			}
		} catch (Exception e) {
			logger.error("error", e);
			jsonObject.put("result", "系统异常,请稍后再试");
			jsonObject.put("resultCode", 1);
			ResponseUtils.renderText(response, "UTF-8", jsonObject.toString());
			return;
		}

	}

	
	@RequestMapping("showImg")
	public void showImg(String imgPath, HttpServletResponse response)throws IOException {
		response.setCharacterEncoding("utf-8");
		logger.info("图片文件库路径为：" + imgPath);
			byte[] data = UploadUtil.getImage(imgPath);
			response.setContentType("image/png");
			OutputStream stream = response.getOutputStream();
			stream.write(data);
			stream.flush();
			stream.close();
	}

}
