/**   
* @Title: ActiveServiceImpl.java 
* @Package com.redpack.service.active 
* @Description: TODO(用一句话描述该文件做什么) 
* @author zhangyunhmf
* @date 2017年11月22日 下午5:56:19 
* @version V1.0   
*/
package com.redpack.service.active;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.redpack.common.active.IActiveService;
import com.redpack.common.basedata.model.BannerDo;
import com.redpack.dao.basedata.IBannerDao;

/** 
 * @ClassName: ActiveServiceImpl 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 * @author zhangyunhmf
 * @date 2017年11月22日 下午5:56:19 
 *  
 */
@Repository("activeService")
public class ActiveServiceImpl implements IActiveService {
	
	@Resource
	private IBannerDao bannerDao;

	/**
	 * 
	 *
	 * zhangyunhmf
	 *
	 * @see com.redpack.common.active.IActiveService#getById(int)
	 *
	 */
    @Override
    public BannerDo getById(int id) {	    
	    return bannerDao.getById(id);
    }

	/**
	 * 
	 *
	 * zhangyunhmf
	 *
	 * @see com.redpack.common.active.IActiveService#selectActive(java.util.Map)
	 *
	 */
    @Override
    public List<BannerDo> selectActive(Map<String, Object> parameterMap) {
	    return bannerDao.selectBanner(parameterMap);
    }

	/**
	 * 
	 *
	 * zhangyunhmf
	 *
	 * @see com.redpack.common.active.IActiveService#updateActiveById(com.redpack.common.basedata.model.BannerDo)
	 *
	 */
    @Override
    public int updateActiveById(BannerDo newBannerDo) {
	    return bannerDao.updateBannerById(newBannerDo);
    }

	/**
	 * 
	 *
	 * zhangyunhmf
	 *
	 * @see com.redpack.common.active.IActiveService#addActive(com.redpack.common.basedata.model.BannerDo)
	 *
	 */
    @Override
    public int addActive(BannerDo newBannerDo) {
	    return bannerDao.addBanner(newBannerDo);
    }

	/**
	 * 
	 *
	 * zhangyunhmf
	 *
	 * @see com.redpack.common.active.IActiveService#deleteById(int)
	 *
	 */
    @Override
    public int deleteById(int id) {
	   return bannerDao.deleteById(id);
    }

}
