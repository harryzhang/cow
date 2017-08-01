package com.redpacket.test;

import java.math.BigDecimal;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.redpack.common.account.IBizUserAccountService;
import com.redpack.common.account.model.UserDo;
import com.redpack.common.constant.WebConstants;
import com.redpack.common.order.IOrderService;
import com.redpack.dao.account.IUserDao;

public class TeamAmountTest extends BaseTestCase {

	@Autowired
	private IUserDao userDao;
	@Autowired
	public IOrderService orderService;
	@Autowired
	IBizUserAccountService bizUserAccountService;
	
	@Test
	public void testJob(){
		
		List<UserDo> userList = userDao.getAllUser(null);
		for (UserDo userDo : userList) {
			long refferId = userDo.getReferrerId();
			BigDecimal amount = bizUserAccountService.getAccountTypeAmount(WebConstants.SECURITY_ACCOUNT, userDo.getId());
			orderService.giftTeamAmount(refferId,amount.multiply(new BigDecimal("10")));
		}
	
	}
	
	
	
	
}
