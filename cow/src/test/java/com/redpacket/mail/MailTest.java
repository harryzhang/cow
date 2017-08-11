/**   
* @Title: MailTest.java 
* @Package com.redpacket.mail 
* @Description: TODO(用一句话描述该文件做什么) 
* @author zhangyunhmf
* @date 2017年8月11日 上午8:37:20 
* @version V1.0   
*/
package com.redpacket.mail;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.redpack.service.mail.INotifyComponent;
import com.redpack.service.mail.NotifyDo;
import com.redpacket.test.BaseTestCase;

public class MailTest extends BaseTestCase {

	
	@Autowired
	INotifyComponent  mailService;
	
	int i = 0;
	
	@Test
	public void sendMailTest(){
		
		NotifyDo notifyDo = new NotifyDo("test","This is test !","418403299@qq.com");
		mailService.send(notifyDo);
		
	}
	
	
}
