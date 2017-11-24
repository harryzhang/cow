CREATE TABLE `t_share_pay` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL COMMENT '贡献者用户id',
  `realName` varchar(60) DEFAULT NULL COMMENT '姓名',
  `wx` varchar(50) DEFAULT NULL COMMENT '微信账号',
  `zfb` varchar(50) DEFAULT NULL COMMENT '支付宝账号',
  `status` int(11) DEFAULT NULL COMMENT '状态1= 可以， 0= 不可用',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `createTime` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8