package com.redpack.web.view.active.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.redpack.common.notice.INoticeService;
import com.redpack.web.view.base.controller.BaseController;


@Controller
@RequestMapping(value = "/active")
public class ActiveController extends BaseController {
	
	
	private static final Logger logger = Logger.getLogger(ActiveController.class);
	
	
	/**
	 * 活动
	 * 
	 * @return
	 * @author: zhangyunhua
	 * @date 2015-3-29 上午3:36:11
	 */
	@RequestMapping(value = "/activeList")
	public String toNotice(HttpServletRequest request,Model model) {
		//model.addAttribute("noticeList", noticeList);
		logger.debug("----NoticeController.toNotice;----");
		return "active/activeList";
	}

}
