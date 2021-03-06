
/**  
 * @Project: deposit-biz-common
 * @Package com.hehenian.deposit.common.account
 * @Title: IUserService.java
 * @Description: TODO
 * @author:  zhangyunhua
 * @date 2015年3月5日 上午10:46:01
 * @Copyright: HEHENIAN Co.,Ltd. All rights reserved.
 * @version V1.0  
 */
package com.redpack.common.account;

import java.util.List;
import java.util.Map;

import com.redpack.common.account.model.ApplyAgentDo;
import com.redpack.common.account.model.UserDo;
import com.redpack.common.base.result.IResult;
import com.redpack.common.grade.model.GroupDo;

/**
 * 
 * @author:  zhangyunhua
 * @date 2015年3月5日 上午10:46:01
 */
public interface IUserService {

    /**
     * 根据ID查询用户对象
     * 
     * @param id
     * @return
     * @author:  zhangyunhua
     * @date: 2015年3月5日上午10:49:36
     */
    UserDo getById(Long id);

    /**
     * 保存用户
     * @param userDo
     * @return
     */
    IResult<Long> saveUser(UserDo userDo);

    /**
     * 登录调用
     * @param loginInfo  登录手机号
     * @return
     */
	UserDo getByLoginInfo(String loginInfo);

	/**
	 * 根据条件查询userDo
	 * @param parameterMap
	 * @return
	 */
	UserDo getByUserDo(Map<String, Object> parameterMap);
	
	/**
	 * 获取指定层数的上级
	 * @param currentUserId
	 * @param levelNum
	 * @return
	 */
	public UserDo getAllParent(long userId, int levelNum);

	/**
	 * 递归查询所有上级
	 */
	public  void getAllParent(UserDo currentUser);

	/**
	 * 获取指定层数的上级
	 * @param currentUserId
	 * @param levelNum
	 * @return
	 */
	public  void getAllParent(UserDo currentUser, int levelNum);
	
	/**
	 * 获取所有用正式用户
	 * @param userName
	 * @return
	 */
	public  List<UserDo> getAllUser(Map paramMap);
	

	/**
	 * 获取上级
	 * @param currentUserId
	 * @return
	 */
	public  UserDo getParent(long currentUserId);

	/**
	 * 根据当前用户ID ,查询他的所有下级， 放到当前对象的 childList属性里， 递归查询到最后一级
	 * @param userId
	 * @return
	 */
	public  void getAllChildren(UserDo currentUser);

	/**
	 * 获取第一层下级
	 */
	public  List<UserDo> getChildList(long userId);

	/**
	 * 据当前用户ID ,查询他的下级的下级， 直到没有下级， 放到当前对象的 childList属性里，
	 * @param userId
	 * @return
	 */
	public  UserDo getUserAndAllChild(long userId);

	/**
	 * 根据当前用户ID ,查询他的第一层下级， 放到当前对象的 childList属性里，
	 * @param userId
	 * @return
	 */
	public  UserDo getUserAndChild(long userId);

	/**
	 * 根据父ID查询第一层下级
	 * @param parentId
	 * @return
	 */
	public  List<UserDo> selectChildByParentId(Long parentId);

	/**
	 * 更新当前等级
	 * @param userid
	 * @param afterUpgrade
	 */
	int updateUserGradeById(Long userid, Integer afterUpgrade);

	/**
	 * @Description 用户保存方法
	 * @author huangzl QQ: 272950754
	 * @date 2015-8-7 下午09:55:59
	 * @Project redpack-common
	 * @Package com.redpack.common.account
	 * @File IUserService.java
	 * @param tempSave
	 * @return
	*/
	int updateUser(UserDo tempSave);
	

	/**
	 * 根据Map条件查询用户
	 * @param queryMap
	 * @return
	 */
	List<UserDo> selectUser(Map<String, Object> queryMap);


	/**
	 * 根据用户ID 获取他的推荐总人数
	 * @param id 用户id
	 * @return
	 */
	int getRefUserCount(Long id);

	/**
	 * 查询当前用户团队临时会员数量
	 * @param userId 当前用户id
	 * @return
	 */
	int getTempMemberCount(long userId);

	/**
	 * 获取用户组的所有用户
	 * @param groupName
	 * @return
	 */
	public  List<UserDo> getAllGroupUser(Map paramMap);
	
	/**
	 * 相互交换位置
	 * @param user1Mobile
	 * @param user2Mobile
	 */
	public void exchangeEachOther(String user1Mobile, String user2Mobile);
	
	/**
	 * 移到空位
	 */
	public void moveSort(String user1Mobile,Integer level, Long position,String groupName);
	
	List<Map<String, Object>> listRef(Map<String, Object> queryMap);

	/**
	 * 保存代理申请
	 * @param agentDo
	 * @return
	 */
	IResult<Long> saveApplyAgent(ApplyAgentDo agentDo);

	List<Map<String,Object>> getApplyAgentUser(Map<String, Object> paraMap);

	/**
	 * 保存审批记录
	 * @param agentDo
	 * @return
	 */
	IResult<Long> updateApplyAgent(ApplyAgentDo agentDo);

	/**
	 * 记录登录日期
	 * @param id
	 */
	void saveLoginlog(Long userId,String actionType);

	/**
	 * 维护激活码和账号的关系
	 * @param regUUID
	 * @param phoneNo
	 * @param action
	 */
	void saveActCode(String regUUID, String phoneNo, String action);

	/**
	 * 根据激活码激活账号
	 * @param actCode 激活码
	 * @param action  动作 reg, getpassword
	 *
	 */
    String actAccountByMail(String actCode,String action);
    /**
     * 根据激活码获取用户
     * @param actCode
     * @return
     */
	UserDo getUserByActCode(String actCode);
	
	
}
