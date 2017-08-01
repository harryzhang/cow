/*
 * Powered By zhangyunhua
 * Web Site:  
 * Since 2008 - 2015
 */

package com.redpack.common.account;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.redpack.common.account.model.BizUserAccountDo;
import com.redpack.common.account.model.UserDo;
import com.redpack.common.constant.AccountMsg;
import com.redpack.common.withdraw.model.WithdrawDo;



/**
 * 手工分红
 * @author harry
 *
 */
public interface IFeiHongService {  

	
	///////////////////////////分红////////////////////////////	
	
	public int selectFeiHongUserAccountCount(Map<String, Object> parameterMap);
	
	public List<BizUserAccountDo> selectFeiHongUserAccount(Map<String, Object> parameterMap);
		
    ///////////////////////////end 分红////////////////////////////

	

	


}
