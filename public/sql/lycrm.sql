DROP TABLE IF EXISTS `lycrm_admin_access`;
CREATE TABLE `lycrm_admin_access` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `lycrm_admin_access` VALUES ('1', '1');

DROP TABLE IF EXISTS `lycrm_admin_action_log`;
CREATE TABLE `lycrm_admin_action_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL COMMENT '������ID',
  `module_name` varchar(50) NOT NULL COMMENT 'ģ��',
  `controller_name` varchar(50) NOT NULL COMMENT '������',
  `action_name` varchar(50) NOT NULL COMMENT '����',
  `action_id` int(10) NOT NULL COMMENT '����ID',
  `action_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1Ϊɾ������',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '��������',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  `join_user_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '������IDs',
  `structure_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '���Ͳ���IDs',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������¼��';

DROP TABLE IF EXISTS `lycrm_admin_action_record`;
CREATE TABLE `lycrm_admin_action_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL COMMENT '�û�ID',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  `types` varchar(20) NOT NULL COMMENT '����',
  `action_id` int(11) NOT NULL COMMENT '����ID',
  `content` text COMMENT '����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ֶβ�����¼��';

DROP TABLE IF EXISTS `lycrm_admin_comment`;
CREATE TABLE `lycrm_admin_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '���۱�',
  `user_id` int(11) NOT NULL COMMENT '������ID',
  `content` varchar(1000) NOT NULL COMMENT '����(��)',
  `reply_content` varchar(1000) NOT NULL DEFAULT '' COMMENT '�ظ����ݣ����⣩',
  `create_time` int(11) NOT NULL COMMENT '�½�ʱ��',
  `isreply` tinyint(2) DEFAULT '0' COMMENT '�Ƿ��ǻظ� 1 �� 0 ��',
  `reply_user_id` int(11) NOT NULL DEFAULT '0',
  `reply_id` int(11) DEFAULT '0' COMMENT '�ظ�����ID',
  `status` tinyint(2) DEFAULT '1' COMMENT '״̬ ',
  `type_id` int(11) DEFAULT '0' COMMENT '������Ŀ����ID ����������ģ��ID',
  `favour` int(7) DEFAULT '0' COMMENT '��',
  `type` varchar(50) NOT NULL DEFAULT '' COMMENT '���� ',
  `reply_fid` int(11) NOT NULL DEFAULT '0' COMMENT '�ظ����ϼ�ID',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='�������۱�';

DROP TABLE IF EXISTS `lycrm_admin_config`;
CREATE TABLE `lycrm_admin_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '����',
  `status` tinyint(2) NOT NULL COMMENT '״̬',
  `module` varchar(50) NOT NULL COMMENT 'ģ��',
  `controller` varchar(50) NOT NULL COMMENT '������',
  `type` tinyint(2) NOT NULL COMMENT '����',
  `typestatus` tinyint(2) NOT NULL COMMENT '������״̬',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `lycrm_admin_examine_flow`;
