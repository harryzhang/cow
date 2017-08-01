
package com.redpack.dao.param;

import org.springframework.stereotype.Repository;

import com.redpack.common.base.param.model.ParamDo;

@Repository
public interface IParamDao {

	/**
	 * 根据名称查询值
	 * @parameter id
	 */
	public String getByName(String name);
	
	
	/**
	 * 更新
	 */
	public int  updateParam(ParamDo paramDo);
	

}
