package com.redpack.common.news;

import java.io.Serializable;
import java.util.Date;

import com.redpack.common.util.DateUtil;


/**
 * 新闻
 * @author zhangcymf
 *
 */
public class LoanNewsDo implements Serializable{
	
	private static final long serialVersionUID = -4070077610908738395L;
	private Long id;
	private String newsTitle;
	private Integer newsClassification;  //新闻分类
	private Integer newsState;
	private String newsContent;
	private Date createTime;
	private Date updateTime;

    private Integer strick;     //置顶
    private Integer recommend;  //推荐
    private String origin;      //来源


    private String bSummaryImgUrl; //新闻或百科标题的图片访问的url(大图)
	private String bSummaryImgPath; //新闻或百科标题的图片在服务器上保存的路径（大图）

    private String mSummaryImgUrl; //新闻或百科标题的图片访问的url(中图)
    private String mSummaryImgPath; //新闻或百科标题的图片在服务器上保存的路径（中图）

    private String sSummaryImgUrl; //新闻或百科标题的图片访问的url(小图)
    private String sSummaryImgPath; //新闻或百科标题的图片在服务器上保存的路径（小图）

	private String summary;   //摘要

	private Integer sortPosition;//排序位置

    public Integer getStrick() {
        return strick;
    }

    public void setStrick(Integer strick) {
        this.strick = strick;
    }

    public Integer getRecommend() {
        return recommend;
    }

    public void setRecommend(Integer recommend) {
        this.recommend = recommend;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }


	public Integer getSortPosition() {
		return sortPosition;
	}

	public void setSortPosition(Integer sortPosition) {
		this.sortPosition = sortPosition;
	}

    public String getbSummaryImgUrl() {
        return bSummaryImgUrl;
    }

    public void setbSummaryImgUrl(String bSummaryImgUrl) {
        this.bSummaryImgUrl = bSummaryImgUrl;
    }

    public String getbSummaryImgPath() {
        return bSummaryImgPath;
    }

    public void setbSummaryImgPath(String bSummaryImgPath) {
        this.bSummaryImgPath = bSummaryImgPath;
    }

    public String getmSummaryImgUrl() {
        return mSummaryImgUrl;
    }

    public void setmSummaryImgUrl(String mSummaryImgUrl) {
        this.mSummaryImgUrl = mSummaryImgUrl;
    }

    public String getmSummaryImgPath() {
        return mSummaryImgPath;
    }

    public void setmSummaryImgPath(String mSummaryImgPath) {
        this.mSummaryImgPath = mSummaryImgPath;
    }

    public String getsSummaryImgUrl() {
        return sSummaryImgUrl;
    }

    public void setsSummaryImgUrl(String sSummaryImgUrl) {
        this.sSummaryImgUrl = sSummaryImgUrl;
    }

    public String getsSummaryImgPath() {
        return sSummaryImgPath;
    }

    public void setsSummaryImgPath(String sSummaryImgPath) {
        this.sSummaryImgPath = sSummaryImgPath;
    }

    //columns END
	public Long getId() {
		return this.id;
	}

	public void setId(Long value) {
		this.id = value;
	}
	public String getNewsTitle() {
		return this.newsTitle;
	}

	public void setNewsTitle(String value) {
		this.newsTitle = value;
	}
	public Integer getNewsClassification() {
		return this.newsClassification;
	}

	public void setNewsClassification(Integer value) {
		this.newsClassification = value;
	}
	public Integer getNewsState() {
		return this.newsState;
	}

	public void setNewsState(Integer value) {
		this.newsState = value;
	}
	public String getNewsContent() {
		return this.newsContent;
	}

	public void setNewsContent(String value) {
		this.newsContent = value;
	}
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date value) {
		this.createTime = value;
		this.getFormatCreateTime();
	}
	public Date getUpdateTime() {
		return this.updateTime;
	}
	
	public void setUpdateTime(Date value) {
		this.updateTime = value;
	}


	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getFormatCreateTime(){
		if(null == this.createTime){
			return "";
		}
		return DateUtil.formatDate(this.createTime);
	}
	
}

