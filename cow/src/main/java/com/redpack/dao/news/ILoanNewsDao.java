package com.redpack.dao.news;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.redpack.common.news.model.LoanNewsDo;


/**
 * 
 * @author zhangcymf
 *
 */
@Repository
 public interface ILoanNewsDao {

	/**
	 * 根据ID 查询
	 * 
	 * @parameter id
	 */
	 LoanNewsDo getById(Long id);

    /**
     * 按条件查询新闻数据
     * @param parameterMap
     * @return
     */
	 List<LoanNewsDo> selecteNews(Map<String, Object> parameterMap);


	/**
	 * 更新
	 */
	 int updateLoanNewsById(LoanNewsDo newLoanNewsDo);

	/**
	 * 新增
	 */
	 int addLoanNews(LoanNewsDo newLoanNewsDo);

	/**
	 * 删除
	 */
	 int deleteById(Long id);

	/**
	 * 翻页查询
	 * @param param
	 * @return
	 */
	 List<LoanNewsDo> getNewsListByPage(Map<String, Object> param);

	/**
	 * 翻页查询
	 * @param param
	 * @return
	 */
	 LoanNewsDo getNewsDetail(Map<String, Object> param);

	/**
	 * 
	 * 查询最后的新闻
	 * zhangyunhmf
	 *
	 */
    List<LoanNewsDo> getLastNews();

}
