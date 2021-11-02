-- php에서 회원가입

INSERT INTO tb_member(mem_userid, mem_userpw, mem_name, mem_hp, mem_email, mem_hobby,
mem_ssn1,mem_ssn2,mem_zipcode,mem_address1,mem_address2,mem_address3)
VALUES('avocado','1111','안카도', '010-1111-1111','avocado@avocado.com','영화감상 쇼핑 ','001011','3098918','13473','경기 성남시 분당구 경부고속도로 409','아파트 1',' (삼평동)');

SELECT * FROM tb_member;

-- php 로그인
SELECT mem_userid FROM tb_member WHERE mem_userid='banana' and mem_userpw='2221';

-- 비밀번호 암호화
SELECT md5('1111') as password; -- b59c67bf196a4758191e42f76670ceba
SELECT md5('1234') as password; -- 81dc9bdb52d04dc20036dbd8313ed055