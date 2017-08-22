/**   
 * @Title: SendMail.java 
 * @Package com.hehenian.actions.user 
 * @Description: TODO(用一句话描述该文件做什么) 
 * @author zhangyunhmf
 * @date 2017年8月22日 下午1:13:15 
 * @version V1.0   
 */
package com.redpack.service.mail;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

/**
 * @ClassName: SendMail
 * @Description: TODO(这里用一句话描述这个类的作用)
 * 
 */
@Service("mailService")
public class MailService implements INotifyComponent{

	Logger logger = Logger.getLogger(MailService.class);
	
	private final static String mailUser="418403299@qq.com";
	private final static String mailPassword="gbjgqgjdfnefcbag";
	//private final static String host = "smtp.qq.com";
	private final static String host = "smtp.exmail.qq.com";
	
	private final static String port = "587";

	public boolean send(NotifyDo notifyDo) {

		boolean result = true;
		try {

			// 创建Properties 类用于记录邮箱的一些属性
			final Properties props = new Properties();
			// 表示SMTP发送邮件，必须进行身份验证
			props.put("mail.smtp.auth", "true");
			// 此处填写SMTP服务器
			props.put("mail.smtp.host", host);
			// 端口号，QQ邮箱给出了两个端口，但是另一个我一直使用不了，所以就给出这一个587
			props.put("mail.smtp.port", port);
			// 此处填写你的账号
			props.put("mail.user", mailUser);
			// 此处的密码就是前面说的16位STMP口令
			props.put("mail.password", mailPassword);
			props.put("mail.smtp.localhost", "127.0.0.1");

			// 构建授权信息，用于进行SMTP进行身份验证
			Authenticator authenticator = new Authenticator() {

				protected PasswordAuthentication getPasswordAuthentication() {
					// 用户名、密码
					String userName = mailUser;
					String password = mailPassword;
					return new PasswordAuthentication(userName, password);
				}
			};
			// 使用环境属性和授权信息，创建邮件会话
			Session mailSession = Session.getInstance(props, authenticator);
			// 创建邮件消息
			MimeMessage message = new MimeMessage(mailSession);
			// 设置发件人
			InternetAddress form = new InternetAddress(props.getProperty("mail.user"));
			message.setFrom(form);

			// 设置收件人的邮箱
			InternetAddress to = new InternetAddress(notifyDo.getRecievers());
			message.setRecipient(RecipientType.TO, to);

			// 设置邮件标题
			message.setSubject(notifyDo.getSubject());

			// 设置邮件的内容体
			message.setContent(notifyDo.getMessage(), "text/html;charset=UTF-8");

			// 最后当然就是发送邮件啦
			Transport.send(message);
		} catch (Exception e) {
			result = false;
			e.printStackTrace();
			logger.error(e);
		} finally {
			return result;
		}

	}
	
	public static void main(String[] args) {
		MailService m = new MailService();
		NotifyDo notifyDo = new NotifyDo("subj","test","zhangyunhmf@fansfinancial.com");
		m.send(notifyDo );
    }

}
