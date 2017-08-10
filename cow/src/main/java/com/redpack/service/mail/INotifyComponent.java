package com.redpack.service.mail;


public interface INotifyComponent {
    /**
     * 发送短信和邮件接口
     * 
     * @param notifyDo 发送的内容用 notifyDo的实现类 SMSNotifyDo, MailNotifyDo
     */
    boolean send(NotifyDo notifyDo);

    
}
