package com.redpack.service.news;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.redpack.common.base.constant.Constants;
import com.redpack.common.base.model.PageDo;
import com.redpack.common.base.result.IResult;
import com.redpack.common.base.result.ResultSupport;
import com.redpack.common.news.ILoanNewsService;
import com.redpack.common.news.model.LoanNewsDo;
import com.redpack.dao.news.ILoanNewsDao;

@Service("loanNewsService")
public class LoanNewsServiceImpl implements ILoanNewsService {

	private final Logger logger = Logger.getLogger(this.getClass());

	@Resource
	private ILoanNewsDao loanNewsDao;

//    @Value("#{sysconfig['show.img.url']}")
//    private String imgAccessUrl ;


    /**
	 * 根据ID 查询
	 * 
	 * @parameter id
	 */
	@Override
	public LoanNewsDo getById(Long id) {
        return loanNewsDao.getById(id);
       
	}

    @Override
    public List<LoanNewsDo> selectNews(String newsClassification,String strick,String recommend) {
        Map<String, Object> param = new HashMap<String, Object>();
        if (StringUtils.isNotBlank(newsClassification)) {
            param.put("newsClassification", newsClassification);
        }
        if (StringUtils.isNotBlank(strick)) {
            param.put("strick", strick);
        }
        if (StringUtils.isNotBlank(recommend)) {
            param.put("recommend", recommend);
        }
        //默认只显示启用状态的新闻
        String newsState = "1";
        param.put("newsState", newsState);

        return loanNewsDao.selecteNews(param);
        
    }


    /**
	 * 更新
	 */
	@Override
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public IResult<?> updateLoanNewsById(LoanNewsDo newLoanNewsDo) {
		logger.debug("updateLoanNews(LoanNewsDo: " + newLoanNewsDo);
		int i = loanNewsDao.updateLoanNewsById(newLoanNewsDo);
		if (i < 1) {
			return ResultSupport.buildResult(1, newLoanNewsDo + "更新失败");
		}
		IResult<Integer> result = ResultSupport.buildResult(0);
		result.setModel(Integer.valueOf(i));
		return result;
	}

	/**
	 * 新增
	 */
	@Override
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public IResult<?> addLoanNews(LoanNewsDo newLoanNewsDo) {
		logger.debug("addLoanNews: " + newLoanNewsDo);
		int i = loanNewsDao.addLoanNews(newLoanNewsDo);
		if (i < 1) {
			return ResultSupport.buildResult(1, newLoanNewsDo + "新增失败");
		}
		IResult<Integer> result = ResultSupport.buildResult(0);
		result.setModel(Integer.valueOf(i));
		return result;
	}

	/**
	 * 删除
	 */
	@Override
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public IResult<?> deleteById(Long id) {
		logger.debug("deleteByIdLoanNews:" + id);
		int i = loanNewsDao.deleteById(id);
		if (i < 1) {
			return ResultSupport.buildResult(1, id + "删除失败");
		}
		IResult<Integer> result = ResultSupport.buildResult(0);
		result.setModel(Integer.valueOf(i));
		return result;
	}

	@Override
	public PageDo<LoanNewsDo> getNewsListPage(Map<String, Object> param, PageDo<LoanNewsDo> page) {
		param.put(Constants.MYBATIS_PAGE, page);
		List<LoanNewsDo> list = loanNewsDao.getNewsListByPage(param);      
        page.setModelList(list);
		return page;
	}

	/**
	 * 
	 * 查询最新的新闻
	 *
	 * zhangyunhmf
	 *
	 */
	@Override
    public List<LoanNewsDo> getLastNews() {
        return loanNewsDao.getLastNews();
    }
	
	
    @Override
    public PageDo<LoanNewsDo> getFrontNewsListPage(PageDo<LoanNewsDo> page) {
	    Map<String,Object> param = new HashMap<String,Object>();
	    param.put("newsState",1);
        param.put(Constants.MYBATIS_PAGE, page);
        List<LoanNewsDo> list = loanNewsDao.getNewsListByPage(param);
        
        page.setModelList(list);
        return page;
    }

    @Override
    public LoanNewsDo getFrontNewsDetail(String id) {
        return this.getById(Long.valueOf(id));
    }

}
