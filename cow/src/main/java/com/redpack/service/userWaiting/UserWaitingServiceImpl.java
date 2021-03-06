package com.redpack.service.userWaiting;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.redpack.common.userWaiting.IUserWaitingService;
import com.redpack.common.userWaiting.model.UserWaitingDo;
import com.redpack.dao.userWaiting.IUserWaitingDao;



@Service("userWaitingService")
public class UserWaitingServiceImpl implements IUserWaitingService {

	private final Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired	
	private IUserWaitingDao userWaitingDao;

	@Override
	public void saveUserWaiting(UserWaitingDo userWaitingDo) {
		userWaitingDao.addUserWaiting(userWaitingDo);		
	}

	@Override
	public UserWaitingDo selectUserWaiting(Map<String,Object> parameterMap) {
		return null;
	}

	@Override
	public UserWaitingDo selectUserWaitingByGroupName(String groupName) {
		return userWaitingDao.selectUserWaitingByGroupName(groupName);
	}

	@Override
	public UserWaitingDo getByUserId(Long userId) {
		return userWaitingDao.getByUserId(userId);
	}

}
