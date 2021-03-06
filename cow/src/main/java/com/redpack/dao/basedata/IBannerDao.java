/*
 * Powered By  huangzl QQ: 272950754
 * Web Site:  
 * Since 2008 - 2016
 */

package com.redpack.dao.basedata;

/**
 * @author  huangzl QQ: 272950754
 * @version 1.0
 * @since 1.0
 */


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.redpack.common.basedata.model.BannerDo;
@Repository
public interface IBannerDao {

	/**
	 * 根据ID 查询
	 * @parameter id
	 */
	public BannerDo getById(int id);
	
	/**
	 *根据条件查询列表
	 */
	public List<BannerDo> selectBanner(Map<String,Object> parameterMap);
	
	/**
	 * 更新
	 */
	public int  updateBannerById(BannerDo newBannerDo);
	
	/**
	 * 新增
	 */
	public int addBanner(BannerDo newBannerDo);
	
	/**
	 * 删除
	 */
	public int deleteById(int id);

}
