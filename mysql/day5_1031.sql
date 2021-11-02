use front_class;
select * from tb_board;

-- 글보기
select b_idx, b_title, b_content, b_userid, b_hit, b_regdate, b_like from tb_board where b_idx =2;

-- 조회수 1 올리기
update tb_board set b_hit = b_hit + 1 where b_idx=2;

-- 좋아요 1 올리기

update tb_board set b_like = b_like + 1 where b_idx=2;

-- 좋아요 현재값을 리턴
select b_like from tb_board where b_idx=2;

-- 글수정
update tb_board set b_title='수정1', b_content='수정2' where b_idx=2;

-- 글삭제
delete from tb_board where b_idx=1;

-- 댓글 테이블 만들기
create table tb_reply(
	re_idx bigint auto_increment primary key,
    re_userid varchar(20) not null,
    re_content varchar(1000) not null,
    re_regdate datetime default now(),
    re_boardidx bigint not null,
    foreign key(re_boardidx) references tb_board(b_idx)
);

select * from tb_reply;

-- 댓글달기
insert into tb_reply(re_userid, re_content, re_boardidx) values ('apple','반가워요','1');

select re_idx, re_userid, re_content, re_regdate from tb_reply where re_boardidx=1 order by re_idx desc;

-- 댓글의 개수
