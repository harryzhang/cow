ALTER TABLE  `t_banner` 
   ADD COLUMN `bizType` INT NULL COMMENT '业务类型 1 = banner  2 = active' AFTER `status`;