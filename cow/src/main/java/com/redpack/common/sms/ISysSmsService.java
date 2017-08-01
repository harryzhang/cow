package com.redpack.common.sms;

import java.util.List;
import java.util.Map;

import com.redpack.common.sms.model.SysSmsDo;

public interface ISysSmsService {
	
	/**
	 * 根据ID 查询
	 * @parameter id
	 */
	public SysSmsDo getById(int id);
	
	/**
	 *根据条件查询列表
	 */
	public List<SysSmsDo> selectSysSms(Map<String,Object> parameterMap);
	
	/**
	 * 更新
	 */
	public int  updateSysSmsById(SysSmsDo newSysSmsDo);
	
	/**
	 * 新增
	 */
	public int addSysSms(SysSmsDo newSysSmsDo);
	
	/**
	 * 删除
	 */
	public int deleteById(int id); 

}
