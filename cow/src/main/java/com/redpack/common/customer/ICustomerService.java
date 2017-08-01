package com.redpack.common.customer;

import java.util.List;

import com.redpack.common.base.result.IResult;
import com.redpack.common.wallet.model.WalletDo;

public interface ICustomerService {
	
	
	/**
	 * 给用户封号
	 * @param userId
	 * @return
	 */
	public IResult setUnvalidUser(Long userId);

	/**
	 * 封号用户用新增用户替换
	 * @param userId
	 * @param changeName
	 * @param changePhone
	 */
	public void resetUser(Long userId, String changeName,String changePhone);

	

}
