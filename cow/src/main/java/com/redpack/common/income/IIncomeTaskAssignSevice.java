package com.redpack.common.income;

import java.util.Date;
import java.util.List;

import com.redpack.common.account.model.BizUserAccountDo;

public interface IIncomeTaskAssignSevice {

	/**
	 * 执行分红
	 * @param now
	 */
	void execIncome(Date now);

	void execIncomeNotFeiHong(Date jobDay);
	

}
