CREATE TABLE ae_h_employee ( 
  code_id bigint(20)  PRIMARY KEY AUTO_INCREMENT,
  userid varchar(255) NOT NULL, 
  name varchar(255) NOT NULL, 
  sex tinyint(4) NOT NULL, 
  identity_card varchar(30) NOT NULL, 
  Entry_date varchar(255) NOT NULL, 
  termination_date varchar(255),
  onwership_place varchar(50) NOT NULL , 
  wages decimal(10)NOT NULL,
  email varchar(50) NOT NULL,
  password varchar(50) NOT NULL,
  dept_id varchar(20) NOT NULL
 
) AUTO_INCREMENT=1;
 
