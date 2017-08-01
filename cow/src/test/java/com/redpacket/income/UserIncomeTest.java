package com.redpacket.income;

import java.util.Date;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.redpack.common.huilv.IHuilvService;
import com.redpack.common.income.IIncomeSevice;
import com.redpack.common.util.DateUtil;
import com.redpacket.test.BaseTestCase;

public class UserIncomeTest extends BaseTestCase {

	

	@Autowired
	private IIncomeSevice incomeSevice;
	
	@Test
	public void testJob(){
		Date now = new Date();
		now = DateUtil.dateAddDay(now, -1);
		//incomeSevice.execIncome(now);
	}
	
	
	
	
}