CREATE TABLE `lycrm_admin_examine_flow` (
  `flow_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '����������',
  `config` tinyint(4) NOT NULL COMMENT '1�̶�����0��Ȩ����',
  `types` varchar(50) NOT NULL COMMENT '��������',
  `types_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '����ID������������ID��',
  `structure_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '����ID��0Ϊȫ����',
  `user_ids` varchar(500) NOT NULL DEFAULT '' COMMENT 'Ա��ID',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT '����˵��',
  `update_user_id` int(11) NOT NULL COMMENT '�޸���ID',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  `update_time` int(11) NOT NULL COMMENT '����ʱ��',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '״̬ 1���ã�0����',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '״̬ 1ɾ��',
  `delete_time` int(11) NOT NULL DEFAULT '0' COMMENT 'ɾ��ʱ��',
  `delete_user_id` int(11) NOT NULL  DEFAULT '0' COMMENT 'ɾ����ID',
  PRIMARY KEY (`flow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='�������̱�';

INSERT INTO `lycrm_admin_examine_flow` VALUES ('1', '��ͨ��������', '0', 'oa_examine', '1', '', '', '', '1', '1548835446', '1548835446', '1', '0', '0', '0');
INSERT INTO `lycrm_admin_examine_flow` VALUES ('2', '�����������', '0', 'oa_examine', '2', '', '', '', '1', '1548835717', '1548835717', '1', '0', '0', '0');
INSERT INTO `lycrm_admin_examine_flow` VALUES ('3', '������������', '0', 'oa_examine', '3', '', '', '', '1', '1549959653', '1549959653', '1', '0', '0', '0');
INSERT INTO `lycrm_admin_examine_flow` VALUES ('4', '�Ӱ���������', '0', 'oa_examine', '4', '', '', '', '1', '1549959653', '1549959653', '1', '0', '0', '0');
INSERT INTO `lycrm_admin_examine_flow` VALUES ('5', '������������', '0', 'oa_examine', '5', '', '', '', '1', '1549959653', '1549959653', '1', '0', '0', '0');
INSERT INTO `lycrm_admin_examine_flow` VALUES ('6', '�����������', '0', 'oa_examine', '6', '', '', '', '1', '1549959653', '1549959653', '1', '0', '0', '0');
INSERT INTO `lycrm_admin_examine_flow` VALUES ('7', '��ͬ��������', '0', 'crm_contract', '0', '', '', '', '1', '1549959653', '1549959653', '1', '0', '0', '0');
INSERT INTO `lycrm_admin_examine_flow` VALUES ('8', '�ؿ���������', '0', 'crm_receivables', '0', '', '', '', '1', '1549959653', '1549959653', '1', '0', '0', '0');

DROP TABLE IF EXISTS `lycrm_admin_examine_record`;
CREATE TABLE `lycrm_admin_examine_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `types` varchar(50) NOT NULL DEFAULT '' COMMENT '����',
  `types_id` int(11) NOT NULL DEFAULT '0' COMMENT '����ID',
  `flow_id` int(11) NOT NULL DEFAULT '0' COMMENT '��������ID',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '��������ID',
  `check_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '������ID',
  `check_time` int(11) NOT NULL COMMENT '����ʱ��',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1���ͨ��0���ʧ��2����',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '������',
  `is_end` tinyint(1) NOT NULL DEFAULT '0' COMMENT '����ʧЧ��1���Ϊ��Ч��',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������¼��';

DROP TABLE IF EXISTS `lycrm_admin_examine_step`;
CREATE TABLE `lycrm_admin_examine_step` (
  `step_id` int(11) NOT NULL AUTO_INCREMENT,
  `flow_id` int(11) NOT NULL COMMENT '��������ID',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1���������ܣ�2ָ���û�������һ�ˣ���3ָ���û������˻�ǩ����4��һ������������',
  `user_id` varchar(500) NOT NULL DEFAULT '' COMMENT '������ID (ʹ�ö��Ÿ���) ,1,2,',
  `order_id` tinyint(4) NOT NULL DEFAULT '1' COMMENT '����ID',
  `relation` tinyint(1) NOT NULL DEFAULT '1' COMMENT '�������̹�ϵ��1��2��',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`step_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���������';

DROP TABLE IF EXISTS `lycrm_admin_field`;
CREATE TABLE `lycrm_admin_field` (
  `field_id` int(11) NOT NULL AUTO_INCREMENT,
  `types` varchar(30) NOT NULL DEFAULT '' COMMENT '����',
  `types_id` int(11) NOT NULL DEFAULT '0' COMMENT '����ID�������ȣ�',
  `field` varchar(50) NOT NULL COMMENT '�ֶ���',
  `name` varchar(50) NOT NULL COMMENT '��ʶ��',
  `form_type` varchar(20) NOT NULL COMMENT '�ֶ�����',
  `default_value` varchar(255) NOT NULL DEFAULT '' COMMENT 'Ĭ��ֵ',
  `max_length` int(4) NOT NULL DEFAULT '0' COMMENT ' ��������',
  `is_unique` tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�Ψһ��1�ǣ�0��',
  `is_null` tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ���1�ǣ�0��',
  `input_tips` varchar(100) NOT NULL DEFAULT '' COMMENT '������ʾ',
  `setting` text COMMENT '����',
  `order_id` int(4) NOT NULL DEFAULT '0' COMMENT '����ID',
  `operating` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0��ɾ��1�ģ�2ɾ��3��',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  `update_time` int(11) NOT NULL COMMENT '����ʱ��',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT 'н�ʹ��� 1�̶� 2���� 3����',
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COMMENT='�Զ����ֶα�';

INSERT INTO `lycrm_admin_field` VALUES ('1', '', '0', 'create_user_id', '������', 'user', '', '0', '0', '0', '', '', '99', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('2', '', '0', 'update_time', '����ʱ��', 'datetime', '', '0', '0', '0', '', '', '100', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('3', '', '0', 'create_time', '����ʱ��', 'datetime', '', '0', '0', '0', '', '', '101', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('4', '', '0', 'owner_user_id', '������', 'user', '', '0', '0', '0', '', '', '102', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('5', 'crm_leads', '0', 'name', '��������', 'text', '', '0', '1', '1', '', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('6', 'crm_leads', '0', 'source', '������Դ', 'select', '', '0', '0', '0', '', '�����\n��������\n���\nת����\n����ע��\n����ѯ��\nԤԼ����\nİ��\n������Դ\n��˾��Դ\nչ����Դ\n������Դ\n�绰��ѯ\n�ʼ���ѯ', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('7', 'crm_leads', '0', 'telephone', '�绰', 'text', '', '0', '0', '0', '', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('8', 'crm_leads', '0', 'mobile', '�ֻ�', 'mobile', '', '0', '1', '0', '', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('9', 'crm_leads', '0', 'industry', '�ͻ���ҵ', 'select', '', '0', '0', '0', '', 'IT/ͨ��/����/������\n����ҵ\n���ز�\n��ҵ����\nó��\n����\n����/����\n����ҵ\n�Ļ���ý\n����\n����', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('10', 'crm_leads', '0', 'level', '�ͻ�����', 'select', '', '0', '0', '0', '', 'A���ص�ͻ���\nB����ͨ�ͻ���\nC�������ȿͻ���', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('11', 'crm_leads', '0', 'detail_address', '��ַ', 'text', '', '0', '0', '0', '', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('12', 'crm_leads', '0', 'next_time', '�´���ϵʱ��', 'datetime', '', '0', '0', '0', '', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('13', 'crm_leads', '0', 'remark', '��ע', 'textarea', '', '0', '0', '0', '', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('14', 'crm_customer', '0', 'name', '�ͻ�����', 'text', '', '0', '1', '1', '', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('15', 'crm_customer', '0', 'level', '�ͻ�����', 'select', '', '0', '0', '0', '', 'A���ص�ͻ���\nB����ͨ�ͻ���\nC�������ȿͻ���', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('16', 'crm_customer', '0', 'industry', '�ͻ���ҵ', 'select', '', '0', '0', '0', '', 'IT/ͨ��/����/������\n����ҵ\n���ز�\n��ҵ����\nó��\n����\n����/����\n����ҵ\n�Ļ���ý\n����\n����', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('17', 'crm_customer', '0', 'source', '�ͻ���Դ', 'select', '', '0', '0', '0', '', '�����\n��������\n���\nת����\n����ע��\n����ѯ��\nԤԼ����\nİ��\n������Դ\n��˾��Դ\nչ����Դ\n������Դ\n�绰��ѯ\n�ʼ���ѯ', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('18', 'crm_customer', '0', 'deal_status', '�ɽ�״̬', 'select', 'δ�ɽ�', '0', '0', '1', '', 'δ�ɽ�\n�ѳɽ�', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('19', 'crm_customer', '0', 'telephone', '�绰', 'text', '', '0', '0', '0', '', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('20', 'crm_customer', '0', 'website', '��ַ', 'text', '', '0', '0', '0', '', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('21', 'crm_customer', '0', 'next_time', '�´���ϵʱ��', 'datetime', '', '0', '0', '0', '', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('22', 'crm_customer', '0', 'remark', '��ע', 'textarea', '', '0', '0', '0', '', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('23', 'crm_contacts', '0', 'name', '����', 'text', '', '0', '0', '1', '', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('24', 'crm_contacts', '0', 'customer_id', '�ͻ�����', 'customer', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('25', 'crm_contacts', '0', 'mobile', '�ֻ�', 'mobile', '', '0', '0', '0', '', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('26', 'crm_contacts', '0', 'telephone', '�绰', 'text', '', '0', '0', '0', '', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('27', 'crm_contacts', '0', 'email', '��������', 'email', '', '0', '0', '0', '', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('28', 'crm_contacts', '0', 'decision', '�Ƿ�ؼ�������', 'select', '', '0', '0', '0', '', '��\n��', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('29', 'crm_contacts', '0', 'post', 'ְ��', 'text', '', '0', '0', '0', '', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('30', 'crm_contacts', '0', 'sex', '�Ա�', 'select', '', '0', '0', '0', '', '��\nŮ', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('31', 'crm_contacts', '0', 'detail_address', '��ַ', 'text', '', '0', '0', '0', '', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('32', 'crm_contacts', '0', 'next_time', '�´���ϵʱ��', 'datetime', '', '0', '0', '0', '', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('33', 'crm_contacts', '0', 'remark', '��ע', 'textarea', '', '0', '0', '0', '', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('34', 'crm_business', '0', 'name', '�̻�����', 'text', '', '0', '0', '1', '', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('35', 'crm_business', '0', 'customer_id', '�ͻ�����', 'customer', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('36', 'crm_business', '0', 'type_id', '�̻�״̬��', 'business_type', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('37', 'crm_business', '0', 'status_id', '�̻��׶�', 'business_status', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('38', 'crm_business', '0', 'money', '�̻����', 'floatnumber', '', '0', '0', '0', 'Ԫ', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('39', 'crm_business', '0', 'deal_date', 'Ԥ�Ƴɽ�����', 'date', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('40', 'crm_business', '0', 'remark', '��ע', 'textarea', '', '0', '0', '0', '', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('41', 'crm_contract', '0', 'num', '��ͬ���', 'text', '', '0', '1', '1', '', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('42', 'crm_contract', '0', 'name', '��ͬ����', 'text', '', '0', '0', '1', '', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('43', 'crm_contract', '0', 'customer_id', '�ͻ�����', 'customer', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('44', 'crm_contract', '0', 'business_id', '�̻�����', 'business', '', '0', '0', '0', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('45', 'crm_contract', '0', 'order_date', '�µ�ʱ��', 'date', '', '0', '0', '0', '', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('46', 'crm_contract', '0', 'money', '��ͬ���', 'floatnumber', '', '0', '0', '1', 'Ԫ', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('47', 'crm_contract', '0', 'start_time', '��ͬ��ʼʱ��', 'date', '', '0', '0', '0', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('48', 'crm_contract', '0', 'end_time', '��ͬ����ʱ��', 'date', '', '0', '0', '0', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('49', 'crm_contract', '0', 'contacts_id', '�ͻ�ǩԼ��', 'contacts', '', '0', '0', '0', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('50', 'crm_contract', '0', 'order_user_id', '��˾ǩԼ��', 'user', '', '0', '0', '0', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('51', 'crm_contract', '0', 'remark', '��ע', 'textarea', '', '0', '0', '0', '', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('52', 'crm_receivables', '0', 'number', '�ؿ���', 'text', '', '0', '1', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('53', 'crm_receivables', '0', 'customer_id', '�ͻ�����', 'customer', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('54', 'crm_receivables', '0', 'contract_id', '��ͬ���', 'contract', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('55', 'crm_receivables', '0', 'return_time', '�ؿ�����', 'date', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('56', 'crm_receivables', '0', 'return_type', '�ؿʽ', 'select', '', '0', '0', '1', '', '֧Ʊ\n�ֽ�\n�������\n���\n����ת��\n֧����\n΢��֧��\n����', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('57', 'crm_receivables', '0', 'money', '�ؿ���', 'floatnumber', '', '0', '0', '1', 'Ԫ', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('58', 'crm_receivables', '0', 'plan_id', '����', 'receivables_plan', '', '0', '0', '0', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('59', 'crm_receivables', '0', 'remark', '��ע', 'textarea', '', '0', '0', '0', '', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('60', 'crm_product', '0', 'name', '��Ʒ����', 'text', '', '0', '0', '1', '', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('61', 'crm_product', '0', 'category_id', '��Ʒ���', 'category', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('62', 'crm_product', '0', 'num', '��Ʒ����', 'text', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('63', 'crm_product', '0', 'status', '�Ƿ��ϼ�', 'select', '�ϼ�', '0', '0', '1', '', '�ϼ�\n�¼�', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('64', 'crm_product', '0', 'unit', '��λ', 'select', '', '0', '0', '1', '', '��\n��\nֻ\n��\nö\nƿ\n��\n̨\n��\nǧ��\n��\n��', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('65', 'crm_product', '0', 'price', '��׼�۸�', 'floatnumber', '', '0', '0', '1', 'Ԫ', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('66', 'crm_product', '0', 'description', '��Ʒ����', 'text', '', '0', '0', '0', '', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('67', 'oa_examine', '1', 'content', '��������', 'text', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('68', 'oa_examine', '1', 'remark', '��ע', 'textarea', '', '0', '0', '0', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('69', 'oa_examine', '2', 'type_id', '�������', 'select', '', '0', '0', '1', '', '���\n�¼�\n����\n����\n����\n���\nɥ��\n����', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('70', 'oa_examine', '2', 'content', '��������', 'text', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('71', 'oa_examine', '2', 'start_time', '��ʼʱ��', 'datetime', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('72', 'oa_examine', '2', 'end_time', '����ʱ��', 'datetime', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('73', 'oa_examine', '2', 'duration', 'ʱ��(��)', 'floatnumber', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('74', 'oa_examine', '2', 'remark', '��ע', 'textarea', '', '0', '0', '0', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('75', 'oa_examine', '3', 'content', '��������', 'text', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('76', 'oa_examine', '3', 'remark', '��ע', 'textarea', '', '0', '0', '0', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('77', 'oa_examine', '3', 'cause', '�г���ϸ', 'business_cause', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('78', 'oa_examine', '3', 'duration', '����������', 'floatnumber', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('79', 'oa_examine', '4', 'content', '�Ӱ�ԭ��', 'text', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('80', 'oa_examine', '4', 'start_time', '��ʼʱ��', 'datetime', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('81', 'oa_examine', '4', 'end_time', '����ʱ��', 'datetime', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('82', 'oa_examine', '4', 'duration', '�Ӱ�������', 'floatnumber', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('83', 'oa_examine', '4', 'remark', '��ע', 'textarea', '', '0', '0', '0', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('84', 'oa_examine', '5', 'content', '��������', 'text', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('85', 'oa_examine', '5', 'cause', '������ϸ', 'examine_cause', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('86', 'oa_examine', '5', 'money', '�����ܽ��', 'floatnumber', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('87', 'oa_examine', '5', 'remark', '��ע', 'textarea', '', '0', '0', '0', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('88', 'oa_examine', '6', 'content', '�������', 'text', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('89', 'oa_examine', '6', 'money', '����Ԫ��', 'floatnumber', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('90', 'oa_examine', '6', 'remark', '��ע', 'textarea', '', '0', '0', '0', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('91', 'crm_receivables_plan', '0', 'customer_id', '�ͻ�����', 'customer', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('92', 'crm_receivables_plan', '0', 'contract_id', '��ͬ���', 'contract', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('93', 'crm_receivables_plan', '0', 'money', '�ƻ��ؿ���', 'floatnumber', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('94', 'crm_receivables_plan', '0', 'return_date', '�ƻ��ؿ�����', 'date', '', '0', '0', '1', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('95', 'crm_receivables_plan', '0', 'return_type', '�ƻ��ؿʽ', 'select', '', '0', '0', '1', '', '֧Ʊ\n�ֽ�\n�������\n���\n����ת��\n֧����\n΢��֧��\n����\n����֧��\n����֧��\nԤ���\n����\nԤ���+����', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('96', 'crm_receivables_plan', '0', 'remind', '��ǰ��������', 'number', '', '0', '0', '0', '', '', '0', '3', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('97', 'crm_receivables_plan', '0', 'remark', '��ע', 'textarea', '', '0', '0', '0', '', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('98', 'crm_receivables_plan', '0', 'file', '����', 'file', '', '0', '0', '0', '', '', '0', '1', '1553788800', '1553788800', '0');
INSERT INTO `lycrm_admin_field` VALUES ('99', 'crm_customer', '0', 'mobile', '�ֻ�', 'mobile', '', '0', '1', '0', '', '', '7', '1', '1553788800', '1553788800', '0');

DROP TABLE IF EXISTS `lycrm_admin_file`;
CREATE TABLE `lycrm_admin_file` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `types` varchar(20) NOT NULL COMMENT '���ͣ�file��img��',
  `name` varchar(100) NOT NULL COMMENT '��������',
  `save_name` varchar(500) NOT NULL COMMENT '����·������',
  `size` int(10) NOT NULL COMMENT '������С���ֽڣ�',
  `create_user_id` int(10) NOT NULL COMMENT '������ID',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  `file_path` varchar(500) NOT NULL COMMENT '�ļ�·��',
  `file_path_thumb` varchar(500) NOT NULL DEFAULT '' COMMENT '�ļ�·��(ͼƬ����ͼ)',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������';

DROP TABLE IF EXISTS `lycrm_admin_group`;
CREATE TABLE `lycrm_admin_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` tinyint(4) NOT NULL COMMENT '����1�����ɫ2�ͻ������ɫ3���½�ɫ4�����ɫ5��Ŀ��ɫ0�Զ����ɫ',
  `title` varchar(100) NOT NULL COMMENT '����',
  `rules` varchar(2000) NOT NULL DEFAULT '' COMMENT '����',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '��ע',
  `status` tinyint(3) DEFAULT '1' COMMENT '1����0����',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1���ˣ�2���˼�������3�����ţ�4�����ż��������ţ�5ȫ�� ',
  `types` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1��������Ա2ϵͳ���ù���Ա3������Ա������Ա4����������Ա5����̨����Ա6�ͻ�����Ա7��Ŀ����Ա8�������Ա',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='��ɫ��';

INSERT INTO `lycrm_admin_group` VALUES ('1', '1', '��������Ա��ɫ', '', '��������Ա��ɫ', '1', '1', '1');
INSERT INTO `lycrm_admin_group` VALUES ('2', '1', 'ϵͳ���ù���Ա', '', 'ϵͳ���ù���Ա', '1', '1', '2');
INSERT INTO `lycrm_admin_group` VALUES ('3', '1', '������Ա������Ա', '', '������Ա������Ա', '1', '1', '3');
INSERT INTO `lycrm_admin_group` VALUES ('4', '1', '����������Ա', '', '����������Ա', '1', '1', '4');
INSERT INTO `lycrm_admin_group` VALUES ('5', '1', '����̨����Ա', '', '����̨����Ա', '1', '1', '5');
INSERT INTO `lycrm_admin_group` VALUES ('6', '1', '�ͻ�����Ա', '', '�ͻ�����Ա', '1', '1', '6');
INSERT INTO `lycrm_admin_group` VALUES ('7', '1', '�������Ա', '', '�������Ա', '1', '1', '8');
INSERT INTO `lycrm_admin_group` VALUES ('8', '2', '����Ա��ɫ', ',3,4,5,6,7,11,12,13,14,15,18,19,21,23,24,25,26,28,30,31,33,35,36,37,38,40,41,43,44,45,46,48,49,50,51,52,53,54,55,59,60,1,2,10,22,29,34,42,56,', '', 1, 2, 0);
INSERT INTO `lycrm_admin_group` VALUES ('9', '4', '�����ɫ', ',43,44,45,46,48,51,52,53,54,1,42,50,67,68,62,', '', 1, 5, 0);
INSERT INTO `lycrm_admin_group` VALUES ('10', '2', '���۾����ɫ', ',1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,', '', 1, 2, 0);

DROP TABLE IF EXISTS `lycrm_admin_menu`;
CREATE TABLE `lycrm_admin_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '�˵�ID',
  `pid` int(11) DEFAULT '0' COMMENT '�ϼ��˵�ID',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '�˵�����',
  `url` varchar(127) NOT NULL DEFAULT '' COMMENT '���ӵ�ַ',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT 'ͼ��',
  `menu_type` tinyint(4) NOT NULL COMMENT '�˵�����',
  `sort` tinyint(4) DEFAULT '0' COMMENT '����ͬ����Ч��',
  `status` tinyint(4) DEFAULT '1' COMMENT '״̬',
  `rule_id` int(11) NOT NULL COMMENT 'Ȩ��id',
  `module` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='��̨�˵���';

INSERT INTO `lycrm_admin_menu` VALUES ('1', '0', 'CRMģ��', '', '', '0', '0', '1', '1', 'crm');
INSERT INTO `lycrm_admin_menu` VALUES ('2', '1', '����', '', '', '0', '0', '1', '2', 'leads');
INSERT INTO `lycrm_admin_menu` VALUES ('3', '1', '�ͻ�', '', '', '0', '0', '1', '10', 'customer');
INSERT INTO `lycrm_admin_menu` VALUES ('4', '1', '��ϵ��', '', '', '0', '0', '1', '22', 'contacts');
INSERT INTO `lycrm_admin_menu` VALUES ('5', '1', '����', '', '', '0', '0', '1', '29', 'pool');
INSERT INTO `lycrm_admin_menu` VALUES ('6', '1', '�̻�', '', '', '0', '0', '1', '34', 'business');
INSERT INTO `lycrm_admin_menu` VALUES ('7', '1', '��ͬ', '', '', '0', '0', '1', '42', 'contract');
INSERT INTO `lycrm_admin_menu` VALUES ('8', '1', '�ؿ�', '', '', '0', '0', '1', '50', 'receivables');
INSERT INTO `lycrm_admin_menu` VALUES ('9', '1', '��Ʒ', '', '', '0', '0', '1', '56', 'product');

DROP TABLE IF EXISTS `lycrm_admin_message`;
CREATE TABLE `lycrm_admin_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `to_user_id` int(10) NOT NULL COMMENT '������ID',
  `from_user_id` int(10) NOT NULL COMMENT '������ID',
  `content` varchar(500) NOT NULL COMMENT '��������',
  `send_time` int(11) NOT NULL COMMENT '����ʱ��',
  `read_time` int(11) NOT NULL COMMENT '�Ķ�ʱ��',
  `module_name` varchar(30) NOT NULL COMMENT 'ģ��',
  `controller_name` varchar(30) NOT NULL COMMENT '������',
  `action_name` varchar(30) NOT NULL COMMENT '����',
  `action_id` int(11) NOT NULL COMMENT '����ID',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='վ����';

DROP TABLE IF EXISTS `lycrm_admin_record`;
CREATE TABLE `lycrm_admin_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `types` varchar(50) NOT NULL COMMENT '��������',
  `types_id` int(11) NOT NULL COMMENT '����ID',
  `content` varchar(1000) NOT NULL COMMENT '��������',
  `category` varchar(30) NOT NULL DEFAULT '' COMMENT '��������',
  `next_time` int(11) NOT NULL DEFAULT '0' COMMENT '�´���ϵʱ��',
  `business_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '�̻�ID',
  `contacts_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '��ϵ��ID',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  `update_time` int(11) NOT NULL COMMENT '����ʱ��',
  `create_user_id` int(11) NOT NULL COMMENT '������ID',
  UNIQUE KEY `record_id` (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������¼';

DROP TABLE IF EXISTS `lycrm_admin_record_file`;
CREATE TABLE `lycrm_admin_record_file` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) NOT NULL COMMENT '��־ID',
  `file_id` int(11) NOT NULL COMMENT '����ID',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������¼������ϵ��';

DROP TABLE IF EXISTS `lycrm_admin_rule`;
CREATE TABLE `lycrm_admin_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `types` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0ϵͳ����1����̨2�ͻ�����3��Ŀ����4������Դ5�������6��ҵ����',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '����',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '����',
  `level` tinyint(5) NOT NULL DEFAULT '0' COMMENT '����1ģ��,2������,3����',
  `pid` int(11) DEFAULT '0' COMMENT '��id��Ĭ��0',
  `status` tinyint(3) DEFAULT '1' COMMENT '״̬��1���ã�0����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='Ȩ�޹����';

INSERT INTO `lycrm_admin_rule` VALUES ('1', '2', 'ȫ��', 'crm', '1', '0', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('2', '2', '��������', 'leads', '2', '1', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('3', '2', '�½�', 'save', '3', '2', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('4', '2', '�༭', 'update', '3', '2', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('5', '2', '�鿴�б�', 'index', '3', '2', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('6', '2', '�鿴����', 'read', '3', '2', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('7', '2', '����', 'excelImport', '3', '2', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('8', '2', '����', 'excelExport', '3', '2', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('9', '2', '�h��', 'delete', '3', '2', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('10', '2', '�ͻ�����', 'customer', '2', '1', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('11', '2', '�½�', 'save', '3', '10', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('12', '2', '�༭', 'update', '3', '10', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('13', '2', '�鿴�б�', 'index', '3', '10', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('14', '2', '�鿴����', 'read', '3', '10', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('15', '2', '����', 'excelImport', '3', '10', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('16', '2', '����', 'excelExport', '3', '10', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('17', '2', '�h��', 'delete', '3', '10', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('18', '2', 'ת��', 'transfer', '3', '10', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('19', '2', '���빫��', 'putInPool', '3', '10', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('20', '2', '����/����', 'lock', '3', '10', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('21', '2', '�༭�Ŷӳ�Ա', 'teamSave', '3', '10', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('22', '2', '��ϵ�˹���', 'contacts', '2', '1', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('23', '2', '�½�', 'save', '3', '22', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('24', '2', '�༭', 'update', '3', '22', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('25', '2', '�鿴�б�', 'index', '3', '22', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('26', '2', '�鿴����', 'read', '3', '22', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('27', '2', '�h��', 'delete', '3', '22', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('28', '2', 'ת��', 'transfer', '3', '22', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('29', '2', '��������', 'customer', '2', '1', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('30', '2', '�鿴�б�', 'pool', '3', '29', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('31', '2', '�鿴����', 'read', '3', '29', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('32', '2', '����', 'distribute', '3', '29', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('33', '2', '��ȡ', 'receive', '3', '29', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('34', '2', '�̻�����', 'business', '2', '1', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('35', '2', '�½�', 'save', '3', '34', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('36', '2', '�༭', 'update', '3', '34', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('37', '2', '�鿴�б�', 'index', '3', '34', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('38', '2', '�鿴����', 'read', '3', '34', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('39', '2', '�h��', 'delete', '3', '34', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('40', '2', 'ת��', 'transfer', '3', '34', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('41', '2', '�༭�Ŷӳ�Ա', 'teamSave', '3', '34', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('42', '2', '��ͬ����', 'contract', '2', '1', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('43', '2', '�½�', 'save', '3', '42', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('44', '2', '�༭', 'update', '3', '42', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('45', '2', '�鿴�б�', 'index', '3', '42', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('46', '2', '�鿴����', 'read', '3', '42', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('47', '2', '�h��', 'delete', '3', '42', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('48', '2', 'ת��', 'transfer', '3', '42', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('49', '2', '�༭�Ŷӳ�Ա', 'teamSave', '3', '42', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('50', '2', '�ؿ����', 'receivables', '2', '1', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('51', '2', '�½�', 'save', '3', '50', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('52', '2', '�༭', 'update', '3', '50', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('53', '2', '�鿴�б�', 'index', '3', '50', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('54', '2', '�鿴����', 'read', '3', '50', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('55', '2', '�h��', 'delete', '3', '50', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('56', '2', '��Ʒ����', 'product', '2', '1', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('57', '2', '�½�', 'save', '3', '56', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('58', '2', '�༭', 'update', '3', '56', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('59', '2', '�鿴�б�', 'index', '3', '56', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('60', '2', '�鿴����', 'read', '3', '56', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('61', '2', '�ϼ�/�¼�', 'status', '3', '56', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('62', '6', '��ҵ����', 'bi', '1', '0', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('63', '6', 'Ա���ͻ�����', 'customer', '2', '62', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('64', '6', '�鿴', 'read', '3', '63', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('65', '6', '����©������', 'business', '2', '62', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('66', '6', '�鿴', 'read', '3', '65', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('67', '6', '�ؿ�ͳ��', 'receivables', '2', '62', '0');
INSERT INTO `lycrm_admin_rule` VALUES ('68', '6', '�鿴', 'read', '3', '67', '0');
INSERT INTO `lycrm_admin_rule` VALUES ('69', '6', '��Ʒ����', 'product', '2', '62', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('70', '6', '�鿴', 'read', '3', '69', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('71', '6', 'ҵ��Ŀ��������', 'achievement', '2', '62', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('72', '6', '�鿴', 'read', '3', '71', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('73', '2', 'ת��', 'transfer', '3', '2', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('74', '2', 'ת��', 'transform', '3', '2', '1');

DROP TABLE IF EXISTS `lycrm_admin_scene`;
CREATE TABLE `lycrm_admin_scene` (
  `scene_id` int(10) NOT NULL AUTO_INCREMENT,
  `types` varchar(50) NOT NULL COMMENT '����',
  `name` varchar(50) NOT NULL COMMENT '��������',
  `user_id` int(10) NOT NULL COMMENT '�û�ID',
  `order_id` int(10) NOT NULL DEFAULT '1' COMMENT '����ID',
  `data` text COMMENT '����ֵ',
  `is_hide` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1����',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1ϵͳ0�Զ���',
  `bydata` varchar(50) NOT NULL DEFAULT '' COMMENT 'ϵͳ����',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  `update_time` int(11) NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`scene_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='����';

INSERT INTO `lycrm_admin_scene` VALUES ('1', 'crm_customer', '�Ҹ���Ŀͻ�', '0', '0', '', '0', '1', 'me', '1546272000', '1546272000');
INSERT INTO `lycrm_admin_scene` VALUES ('2', 'crm_customer', '�Ҳ���Ŀͻ�', '0', '0', '', '0', '1', 'mePart', '1546272000', '1546272000');
INSERT INTO `lycrm_admin_scene` VALUES ('3', 'crm_customer', '��������Ŀͻ�', '0', '0', '', '0', '1', 'sub', '1546272000', '1546272000');
INSERT INTO `lycrm_admin_scene` VALUES ('4', 'crm_customer', 'ȫ���ͻ�', '0', '0', '', '0', '1', 'all', '1546272000', '1546272000');
INSERT INTO `lycrm_admin_scene` VALUES ('5', 'crm_leads', '�Ҹ��������', '0', '0', '', '0', '1', 'me', '1546272000', '1546272000');
INSERT INTO `lycrm_admin_scene` VALUES ('6', 'crm_leads', '����������', '0', '0', '', '0', '1', 'sub', '1546272000', '1546272000');
INSERT INTO `lycrm_admin_scene` VALUES ('7', 'crm_leads', 'ȫ������', '0', '0', '', '0', '1', 'all', '1546272000', '1546272000');
INSERT INTO `lycrm_admin_scene` VALUES ('8', 'crm_contacts', '�Ҹ������ϵ��', '0', '0', '', '0', '1', 'me', '1546272000', '1546272000');
INSERT INTO `lycrm_admin_scene` VALUES ('9', 'crm_contacts', '�����������ϵ��', '0', '0', '', '0', '1', 'sub', '1546272000', '1546272000');
INSERT INTO `lycrm_admin_scene` VALUES ('10', 'crm_contacts', 'ȫ����ϵ��', '0', '0', '', '0', '1', 'all', '1546272000', '1546272000');
INSERT INTO `lycrm_admin_scene` VALUES ('11', 'crm_business', '�Ҹ�����̻�', '0', '0', '', '0', '1', 'me', '1546272000', '1546272000');
INSERT INTO `lycrm_admin_scene` VALUES ('12', 'crm_business', '�Ҳ�����̻�', '0', '0', '', '0', '1', 'mePart', '1546272000', '1546272000');
INSERT INTO `lycrm_admin_scene` VALUES ('13', 'crm_business', '����������̻�', '0', '0', '', '0', '1', 'sub', '1546272000', '1546272000');
INSERT INTO `lycrm_admin_scene` VALUES ('14', 'crm_business', 'ȫ���̻�', '0', '0', '', '0', '1', 'all', '1546272000', '1546272000');
INSERT INTO `lycrm_admin_scene` VALUES ('15', 'crm_contract', '�Ҹ���ĺ�ͬ', '0', '0', '', '0', '1', 'me', '1546272000', '1546272000');
INSERT INTO `lycrm_admin_scene` VALUES ('16', 'crm_contract', '�Ҳ���ĺ�ͬ', '0', '0', '', '0', '1', 'mePart', '1546272000', '1546272000');
INSERT INTO `lycrm_admin_scene` VALUES ('17', 'crm_contract', '��������ĺ�ͬ', '0', '0', '', '0', '1', 'sub', '1546272000', '1546272000');
INSERT INTO `lycrm_admin_scene` VALUES ('18', 'crm_contract', 'ȫ����ͬ', '0', '0', '', '0', '1', 'all', '1546272000', '1546272000');
INSERT INTO `lycrm_admin_scene` VALUES ('19', 'crm_receivables', '�Ҹ���Ļؿ�', '0', '0', '', '0', '1', 'me', '1546272000', '1551515457');
INSERT INTO `lycrm_admin_scene` VALUES ('20', 'crm_receivables', '��������Ļؿ�', '0', '1', '', '0', '1', 'sub', '1546272000', '1551515457');
INSERT INTO `lycrm_admin_scene` VALUES ('21', 'crm_receivables', 'ȫ���ؿ�', '0', '2', '', '0', '1', 'all', '1546272000', '1551515457');
INSERT INTO `lycrm_admin_scene` VALUES ('22', 'crm_product', 'ȫ����Ʒ', '0', '0', '', '0', '1', 'all', '1546272000', '1546272000');
INSERT INTO `lycrm_admin_scene` VALUES ('23', 'crm_leads', '��ת������', '0', '0', '', '0', '1', 'is_transform', '1546272000', '1546272000');

DROP TABLE IF EXISTS `lycrm_admin_scene_default`;
CREATE TABLE `lycrm_admin_scene_default` (
  `default_id` int(11) NOT NULL AUTO_INCREMENT,
  `types` varchar(50) NOT NULL COMMENT '����',
  `user_id` int(11) NOT NULL COMMENT '��ԱID',
  `scene_id` int(11) NOT NULL COMMENT '����ID',
  UNIQUE KEY `default_id` (`default_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����Ĭ�Ϲ�ϵ��';

DROP TABLE IF EXISTS `lycrm_admin_structure`;
CREATE TABLE `lycrm_admin_structure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `pid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='���ű�';

INSERT INTO `lycrm_admin_structure` VALUES ('1', '�칫��', '0');

DROP TABLE IF EXISTS `lycrm_admin_system`;
CREATE TABLE `lycrm_admin_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `value` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `lycrm_admin_system` VALUES ('1', 'name', '���ƿƼ�', '��վ����');
INSERT INTO `lycrm_admin_system` VALUES ('2', 'logo', './public/uploads/20190617/63ea108cbc5a6321154b8961eea88fa5.jpeg', '��ҵlogo');

DROP TABLE IF EXISTS `lycrm_admin_user`;
CREATE TABLE `lycrm_admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����',
  `username` varchar(100) NOT NULL COMMENT '�����̨�˺�',
  `password` varchar(100) NOT NULL COMMENT '�����̨����',
  `salt` varchar(4) NOT NULL COMMENT '��ȫ��',
  `img` varchar(200) NOT NULL DEFAULT '' COMMENT 'ͷ��',
  `thumb_img` varchar(200) NOT NULL DEFAULT '' COMMENT 'ͷ������ͼ',
  `create_time` int(11) NOT NULL,
  `realname` varchar(100) NOT NULL DEFAULT '' COMMENT '��ʵ����',
  `num` varchar(100) NOT NULL DEFAULT '' COMMENT 'Ա�����',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '����',
  `mobile` varchar(50) NOT NULL DEFAULT '' COMMENT '�ֻ�����',
  `sex` varchar(5) NOT NULL DEFAULT '' COMMENT '�С�Ů',
  `structure_id` int(11) NOT NULL DEFAULT '0' COMMENT '����',
  `post` varchar(50) NOT NULL DEFAULT '' COMMENT '��λ',
  `status` tinyint(3) NOT NULL DEFAULT '2' COMMENT '״̬,0����,1����,2δ����',
  `parent_id` int(10) NOT NULL DEFAULT '0' COMMENT 'ֱ���ϼ�ID',
  `authkey` varchar(32) NOT NULL DEFAULT '' COMMENT '��֤��Ϣ',
  `authkey_time` int(11) NOT NULL DEFAULT '0' COMMENT '��֤ʧЧʱ��',
  `type` tinyint(2) NOT NULL COMMENT '1ϵͳ�û� 0��ϵͳ�û�',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�û���';

DROP TABLE IF EXISTS `lycrm_admin_user_field`;
CREATE TABLE `lycrm_admin_user_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `types` varchar(30) NOT NULL COMMENT '����',
  `datas` text COMMENT '����ֵ',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  `update_time` int(11) NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�Զ����ֶ�չʾ�����ϵ��';

DROP TABLE IF EXISTS `lycrm_crm_achievement`;
CREATE TABLE `lycrm_crm_achievement` (
  `achievement_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '����',
  `obj_id` int(11) NOT NULL DEFAULT '0' COMMENT '����ID',
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1��˾2����3Ա��',
  `year` int(8) NOT NULL COMMENT '��',
  `january` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT 'һ��',
  `february` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '����',
  `march` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '����',
  `april` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '����',
  `may` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '����',
  `june` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '����',
  `july` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '����',
  `august` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '����',
  `september` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '����',
  `october` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT 'ʮ��',
  `november` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT 'ʮһ��',
  `december` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT 'ʮ����',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1���ۣ�Ŀ�꣩2�ؿĿ�꣩',
  `yeartarget` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '��Ŀ��',
  PRIMARY KEY (`achievement_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `lycrm_crm_business`;
CREATE TABLE `lycrm_crm_business` (
  `business_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL COMMENT '�ͻ�ID',
  `type_id` int(11) NOT NULL COMMENT '�̻�״̬��',
  `status_id` int(11) NOT NULL COMMENT '���۽׶�',
  `status_time` int(11) NOT NULL DEFAULT '0' COMMENT '�׶��ƽ�ʱ��',
  `is_end` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1Ӯ��2�䵥3��Ч',
  `next_time` int(11) NOT NULL DEFAULT '0' COMMENT '�´���ϵʱ��',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '�̻�����',
  `money` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '�̻����',
  `total_price` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '��Ʒ�ܽ��',
  `deal_date` date DEFAULT NULL COMMENT 'Ԥ�Ƴɽ�����',
  `discount_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '�����ۿ�',
  `remark` text COMMENT '��ע',
  `create_user_id` int(10) NOT NULL COMMENT '������ID',
  `owner_user_id` int(10) NOT NULL COMMENT '������ID',
  `ro_user_id` varchar(500) NOT NULL DEFAULT '' COMMENT 'ֻ��Ȩ��',
  `rw_user_id` varchar(500) NOT NULL DEFAULT '' COMMENT '��дȨ��',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  `update_time` int(11) NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�̻���';

DROP TABLE IF EXISTS `lycrm_crm_business_file`;
CREATE TABLE `lycrm_crm_business_file` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL COMMENT '�̻�ID',
  `file_id` int(11) NOT NULL COMMENT '����ID',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�̻�������ϵ��';

DROP TABLE IF EXISTS `lycrm_crm_business_log`;
CREATE TABLE `lycrm_crm_business_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL COMMENT '�̻�id',
  `status_id` int(11) NOT NULL COMMENT '״̬id',
  `is_end` tinyint(4) NOT NULL COMMENT '1Ӯ��2�䵥3��Ч',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  `owner_user_id` int(11) NOT NULL COMMENT '������',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT '��ע',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='�̻��ƽ���־';

DROP TABLE IF EXISTS `lycrm_crm_business_product`;
CREATE TABLE `lycrm_crm_business_product` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL COMMENT '�̻�ID',
  `product_id` int(11) NOT NULL COMMENT '��ƷID',
  `price` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '��Ʒ����',
  `sales_price` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '���ۼ۸�',
  `num` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '����',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '�ۿ�',
  `subtotal` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT 'С�ƣ��ۿۺ�۸�',
  `unit` varchar(50) NOT NULL DEFAULT '' COMMENT '��λ',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�̻���Ʒ��ϵ��';

DROP TABLE IF EXISTS `lycrm_crm_business_status`;
CREATE TABLE `lycrm_crm_business_status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL COMMENT '�̻�״̬���ID',
  `name` varchar(50) NOT NULL COMMENT '��ʶ',
  `rate` varchar(20) NOT NULL COMMENT 'Ӯ����',
  `order_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '����',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='�̻�״̬';

INSERT INTO `lycrm_crm_business_status` VALUES ('1', '0', 'Ӯ��', '100', '99');
INSERT INTO `lycrm_crm_business_status` VALUES ('2', '0', '�䵥', '0', '100');
INSERT INTO `lycrm_crm_business_status` VALUES ('3', '0', '��Ч', '0', '101');
INSERT INTO `lycrm_crm_business_status` VALUES ('4', '1', '��֤�ͻ�', '20', '1');
INSERT INTO `lycrm_crm_business_status` VALUES ('5', '1', '�������', '15', '2');
INSERT INTO `lycrm_crm_business_status` VALUES ('6', '1', '����/����', '30', '3');
INSERT INTO `lycrm_crm_business_status` VALUES ('7', '1', '̸�����', '30', '4');

DROP TABLE IF EXISTS `lycrm_crm_business_type`;
CREATE TABLE `lycrm_crm_business_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '��ʶ',
  `structure_id` varchar(255) NOT NULL DEFAULT '' COMMENT '����ID',
  `create_user_id` int(11) NOT NULL COMMENT '������ID',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  `update_time` int(11) NOT NULL COMMENT '����ʱ��',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1����0����',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='�̻�״̬�����';

INSERT INTO `lycrm_crm_business_type` VALUES ('1', 'ϵͳĬ��', '', '1', '1540973371', '1540973371', '1');

DROP TABLE IF EXISTS `lycrm_crm_config`;
CREATE TABLE `lycrm_crm_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '��ʶ',
  `value` varchar(255) NOT NULL COMMENT 'ֵ',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='CRM�����������';

INSERT INTO `lycrm_crm_config` VALUES ('1', 'follow_day', '7', '���������');
INSERT INTO `lycrm_crm_config` VALUES ('2', 'deal_day', '30', '��ɽ�����');
INSERT INTO `lycrm_crm_config` VALUES ('3', 'config', '0', '1���ù���');

DROP TABLE IF EXISTS `lycrm_crm_contacts`;
CREATE TABLE `lycrm_crm_contacts` (
  `contacts_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL COMMENT '�ͻ�ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '����',
  `mobile` varchar(50) NOT NULL DEFAULT '' COMMENT '�ֻ�',
  `telephone` varchar(50) NOT NULL DEFAULT '' COMMENT '�绰',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '��������',
  `decision` varchar(20) NOT NULL DEFAULT '' COMMENT '�Ƿ�ؼ�������',
  `post` varchar(255) NOT NULL DEFAULT '' COMMENT 'ְ��',
  `sex` varchar(50) NOT NULL DEFAULT '' COMMENT '�Ա�',
  `detail_address` varchar(255) NOT NULL DEFAULT '' COMMENT '��ַ',
  `remark` text COMMENT '��ע',
  `ro_user_id` varchar(500) NOT NULL DEFAULT '' COMMENT 'ֻ��Ȩ��',
  `rw_user_id` varchar(500) NOT NULL DEFAULT '' COMMENT '��дȨ��',
  `create_user_id` int(11) NOT NULL COMMENT '������ID',
  `owner_user_id` int(11) NOT NULL COMMENT '������ID',
  `next_time` int(11) NOT NULL DEFAULT '0' COMMENT '�´���ϵʱ��',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  `update_time` int(11) NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`contacts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ϵ�˱�';

DROP TABLE IF EXISTS `lycrm_crm_contacts_file`;
CREATE TABLE `lycrm_crm_contacts_file` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `contacts_id` int(11) NOT NULL COMMENT '��ϵ��ID',
  `file_id` int(11) NOT NULL COMMENT '����ID',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ϵ�˸�����ϵ��';

DROP TABLE IF EXISTS `lycrm_crm_contract`;
CREATE TABLE `lycrm_crm_contract` (
  `contract_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL COMMENT '�ͻ�ID',
  `business_id` int(11) NOT NULL COMMENT '�̻�ID',
  `contacts_id` int(11) NOT NULL COMMENT '�ͻ�ǩԼ�ˣ���ϵ��ID��',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '��ͬ����',
  `num` varchar(255) NOT NULL DEFAULT '' COMMENT '��ͬ���',
  `order_date` date DEFAULT NULL COMMENT '�µ�ʱ��',
  `money` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '��ͬ���',
  `total_price` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '��Ʒ�ܽ��',
  `discount_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '�����ۿ�',
  `check_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0����ˡ�1����С�2���ͨ����3���δͨ��',
  `flow_id` int(11) NOT NULL DEFAULT '0' COMMENT '�������ID',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '��˲�������ID',
  `check_user_id` varchar(255) NOT NULL DEFAULT '' COMMENT '������IDs',
  `flow_user_id` varchar(255) NOT NULL DEFAULT '' COMMENT '����������ID',
  `start_time` date DEFAULT NULL COMMENT '��ʼʱ��',
  `end_time` date DEFAULT NULL COMMENT '����ʱ��',
  `order_user_id` varchar(255) NOT NULL DEFAULT '' COMMENT '��˾ǩԼ��',
  `remark` text COMMENT '��ע',
  `create_user_id` int(10) NOT NULL COMMENT '������ID',
  `owner_user_id` int(10) NOT NULL COMMENT '������ID',
  `ro_user_id` varchar(500) NOT NULL DEFAULT '' COMMENT 'ֻ��Ȩ��',
  `rw_user_id` varchar(500) NOT NULL DEFAULT '' COMMENT '��дȨ��',
  `next_time` int(11) NOT NULL DEFAULT '0' COMMENT '�´���ϵʱ��',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  `update_time` int(11) NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ͬ��';

DROP TABLE IF EXISTS `lycrm_crm_contract_file`;
CREATE TABLE `lycrm_crm_contract_file` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_id` int(11) NOT NULL COMMENT '��ͬID',
  `file_id` int(11) NOT NULL COMMENT '����ID',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ͬ������ϵ��';

DROP TABLE IF EXISTS `lycrm_crm_contract_product`;
CREATE TABLE `lycrm_crm_contract_product` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_id` int(11) NOT NULL COMMENT '��ͬID',
  `product_id` int(11) NOT NULL COMMENT '��ƷID',
  `price` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '��Ʒ����',
  `sales_price` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '���ۼ۸�',
  `num` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '����',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '�ۿ�',
  `subtotal` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT 'С�ƣ��ۿۺ�۸�',
  `unit` varchar(50) NOT NULL DEFAULT '' COMMENT '��λ',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ͬ��Ʒ��ϵ��';

DROP TABLE IF EXISTS `lycrm_crm_customer`;
CREATE TABLE `lycrm_crm_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '�ͻ�����',
  `is_lock` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1����',
  `deal_status` varchar(10) NOT NULL DEFAULT 'δ�ɽ�' COMMENT '�ɽ�״̬',
  `deal_time` int(11) NOT NULL COMMENT '�ɽ�ʱ��',
  `level` varchar(500) NOT NULL DEFAULT '' COMMENT '�ͻ�����',
  `industry` varchar(500) NOT NULL DEFAULT '' COMMENT '�ͻ���ҵ',
  `source` varchar(500) NOT NULL DEFAULT '' COMMENT '�ͻ���Դ',
  `telephone` varchar(50) NOT NULL DEFAULT '' COMMENT '�绰',
  `mobile` varchar(50) NOT NULL DEFAULT '' COMMENT '�ֻ�',
  `website` varchar(255) NOT NULL DEFAULT '' COMMENT '��ַ',
  `remark` text COMMENT '��ע',
  `create_user_id` int(11) NOT NULL COMMENT '������ID',
  `owner_user_id` int(11) NOT NULL COMMENT '������ID',
  `ro_user_id` varchar(500) NOT NULL DEFAULT '' COMMENT 'ֻ��Ȩ��',
  `rw_user_id` varchar(500) NOT NULL DEFAULT '' COMMENT '��дȨ��',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT 'ʡ����',
  `location` varchar(255) NOT NULL DEFAULT '' COMMENT '��λ��Ϣ',
  `detail_address` varchar(255) NOT NULL DEFAULT '' COMMENT '��ϸ��ַ',
  `lng` double(14,11) DEFAULT NULL COMMENT '����λ�þ���',
  `lat` double(14,11) DEFAULT NULL COMMENT '����λ��ά��',
  `next_time` int(11) NOT NULL DEFAULT '0' COMMENT '�´���ϵʱ��',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  `update_time` int(11) NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ͻ���';

DROP TABLE IF EXISTS `lycrm_crm_customer_file`;
CREATE TABLE `lycrm_crm_customer_file` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL COMMENT '�ͻ�ID',
  `file_id` int(11) NOT NULL COMMENT '����ID',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ͻ�������ϵ��';

DROP TABLE IF EXISTS `lycrm_crm_leads`;
CREATE TABLE `lycrm_crm_leads` (
  `leads_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0' COMMENT '����ת��Ϊ�ͻ�ID',
  `is_transform` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1��ת��',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '��������',
  `source` varchar(500) NOT NULL DEFAULT '' COMMENT '������Դ',
  `telephone` varchar(255) NOT NULL DEFAULT '' COMMENT '�绰',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '�ֻ�',
  `industry` varchar(500) NOT NULL DEFAULT '' COMMENT '�ͻ���ҵ',
  `level` varchar(500) NOT NULL DEFAULT '' COMMENT '�ͻ�����',
  `detail_address` varchar(255) NOT NULL DEFAULT '' COMMENT '��ַ',
  `remark` text COMMENT '��ע',
  `create_user_id` int(10) NOT NULL COMMENT '������ID',
  `owner_user_id` int(10) NOT NULL COMMENT '������ID',
  `next_time` int(11) DEFAULT '0' COMMENT '�´���ϵʱ��',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  `update_time` int(11) NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`leads_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������';

DROP TABLE IF EXISTS `lycrm_crm_leads_file`;
CREATE TABLE `lycrm_crm_leads_file` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `leads_id` int(11) NOT NULL COMMENT '����ID',
  `file_id` int(11) NOT NULL COMMENT '����ID',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����������ϵ��';

DROP TABLE IF EXISTS `lycrm_crm_product`;
CREATE TABLE `lycrm_crm_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '��Ʒ����',
  `num` varchar(255) NOT NULL DEFAULT '' COMMENT '��Ʒ����',
  `unit` varchar(500) NOT NULL DEFAULT '��' COMMENT '��λ',
  `price` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '��׼�۸�',
  `status` varchar(500) NOT NULL DEFAULT '�ϼ�' COMMENT '�Ƿ��ϼ�',
  `category_id` varchar(255) NOT NULL DEFAULT '' COMMENT '��Ʒ���',
  `category_str` varchar(255) NOT NULL DEFAULT '' COMMENT '��Ʒ����id(�㼶)',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '��Ʒ����',
  `create_user_id` int(10) NOT NULL COMMENT '������ID',
  `owner_user_id` int(10) NOT NULL COMMENT '������ID',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  `update_time` int(11) NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��Ʒ��';

DROP TABLE IF EXISTS `lycrm_crm_product_category`;
CREATE TABLE `lycrm_crm_product_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `pid` int(11) DEFAULT '0',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='��Ʒ�����';

INSERT INTO `lycrm_crm_product_category` VALUES ('1', 'Ĭ��', '0');

DROP TABLE IF EXISTS `lycrm_crm_product_file`;
CREATE TABLE `lycrm_crm_product_file` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL COMMENT '��ƷID',
  `file_id` int(11) NOT NULL COMMENT '����ID',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��Ʒ������ϵ��';

DROP TABLE IF EXISTS `lycrm_crm_receivables`;
CREATE TABLE `lycrm_crm_receivables` (
  `receivables_id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) NOT NULL COMMENT '�ؿ�ƻ�ID',
  `number` varchar(100) NOT NULL DEFAULT '' COMMENT '�ؿ���',
  `customer_id` int(11) NOT NULL COMMENT '�ͻ�ID',
  `contract_id` int(11) NOT NULL COMMENT '��ͬID',
  `return_time` date DEFAULT NULL COMMENT '�ؿ�����',
  `return_type` varchar(100) NOT NULL DEFAULT '' COMMENT '�ؿʽ',
  `money` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '�ؿ���',
  `check_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0����ˡ�1����С�2���ͨ����3���δͨ��',
  `flow_id` int(11) NOT NULL DEFAULT '0' COMMENT '�������ID',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '��˲�������ID',
  `check_user_id` varchar(255) NOT NULL DEFAULT '' COMMENT '������IDs',
  `flow_user_id` varchar(255) NOT NULL DEFAULT '' COMMENT '����������ID',
  `remark` text COMMENT '��ע',
  `create_user_id` int(10) NOT NULL COMMENT '������ID',
  `owner_user_id` int(10) NOT NULL COMMENT '������ID',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  `update_time` int(11) NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`receivables_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ؿ��';

DROP TABLE IF EXISTS `lycrm_crm_receivables_plan`;
CREATE TABLE `lycrm_crm_receivables_plan` (
  `plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(100) NOT NULL DEFAULT '' COMMENT '����',
  `receivables_id` int(11) NOT NULL DEFAULT '0' COMMENT '�ؿ�ID',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1���',
  `contract_id` int(11) NOT NULL COMMENT '��ͬID',
  `customer_id` int(11) NOT NULL COMMENT '�ͻ�ID',
  `money` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '�ƻ��ؿ���',
  `return_date` date DEFAULT NULL COMMENT '�ƻ��ؿ�����',
  `return_type` varchar(255) NOT NULL DEFAULT '' COMMENT '�ƻ��ؿʽ',
  `remind` tinyint(4) NOT NULL DEFAULT '0' COMMENT '��ǰ��������',
  `remind_date` date DEFAULT NULL COMMENT '��������',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT '��ע',
  `create_user_id` int(11) NOT NULL COMMENT '������ID',
  `owner_user_id` int(11) NOT NULL COMMENT '������ID',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  `update_time` int(11) NOT NULL COMMENT '����ʱ��',
  `file` varchar(500) NOT NULL DEFAULT '' COMMENT '����',
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ؿ�ƻ���';

DROP TABLE IF EXISTS `lycrm_hrm_user_det`;
CREATE TABLE `lycrm_hrm_user_det` (
  `userdet_id` int(9) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 'Ա��id',
  `join_time` int(11) NOT NULL DEFAULT '0' COMMENT '��ְʱ��',
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '�������ʣ�1ȫְ 2��ְ 3ʵϰ',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '�û����ͣ�1��ϵͳ�û� 2ϵͳ�û� 3����ְ 4��ְ ',
  `userstatus` tinyint(2) NOT NULL DEFAULT '1' COMMENT 'Ա��״̬��1���� 2��ʽ',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '�ֻ���',
  `sex` varchar(15) NOT NULL DEFAULT '' COMMENT '�Ա�',
  `age` int(3) NOT NULL DEFAULT '0' COMMENT '����',
  `job_num` varchar(30) NOT NULL DEFAULT '' COMMENT '����',
  `idtype` tinyint(2) NOT NULL DEFAULT '0' COMMENT '֤������',
  `idnum` varchar(30) NOT NULL DEFAULT '' COMMENT '֤������',
  `birth_time` varchar(30) NOT NULL DEFAULT '' COMMENT '��������',
  `nation` varchar(20) NOT NULL DEFAULT '' COMMENT '����',
  `internship` tinyint(2) NOT NULL DEFAULT '0' COMMENT '�����ڣ��£�',
  `done_time` int(11) NOT NULL DEFAULT '0' COMMENT 'ת��ʱ��',
  `parroll_id` int(11) NOT NULL DEFAULT '0' COMMENT '������Ϣ��ID',
  `create_time` int(11) NOT NULL COMMENT '���ʱ��',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '�༭ʱ��',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '����',
  `political` varchar(100) NOT NULL DEFAULT '' COMMENT '������ò',
  `location` varchar(255) NOT NULL DEFAULT '' COMMENT '������ַ',
  `leave_time` int(11) NOT NULL DEFAULT '0' COMMENT '��ְʱ��',
  PRIMARY KEY (`userdet_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Ա��������';

DROP TABLE IF EXISTS `lycrm_oa_announcement`;
CREATE TABLE `lycrm_oa_announcement` (
  `announcement_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '����',
  `content` text COMMENT '����',
  `create_user_id` int(10) NOT NULL COMMENT '������ID',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  `update_time` int(11) NOT NULL COMMENT '����ʱ��',
  `start_time` int(11) NOT NULL COMMENT '��ʼʱ��',
  `end_time` int(11) NOT NULL COMMENT '����ʱ��',
  `structure_ids` varchar(100) NOT NULL DEFAULT '' COMMENT '֪ͨ����',
  `owner_user_ids` varchar(100) NOT NULL DEFAULT '' COMMENT '֪ͨ��',
  PRIMARY KEY (`announcement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����';

DROP TABLE IF EXISTS `lycrm_oa_event`;
CREATE TABLE `lycrm_oa_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '�ճ̱���',
  `start_time` int(11) NOT NULL COMMENT '��ʼʱ��',
  `end_time` int(11) NOT NULL COMMENT '����ʱ��',
  `create_user_id` int(10) NOT NULL COMMENT '������ID',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  `update_time` int(11) NOT NULL COMMENT '����ʱ��',
  `type` tinyint(2) DEFAULT '0' COMMENT '0������1ÿ��2ÿ��3ÿ��4ÿ��',
  `remindtype` tinyint(4) NOT NULL DEFAULT '0' COMMENT '����ʱ��0׼ʱ���� 1��5����ǰ 2��15����ǰ 3��30����ǰ 4��һ��Сʱǰ 5������Сʱǰ 6��һ��ǰ 7������ǰ 8��һ��ǰ',
  `owner_user_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '������',
  `remark` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '��ע',
  `color` varchar(15) NOT NULL DEFAULT '' COMMENT '��ɫ',
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ճ̱�';

DROP TABLE IF EXISTS `lycrm_oa_event_notice`;
CREATE TABLE `lycrm_oa_event_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL COMMENT '�ճ�ID',
  `noticetype` varchar(255) NOT NULL DEFAULT '' COMMENT '1�� 2�� 3�� 4�� 0������',
  `repeated` varchar(30) NOT NULL DEFAULT '',
  `start_time` int(11) NOT NULL COMMENT '��ʼʱ��',
  `stop_time` int(11) NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='�ճ��������ñ�';

DROP TABLE IF EXISTS `lycrm_oa_event_relation`;
CREATE TABLE `lycrm_oa_event_relation` (
  `eventrelation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '�ճ̹���ҵ���',
  `event_id` int(11) NOT NULL COMMENT '�ճ�ID',
  `customer_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '�ͻ�IDs',
  `contacts_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '��ϵ��IDs',
  `business_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '�̻�IDs',
  `contract_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '��ͬIDs',
  `status` tinyint(2) DEFAULT '0' COMMENT '״̬1����',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`eventrelation_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='�ճ̹���ҵ���';

DROP TABLE IF EXISTS `lycrm_oa_examine`;
CREATE TABLE `lycrm_oa_examine` (
  `examine_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL DEFAULT '1' COMMENT '��������',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '����',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT '��ע',
  `money` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '���á������ܽ��',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '��ʼʱ��',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `duration` decimal(10,1) NOT NULL DEFAULT '0.0' COMMENT 'ʱ��',
  `create_user_id` int(10) NOT NULL COMMENT '������ID',
  `check_user_id` varchar(200) NOT NULL COMMENT '������ID',
  `flow_user_id` varchar(500) NOT NULL DEFAULT '' COMMENT '����������ID',
  `check_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '״̬��0����1�����С�2ͨ����3ʧ�ܡ�4������',
  `flow_id` int(11) NOT NULL DEFAULT '0' COMMENT '��������ID',
  `order_id` int(10) NOT NULL DEFAULT '0' COMMENT '������������ID',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  `update_time` int(11) NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`examine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������';

DROP TABLE IF EXISTS `lycrm_oa_examine_category`;
CREATE TABLE `lycrm_oa_examine_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '����',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT '����',
  `create_user_id` int(10) NOT NULL COMMENT '������ID',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1���ã�0����',
  `is_sys` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1Ϊϵͳ���ͣ�����ɾ��',
  `user_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '�ɼ���Χ��Ա����',
  `structure_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '�ɼ���Χ�����ţ�',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  `update_time` int(11) NOT NULL COMMENT '����ʱ��',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1��ɾ��',
  `delete_time` int(11) NOT NULL DEFAULT '0' COMMENT 'ɾ��ʱ��',
  `delete_user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ɾ����ID',
  `flow_id` int(11) NOT NULL DEFAULT '0' COMMENT '������ID',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='�������ͱ�';

INSERT INTO `lycrm_oa_examine_category` VALUES ('1', '��ͨ����', '��ͨ����', '1', '1', '1', '', '', '1548911542', '1548911542', '0', '0', '0', '1');
INSERT INTO `lycrm_oa_examine_category` VALUES ('2', '�������', '�������', '1', '1', '1', '', '', '1551351810', '1551351810', '0', '0', '0', '1');
INSERT INTO `lycrm_oa_examine_category` VALUES ('3', '��������', '��������', '1', '1', '1', '', '', '1548911542', '1548911542', '0', '0', '0', '1');
INSERT INTO `lycrm_oa_examine_category` VALUES ('4', '�Ӱ�����', '�Ӱ�����', '1', '1', '1', '', '', '1548911542', '1548911542', '0', '0', '0', '1');
INSERT INTO `lycrm_oa_examine_category` VALUES ('5', '���ñ���', '���ñ���', '1', '1', '1', '', '', '1548911542', '1548911542', '0', '0', '0', '1');
INSERT INTO `lycrm_oa_examine_category` VALUES ('6', '�������', '�������', '1', '1', '1', '', '', '1548911542', '1548911542', '0', '0', '0', '1');

DROP TABLE IF EXISTS `lycrm_oa_examine_data`;
CREATE TABLE `lycrm_oa_examine_data` (
  `data_id` int(11) NOT NULL AUTO_INCREMENT,
  `examine_id` int(11) NOT NULL COMMENT '����ID',
  `field` varchar(30) NOT NULL COMMENT '�ֶ���',
  `value` varchar(1000) NULL DEFAULT NULL COMMENT 'ֵ',
  PRIMARY KEY (`data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����������չ��';

DROP TABLE IF EXISTS `lycrm_oa_examine_file`;
CREATE TABLE `lycrm_oa_examine_file` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `examine_id` int(11) NOT NULL COMMENT '����ID',
  `file_id` int(11) NOT NULL COMMENT '����ID',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����������ϵ��';

DROP TABLE IF EXISTS `lycrm_oa_examine_relation`;
CREATE TABLE `lycrm_oa_examine_relation` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '��������ҵ���',
  `examine_id` int(11) NOT NULL COMMENT '����ID',
  `customer_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '�ͻ�IDs',
  `contacts_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '��ϵ��IDs',
  `business_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '�̻�IDs',
  `contract_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '��ͬIDs',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '״̬1����',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='��������ҵ���';

DROP TABLE IF EXISTS `lycrm_oa_examine_travel`;
CREATE TABLE `lycrm_oa_examine_travel` (
  `travel_id` int(11) NOT NULL AUTO_INCREMENT,
  `examine_id` int(11) NOT NULL COMMENT '����ID',
  `start_address` varchar(100) NOT NULL DEFAULT '' COMMENT '������',
  `start_time` int(11) NOT NULL COMMENT '����ʱ��',
  `end_address` varchar(100) NOT NULL DEFAULT '' COMMENT 'Ŀ�ĵ�',
  `end_time` int(11) NOT NULL COMMENT '����ʱ��',
  `traffic` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '��ͨ��',
  `stay` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT 'ס�޷�',
  `diet` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '������',
  `other` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '��������',
  `money` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '���',
  `vehicle` varchar(255) NOT NULL DEFAULT '' COMMENT '��ͨ����',
  `trip` varchar(50) NOT NULL DEFAULT '' COMMENT '�������������̡�������',
  `duration` decimal(10,1) NOT NULL DEFAULT '0.0' COMMENT 'ʱ��',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '��ע',
  PRIMARY KEY (`travel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����г̱�';

DROP TABLE IF EXISTS `lycrm_oa_examine_travel_file`;
CREATE TABLE `lycrm_oa_examine_travel_file` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `travel_id` int(11) NOT NULL COMMENT '����id',
  `file_id` int(11) NOT NULL COMMENT '����ID',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���ø�����ϵ��';

DROP TABLE IF EXISTS `lycrm_oa_log`;
CREATE TABLE `lycrm_oa_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` tinyint(2) NOT NULL DEFAULT '1' COMMENT '��־���ͣ�1�ձ���2�ܱ���3�±���',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '��־����',
  `content` text COMMENT '��־����',
  `tomorrow` varchar(1000) NOT NULL DEFAULT '' COMMENT '���չ�������',
  `question` varchar(1000) NOT NULL DEFAULT '' COMMENT '��������',
  `create_user_id` int(10) NOT NULL COMMENT '������ID',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  `update_time` int(11) NOT NULL COMMENT '����ʱ��',
  `send_user_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '֪ͨ��',
  `send_structure_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '֪ͨ����',
  `read_user_ids` text COMMENT '�Ѷ�ids',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������־��';

DROP TABLE IF EXISTS `lycrm_oa_log_file`;
CREATE TABLE `lycrm_oa_log_file` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_id` int(11) NOT NULL COMMENT '��־ID',
  `file_id` int(11) NOT NULL COMMENT '����ID',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��־������ϵ��';

DROP TABLE IF EXISTS `lycrm_oa_log_relation`;
CREATE TABLE `lycrm_oa_log_relation` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '��־����ҵ���',
  `log_id` int(11) NOT NULL COMMENT '��־ID',
  `customer_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '�ͻ�IDs',
  `contacts_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '��ϵ��IDs',
  `business_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '�̻�IDs',
  `contract_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '��ͬIDs',
  `status` tinyint(2) NOT NULL COMMENT '״̬1����',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='��־����ҵ���';

DROP TABLE IF EXISTS `lycrm_task`;
CREATE TABLE `lycrm_task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '�����',
  `name` varchar(50) NOT NULL COMMENT '��������',
  `create_user_id` int(11) NOT NULL COMMENT '������ID',
  `main_user_id` int(11) NOT NULL COMMENT '������ID',
  `owner_user_id` varchar(255) NOT NULL DEFAULT '' COMMENT '�Ŷӳ�ԱID',
  `structure_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '����IDs',
  `create_time` int(11) NOT NULL COMMENT '�½�ʱ��',
  `update_time` int(11) NOT NULL COMMENT '����ʱ��',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '���״̬ 1���ڽ���2����3�鵵 5����',
  `class_id` int(5) NOT NULL DEFAULT '0' COMMENT '���� Ҫ�� ���� ����',
  `lable_id` varchar(255) NOT NULL DEFAULT '' COMMENT '��ǩ ,��ƴ��',
  `description` text COMMENT '����',
  `pid` int(11) DEFAULT '0' COMMENT '�ϼ�ID',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '��ʼʱ��',
  `stop_time` int(11) NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `priority` tinyint(2) NOT NULL DEFAULT '0' COMMENT '���ȼ� �Ӵ�С',
  `work_id` int(11) DEFAULT '0' COMMENT '��ĿID',
  `is_top` tinyint(2) DEFAULT '0' COMMENT '����̨չʾ 0�ռ��� 1��2��3',
  `is_open` tinyint(2) DEFAULT '1' COMMENT '�Ƿ񹫿�',
  `order_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '����ID',
  `top_order_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '�ҵ���������ID',
  `archive_time` int(11) NOT NULL DEFAULT '0' COMMENT '�鵵ʱ��',
  `ishidden` tinyint(2) DEFAULT '0' COMMENT '�Ƿ�ɾ��',
  `hidden_time` int(11) NOT NULL DEFAULT '0' COMMENT 'ɾ��ʱ��',
  PRIMARY KEY (`task_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='�����';

DROP TABLE IF EXISTS `lycrm_task_relation`;
CREATE TABLE `lycrm_task_relation` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '�������ҵ���',
  `task_id` int(11) NOT NULL COMMENT '����ID',
  `customer_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '�ͻ�IDs',
  `contacts_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '��ϵ��IDs',
  `business_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '�̻�IDs',
  `contract_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '��ͬIDs',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '״̬1����',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='�������ҵ���';

DROP TABLE IF EXISTS `lycrm_work`;
CREATE TABLE `lycrm_work` (
  `work_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '��Ŀ����',
  `status` tinyint(2) DEFAULT '0' COMMENT '״̬ 1���� 0�鵵',
  `create_time` int(11) NOT NULL,
  `create_user_id` int(11) NOT NULL COMMENT '������ID',
  `description` text COMMENT '����',
  `color` varchar(15) NOT NULL DEFAULT '' COMMENT '��ɫ',
  `is_open` tinyint(2) DEFAULT '0' COMMENT '�Ƿ������˿ɼ� 1�ɼ�',
  `owner_user_id` varchar(255) NOT NULL DEFAULT '' COMMENT '��Ŀ��Ա',
  `ishidden` tinyint(2) DEFAULT '0' COMMENT '�Ƿ�ɾ��',
  `archive_time` int(11) NOT NULL DEFAULT '0' COMMENT '�鵵ʱ��',
  PRIMARY KEY (`work_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='��Ŀ��';

DROP TABLE IF EXISTS `lycrm_work_relation`;
CREATE TABLE `lycrm_work_relation` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '��־����ҵ���',
  `work_id` int(11) NOT NULL COMMENT '��ĿID',
  `customer_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '�ͻ�IDs',
  `contacts_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '��ϵ��IDs',
  `business_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '�̻�IDs',
  `contract_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '��ͬIDs',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '״̬1����',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='��Ŀ����ҵ���';

DROP TABLE IF EXISTS `lycrm_work_task_class`;
CREATE TABLE `lycrm_work_task_class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '��������',
  `name` varchar(50) NOT NULL COMMENT '������',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  `create_user_id` int(11) NOT NULL COMMENT '������ID',
  `status` tinyint(2) DEFAULT '0' COMMENT '״̬1����',
  `work_id` int(11) NOT NULL COMMENT '��ĿID',
  `order_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '����',
  PRIMARY KEY (`class_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='��������';

DROP TABLE IF EXISTS `lycrm_work_task_file`;
CREATE TABLE `lycrm_work_task_file` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` int(11) NOT NULL COMMENT '�ļ�ID',
  `task_id` int(11) NOT NULL COMMENT '����ID',
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `lycrm_work_task_lable`;
CREATE TABLE `lycrm_work_task_lable` (
  `lable_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '��ǩ��',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  `create_user_id` int(11) NOT NULL COMMENT '������ID',
  `status` tinyint(2) DEFAULT '0' COMMENT '״̬',
  `color` varchar(15) NOT NULL DEFAULT '' COMMENT '��ɫ',
  PRIMARY KEY (`lable_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='�����ǩ��';

DROP TABLE IF EXISTS `lycrm_work_task_log`;
CREATE TABLE `lycrm_work_task_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '��Ŀ��־��',
  `user_id` int(11) NOT NULL COMMENT '������ID',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '����',
  `create_time` int(11) NOT NULL COMMENT '����ʱ��',
  `status` tinyint(2) DEFAULT '0' COMMENT '״̬ 4ɾ��',
  `task_id` int(11) DEFAULT '0' COMMENT '����ID',
  `work_id` int(11) DEFAULT '0' COMMENT '��ĿID',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='������־��';

ALTER TABLE `lycrm_crm_leads` ADD `follow` VARCHAR(20) NULL DEFAULT NULL COMMENT '����' AFTER `next_time`;

ALTER TABLE `lycrm_crm_customer` ADD `follow` VARCHAR(20) NULL DEFAULT NULL COMMENT '����' AFTER `next_time`;

INSERT INTO `lycrm_crm_config` (`id`, `name`, `value`, `description`) VALUES (NULL, 'contract_day', '30', '��ͬ������������');
UPDATE `lycrm_admin_rule` SET `status` = '0' WHERE `lycrm_admin_rule`.`id` = 67;
UPDATE `lycrm_admin_rule` SET `status` = '0' WHERE `lycrm_admin_rule`.`id` = 68;
UPDATE `lycrm_admin_rule` SET `title` = '��Ʒ����' WHERE `lycrm_admin_rule`.`id` = 69;
INSERT INTO `lycrm_admin_rule` VALUES ('75', '6', 'Ա��ҵ������', 'contract', '2', '62', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('76', '6', '�鿴', 'read', '3', '75', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('77', '6', '�ͻ��������', 'portrait', '2', '62', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('78', '6', '�鿴', 'read', '3', '77', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('79', '6', '���а�', 'ranking', '2', '62', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('80', '6', '�鿴', 'read', '3', '79', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('81', '2', '����', 'excelImport', '3', '22', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('82', '2', '����', 'excelExport', '3', '22', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('83', '2', '����', 'excelImport', '3', '56', '1');
INSERT INTO `lycrm_admin_rule` VALUES ('84', '2', '����', 'excelExport', '3', '56', '1');

ALTER TABLE `lycrm_oa_announcement` ADD `read_user_ids` TEXT  COMMENT '�Ķ���' AFTER `owner_user_ids`;

CREATE TABLE `lycrm_crm_top` (
  `top_id` int(10) NOT NULL AUTO_INCREMENT,
  `module_id` int(10) NOT NULL COMMENT '���ģ��ID',
  `set_top` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1�ö�',
  `top_time` int(10) NOT NULL COMMENT '�ö�ʱ��',
  `create_role_id` int(10) NOT NULL COMMENT '������ID',
  `module` varchar(50) NOT NULL DEFAULT 'business' COMMENT '�ö�ģ��',
  PRIMARY KEY (`top_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ö���';