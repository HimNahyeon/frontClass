use front_class;

-- 게시판 테이블 만들기

create table tb_board(
	b_idx bigint auto_increment primary key,
    b_title varchar(500) not null,
    b_content text,
    b_userid varchar(20) not null,
    b_hit int default 0, 
    b_regdate datetime default now(),
    b_like int default 0
);

desc tb_board;

insert into tb_board (b_userid, b_title, b_content)values('apple','안녕','반가워~!');

select b_idx, b_title, b_userid, b_hit, b_regdate, b_like from tb_board order by b_idx desc;