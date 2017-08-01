package com.redpack.service.account;

import com.redpack.common.account.model.UserDo;
import com.redpack.common.grade.model.GroupUserDo;

/**
 * 打款逻辑
 * @author harry
 *
 */
public interface IMoneyMsg {
	
	public void processMoney(UserDo uer, GroupUserDo groupUser);

}
