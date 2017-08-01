package com.redpack.service.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.redpack.common.notice.INoticeService;
import com.redpack.dao.order.IOrderDao;

@Service("noticeService")
public class NoticeServiceImpl implements INoticeService {

	@Autowired
    private IOrderDao  orderDao;
	
	@Override
	public List<Map<String, Object>>  queryNotice() {
		return orderDao.queryNotice();
	}
	
	@Override
	public List<Map<String, Object>> queryNoticeById(String Id) {
		return orderDao.queryNoticeById(Id);
	}

}
