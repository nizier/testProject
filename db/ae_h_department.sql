CREATE TABLE ae_h_department ( 
  dept_id bigint(20)  PRIMARY KEY,
  dept_name varchar(255) NOT NULL, 
  parent_id varchar(20) NOT NULL, 
  dept_level int(11), 
  display_type tinyint(4) 
  ) 

INSERT INTO ae_h_department VALUES ('1001', '高科技业务群', '0', '1', '1');
INSERT INTO ae_h_department VALUES ('1002', '互联网+业务线', '1001', '2', '1');
INSERT INTO ae_h_department VALUES ('1003', '腾讯系事业部', '1002', '3', '1');
INSERT INTO ae_h_department VALUES ('1004', '互动娱乐部', '1003', '4', '1');
INSERT INTO ae_h_department VALUES ('1005', '微企网媒部', '1003', '4', '1');
INSERT INTO ae_h_department VALUES ('1006', '移动社交部', '1003', '4', '1');
INSERT INTO ae_h_department VALUES ('1007', '电信事业部', '1002', '3', '1');
INSERT INTO ae_h_department VALUES ('1008', '电信企业部', '1007', '4', '1');
INSERT INTO ae_h_department VALUES ('1009', '终端互联部', '1007', '4', '1');
INSERT INTO ae_h_department VALUES ('1010', '欧美业务线', '1001', '2', '1');
INSERT INTO ae_h_department VALUES ('1011', '微软事业部', '1010', '3', '1');
INSERT INTO ae_h_department VALUES ('1012', 'Localization', '1011', '4', '1');
INSERT INTO ae_h_department VALUES ('1013', 'DevOps', '1011', '4', '1');
INSERT INTO ae_h_department VALUES ('1014', 'TechSupport', '1011', '4', '1');
INSERT INTO ae_h_department VALUES ('1015', 'ResoueceAug', '1011', '4', '1');
INSERT INTO ae_h_department VALUES ('1016', 'GE事业部', '1010', '3', '1');
INSERT INTO ae_h_department VALUES ('1017', 'Managed Services', '1016', '4', '1');
INSERT INTO ae_h_department VALUES ('1018', 'ResourceAug', '1016', '4', '1');
INSERT INTO ae_h_department VALUES ('1019', '亚太业务线', '1001', '2', '1');
INSERT INTO ae_h_department VALUES ('1020', '企业应用事业部', '1019', '3', '1');
INSERT INTO ae_h_department VALUES ('1021', '教育交付部', '1020', '4', '1');
INSERT INTO ae_h_department VALUES ('1022', '物流交付部', '1020', '4', '1');
INSERT INTO ae_h_department VALUES ('1023', '地产交付部', '1022', '4', '1');
