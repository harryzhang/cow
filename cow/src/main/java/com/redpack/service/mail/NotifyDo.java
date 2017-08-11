package com.redpack.service.mail;

import java.io.Serializable;
import java.util.Date;

public class NotifyDo implements Serializable {
    private static final long serialVersionUID = 1L;


    private Long messageId;

    private String message;

    private String sender;

    private String recievers;

    private String ccList;

    private String subject;

    private String sendFlag;

    private String messageTemplate;

    private String messageType;


    private String isValidate;

    private Date createTime;

    private Date updateTime;

    private String sendId;

    private String businessType;

    /**
     * 是否异步
     */
    protected boolean async;
    
    public NotifyDo(String subject,String message, String recievers){
    	this.subject = subject;
    	this.message = message;
    	this.recievers = recievers;
    }

    /**
     * 如果指发送一个简单的消息，建议直接调用这个方法 这个方法会构造一个简单的JSON字符串，并以 content作为key 应用默认的消息模板
     */
    public void setSimpleMessage(String simpleMessge) {
        StringBuffer sb = new StringBuffer();
        sb.append("{\"content\":\"").append(simpleMessge).append("\"}");

        this.message = sb.toString();
    }

    /**
     * 是否发送成功
     * 
     * @return
     */
    public boolean isSend() {
        return "T".equals(getSendFlag());
    }

    /**
     * 是否有效
     * 
     * @return
     */
    public boolean isValidate() {
        return "T".equals(getIsValidate());
    }

    public Long getMessageId() {
        return messageId;
    }

    public void setMessageId(Long messageId) {
        this.messageId = messageId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getRecievers() {
        return recievers;
    }

    public void setRecievers(String recievers) {
        this.recievers = recievers;
    }

    public String getCcList() {
        return ccList;
    }

    public void setCcList(String ccList) {
        this.ccList = ccList;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getSendFlag() {
        return sendFlag;
    }

    public void setSendFlag(String sendFlag) {
        this.sendFlag = sendFlag;
    }

    public String getMessageTemplate() {
        return messageTemplate;
    }

    public void setMessageTemplate(String messageTemplate) {
        this.messageTemplate = messageTemplate;
    }

    public String getMessageType() {
        return messageType;
    }

    public void setMessageType(String messageType) {
        this.messageType = messageType;
    }


    public String getIsValidate() {
        return isValidate;
    }

    public void setIsValidate(String isValidate) {
        this.isValidate = isValidate;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getSendId() {
        return sendId;
    }

    public void setSendId(String sendId) {
        this.sendId = sendId;
    }

    public String getBusinessType() {
        return businessType;
    }

    public void setBusinessType(String businessType) {
        this.businessType = businessType;
    }

    public boolean isAsync() {
        return async;
    }

    public void setAsync(boolean async) {
        this.async = async;
    }
}