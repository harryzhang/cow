package com.redpack.common.news;

import java.util.List;
import java.util.Map;

import com.redpack.common.base.model.PageDo;
import com.redpack.common.base.result.IResult;
import com.redpack.common.news.model.LoanNewsDo;

/**
 * 常见问题
 * @author zhangcymf
 *
 */
public interface ILoanNewsService {

	/**
	 * 根据ID 查询
	 * 
	 * @parameter id
	 */
	LoanNewsDo getById(Long id);


    /**
     * 根据新闻类型、是否置顶、是否推荐查询新闻数据
     */
    List<LoanNewsDo> selectNews(String newsClassification,String strick,String recommend);
	/**
	 * 更新
	 */
	IResult<?> updateLoanNewsById(LoanNewsDo newLoanNewsDo);

	/**
	 * 新增
	 */
	IResult<?> addLoanNews(LoanNewsDo newLoanNewsDo);

	/**
	 * 删除
	 */
	IResult<?> deleteById(Long id);

	PageDo<LoanNewsDo> getNewsListPage(Map<String, Object> param, PageDo<LoanNewsDo> page);


    /**
     * 新闻列表接口
     * 返回状态为可用的新闻数据给前端
     * @param param
     * @param page
     * @return
     */
    PageDo<LoanNewsDo> getFrontNewsListPage(PageDo<LoanNewsDo> page);
    /**
     * 新闻列表接口
     * 返回状态为可用的新闻数据给前端
     * @param param
     * @param page
     * @return
     */
    LoanNewsDo getFrontNewsDetail(String id);

    
	/**
	 * 
	 * 查询最新的新闻
	 *
	 * zhangyunhmf
	 *
	 */
    public List<LoanNewsDo> getLastNews();
}
