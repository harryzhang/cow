package com.redpack.common.income;

import java.util.List;

import com.redpack.common.account.model.BizUserAccountDo;

public interface IIncomeSevice {

	void calculateIncome(List<BizUserAccountDo> userAccountLst,int taskId,IIncomeTotalService totalService);

}
