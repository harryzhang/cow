/*
 * Powered By  huangzl QQ: 272950754
 * Web Site:  
 * Since 2008 - 2016
 */

package com.redpack.common.withdraw;

/**
 * @author  huangzl QQ: 272950754
 * @version 1.0
 * @since 1.0
 */

import java.util.List;
import java.util.Map;

import com.redpack.common.base.result.IResult;
import com.redpack.common.withdraw.model.WithdrawDo;


public interface IWithdrawService{

	/**
	 * 根据ID 查询
	 * @parameter id
	 */
	public WithdrawDo getById(int id);
	
	/**
	 *根据条件查询列表
	 */
	public List<WithdrawDo> selectWithdraw(Map<String,Object> parameterMap);
	
	/**
	 * 更新
	 */
	public int  updateWithdrawById(WithdrawDo newWithdrawDo);
	
	/**
	 * 新增
	 */
	public int addWithdraw(WithdrawDo newWithdrawDo);
	
	/**
	 * 删除
	 */
	public int deleteById(int id);
}
