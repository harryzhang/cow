package com.redpack.service.mail;

import java.util.Date;
import java.util.Properties;

import javax.mail.internet.MimeMessage;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

/**
 * 邮件发送 <br/>
 * xml配置
 * 
 * @author wanglfmf
 * @date 2017年5月3日
 */
public class MailNotifyComponentImpl implements INotifyComponent {
	
    private final Logger logger = Logger.getLogger(this.getClass());
    
    private JavaMailSenderImpl mailSender;

    @Override
    public boolean send(NotifyDo message) {
        try {
            final MimeMessage msg = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(msg, true, "UTF-8");
            helper.setFrom(mailSender.getUsername(), "互联网金融-融资产品部"); // 发件人
            helper.setTo(getRecievers(message.getRecievers())); // 收件人
            helper.setSubject(message.getSubject());// 主题
            helper.setSentDate(new Date()); // 发送日期
            if (StringUtils.isNotBlank(message.getCcList()) && !"null".equals(message.getCcList())) {
                helper.setCc(getRecievers(message.getCcList()));// 抄送人
            }

            String htmlText = getMessage(message);
            helper.setText(htmlText, true);
			
			// 这里直接对发送邮件的配置项进行赋值，不读取配置文件，然后查看一下发送邮件是否成功！
			mailSender.setHost("smtp.fansfinancial.com");
			mailSender.setUsername("cfb-rz-it-support@fansfinancial.com");
			mailSender.setPassword("mfhyn@12345");
			mailSender.setPort(25);
			
			
			Properties javaMailProperties = new Properties();
			javaMailProperties.put("mail.smtp.auth", "true");      
			javaMailProperties.put("mail.smtp.timeout", "25000");      
			javaMailProperties.put("mail.smtp.starttls.enable","true");
			mailSender.setJavaMailProperties(javaMailProperties);
			
			logger.info("发送邮件的配置信息为："+mailSender);
			logger.info("发送邮件的配置中host为："+mailSender.getHost()+",用户名为："+mailSender.getUsername()
					+",密码为："+mailSender.getPassword()+",端口号为："+mailSender.getPort()
					+",权限配置为："+mailSender.getJavaMailProperties());
			
            // 发送
            mailSender.send(msg);

            return true;
        } catch (Exception e) {
            logger.error("邮件发送失败", e);
        }
        return false;
    }

    /**
     * 多个收件人时，拆分成数组
     * 
     * @param str
     * @return
     */
    private String[] getRecievers(String str) {
        String regex = ";";
        if (str.contains(",")) {
            regex = ",";
        }
        return str.split(regex);
    }

    public void setMailSender(JavaMailSenderImpl mailSender) {
        this.mailSender = mailSender;
    }

    protected String getDefaultTemplate() {
        return "mail_template_default.ftl";
    }
    
    
    protected String getMessageType() {
    	return NotifyDo.MAIL;
    }
}
