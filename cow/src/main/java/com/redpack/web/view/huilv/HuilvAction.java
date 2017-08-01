/*
 * Powered By  huangzl QQ: 272950754
 * Web Site:  
 * Since 2008 - 2016
 */


package com.redpack.web.view.huilv;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.redpack.common.huilv.IHuilvService;
import com.redpack.web.view.base.controller.BaseController;

@Scope("prototype")
@Component("huilvAction")
public class HuilvAction extends BaseController {
	
	private final Logger logger = Logger.getLogger(this.getClass());	
	@Autowired
	private IHuilvService huilvService;
	
	private Map<String, Object> request;
	

	

	/**
	 * 新增或修改
	 * 
	 */
	public String saveHuilv(){
		return "";
	}
	

	
	
	/**
	 * 删除
	 * 
	 */
	public String deleteHuilv(){
	    return "";
	}
	
	/**
	 * 查找
	 * 
	 * @return
	 */
	public String findById(){
		return "";
	}
	
	/**
	 * 根据条件查找
	 * 
	 * @return
	 */
	public String query(){
		return "";
	}


}
