CREATE TABLE `t_share_pay` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL COMMENT '�������û�id',
  `realName` varchar(60) DEFAULT NULL COMMENT '����',
  `wx` varchar(50) DEFAULT NULL COMMENT '΢���˺�',
  `zfb` varchar(50) DEFAULT NULL COMMENT '֧�����˺�',
  `status` int(11) DEFAULT NULL COMMENT '״̬1= ���ԣ� 0= ������',
  `remark` varchar(100) DEFAULT NULL COMMENT '��ע',
  `createTime` datetime DEFAULT NULL COMMENT '��������',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8