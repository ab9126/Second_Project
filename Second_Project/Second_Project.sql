
create table tbl_board(
	c_board_num number(6) primary key,
	c_board_author varchar2(15) not null,
	c_board_title varchar2(90) not null,
	c_board_content varchar2(1000) not null,
	c_board_writeday date default sysdate,
	c_board_readcnt number(6) default 0,
	c_board_repRoot number(4),
	c_board_repStep number(4),
	c_board_repIndent number(4),
	c_board_recom number(4),
	c_board_decom number(4)
	)
	
CREATE TABLE tbl_member(
c_member_id varchar2(6) PRIMARY KEY,
c_member_password varchar2(12) not null,
c_member_name varchar2(8) not null,
c_member_birth date default sysdate,
c_member_gender varchar2(1) not null,
c_member_admin number(1) default 1,
CONSTRAINT tbl_member_gender_MorF_CK CHECK (c_member_gender IN('M', 'F', 'm', 'f'))
)

drop table tbl_member
drop table tbl_board

select * from board order by repRoot desc, repStep asc

select rownum rnum, num, title, author, 
to_char(writeday, 'yyyy/mm/dd') writeday, readcnt, repIndent from 
(select * from board order by repRoot desc, repStep asc)

select * from
(select rownum rnum, num, title, author, 
to_char(writeday, 'yyyy/mm/dd') writeday, readcnt, repIndent from 
(select * from board order by repRoot desc, repStep asc))
where rnum between 11 and 20
