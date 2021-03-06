
package com.redpack.dao.account;

import java.math.BigDecimal;

/**
 * 用户账户信息操作类
 * 通过用户ID 和账户类型type判断唯一用户
 */

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.redpack.common.account.model.BizUserAccountDo;
import com.redpack.common.account.model.UserAccountIncomeDo;
@Repository
public interface IBizUserAccountDao {

	/**
	 * 根据ID 查询
	 * @parameter id
	 */
	public BizUserAccountDo getById(Map<String,Object> map);
	
	/**
	 *根据条件查询用户列表
	 */
	public List<BizUserAccountDo> selectUserAccount(Map<String,Object> parameterMap);
	
	/**
	 * 更新
	 */
	public int  updateUserAccountById(BizUserAccountDo bizUserAccountDo);
	
	
	/**
	 * 更新用户账户信息
	 */
	public int  updateUserAmountById(BizUserAccountDo bizUserAccountDo);
	
	
	
	/**
	 * 新增用户账户信息
	 */
	public int addUserAccount(BizUserAccountDo bizUserAccountDo);
	
	public void giftTeamAmount(long refferId, BigDecimal amount);

	public List<BizUserAccountDo> selectNotFeiHongUserAccount(
			Map<String, Object> parameterMap);
	
	
	public List<BizUserAccountDo> selectFeiHongAccount(
			Map<String, Object> parameterMap);
	
	public int selectFeiHongAccountCount(Map<String, Object> parameterMap);

	public int selectNotFeiHongUserAccountCount(Map<String, Object> parameterMap);

	/**
	 * 备份帐户表
	 * @param date
	 */
	public void backupAccount(String backdate);

	/**
	 * 写分红临时表
	 * @param bizUserAccountDo
	 */
	public void insertFeiHongTemp(BizUserAccountDo bizUserAccountDo);

	public List<BizUserAccountDo> selectUserAccountFromTemp();

	public void deleteFeiHongTemp();
}
