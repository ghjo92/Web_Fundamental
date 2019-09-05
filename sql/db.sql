create table notice (
n_num int primary key auto_increment,
n_writer varchar(100) not null,
n_title varchar(200) not null,
n_content varchar(16384) not null,
n_regdate datetime not null
);

CREATE TABLE member(
m_seq INT PRIMARY KEY AUTO_INCREMENT,
m_id VARCHAR(20) NOT NULL,
m_email VARCHAR(100) NOT NULL,
m_name VARCHAR(20),
m_pwd CHAR(41),
m_phone VARCHAR(15),
m_regdate DATETIME
);