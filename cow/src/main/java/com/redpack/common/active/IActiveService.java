/**   
* @Title: IActiveService.java 
* @Package com.redpack.common.active 
* @Description: TODO(用一句话描述该文件做什么) 
* @author zhangyunhmf
* @date 2017年11月22日 下午3:30:15 
* @version V1.0   
*/
package com.redpack.common.active;

import java.util.List;
import java.util.Map;

import com.redpack.common.basedata.model.BannerDo;

/** 
 * @ClassName: IActiveService 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 * @author zhangyunhmf
 * @date 2017年11月22日 下午3:30:15 
 *  
 */
public interface IActiveService {
	
	
	/**
	 * 根据ID 查询
	 * @parameter id
	 */
	public BannerDo getById(int id);
	
	/**
	 *根据条件查询列表
	 */
	public List<BannerDo> selectActive(Map<String,Object> parameterMap);
	
	/**
	 * 更新
	 */
	public int  updateActiveById(BannerDo newBannerDo);
	
	/**
	 * 新增
	 */
	public int addActive(BannerDo newBannerDo);
	
	/**
	 * 删除
	 */
	public int deleteById(int id);

}
