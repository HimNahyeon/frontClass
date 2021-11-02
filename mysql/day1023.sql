
-- 제약조건
-- 데이터의 무결성을 지키기 위해 데이터를 입력받을 때 실행하는 검사 규칙

-- NOT NULL
-- 필드에 NULL을 저장할 수 없음
-- UNIQUE
-- 중복된 값을 저장할 수 없음, null은 허용
-- DEFAULT
-- 기본값을 설정(null)   값이 안들어왔을때 들어가는 기본값
-- AUTO_INCREMENT
-- 자동으로 숫자가 증가되어 추가, 중복 값이 저장되지 않음, 직접 데이터를 추가할 수 없음.
-- primary key로 설정(MySQL)
-- PRIMARY KEY         
-- UNIQUE 제약과 NOT NULL 제약을 동시에 가짐, 테이블에 오직 하나의 필드에만 적용,
-- 데이터를 쉽고 빠르게 찾을 수 있음, 외래키가 참조할 수 있도록 설정
-- FOREIGN KEY
-- 다른 테이블과 연결해주는 역할, PRIMARY KEY 참조



-- 테이블 만들기  (PHP  2일차 6번 회원가입 양식)

CREATE DATABASE front_class;

USE front_class;

CREATE TABLE tb_member(
	mem_idx int auto_increment primary key,
    mem_userid varchar(20) unique not null,
    mem_userpw varchar(200) not null,
    mem_name varchar(20) not null,
    mem_hp varchar(20) not null,
    mem_email varchar(50) ,
    mem_hobby varchar(100),
    mem_ssn1 char(6) not null,
    mem_ssn2 char(7) not null,
    mem_zipcode char(5),
    mem_address1 varchar(100),
    mem_address2 varchar(100),
    mem_address3 varchar(100),
    mem_regdate datetime default now()
    );
    
-- 테이블 구조 확인
-- DESC 테이블명

DESC tb_member;

-- 테이블 삭제
-- DROP TABLE 테이블명;


-- 테이블 필드 추가
-- ALTER TABLE 테이블명 ADD 컬럼명 컬럼타입 제약조건;
ALTER TABLE tb_member ADD mem_point int default 0;


-- 테이블 필드 수정
-- ALTER TABLE 테이블명 MODIFY COLUMN 컬럼명 컬럼타입 제약조건;

ALTER TABLE tb_member modify COLUMN mem_point double default 0;


-- 테이블 필드 삭제
-- ALTER TABLE 테이블명 DROP 컬럼명;
ALTER TABLE tb_member DROP mem_point;



-- 데이터 삽입 (INSERT)
-- INSERT INTO 테이블명 VALUES (값1, 값2, 값3 ..);
-- INSERT INTO 테이블명 (필드명1, 필드명2, 필드명3 ... ) VALUES (값1,값2,값3 ..);



INSERT INTO tb_member (mem_userid, mem_userpw, mem_name, mem_hp, mem_email, 
mem_hobby, mem_ssn1, mem_ssn2, mem_zipcode, mem_address1, mem_address2, 
mem_address3) VALUES ('apple', '1111', '김사과', '010-1111-1111', 
'apple@apple.com', '영화감상', '001011', '4068518', '12345', 
'서울 서초구 양재동', '111-11', '101동');


INSERT INTO tb_member (mem_userid, mem_userpw, mem_name, mem_hp, mem_email, mem_hobby, 
mem_ssn1, mem_ssn2, mem_zipcode, mem_address1, mem_address2, mem_address3) VALUES
('banana', '2222', '반하나', '010-2222-2222', 'banana@banana.com', '운동', 
'001011', '4068518', '12345', '서울 서초구 서초동', '111-11', '101동');

INSERT INTO tb_member (mem_userid, mem_userpw, mem_name, mem_hp, mem_email, mem_hobby, 
mem_ssn1, mem_ssn2, mem_zipcode, mem_address1, mem_address2, mem_address3) VALUES
('orange', '3333', '오렌지', '010-3333-3333', 'orange@orange.com', '영화감상', 
'001011', '4068518', '12345', '서울 서초구 반포동', '111-11', '101동');

INSERT INTO tb_member (mem_userid, mem_userpw, mem_name, mem_hp, mem_email, mem_hobby, 
mem_ssn1, mem_ssn2, mem_zipcode, mem_address1, mem_address2, mem_address3) VALUES
('melon', '4444', '이메론', '010-4444-4444', 'melon@melon.com', '영화감상', 
'001011', '4068518', '12345', '서울 서초구 방배동', '111-11', '101동');

INSERT INTO tb_member (mem_userid, mem_userpw, mem_name, mem_hp, mem_email, mem_hobby, 
mem_ssn1, mem_ssn2, mem_zipcode, mem_address1, mem_address2, mem_address3) VALUES
('berry', '5555', '배애리', '010-5555-5555', 'berry@berry.com', '영화감상', 
'001011', '4068518', '12345', '서울 강남구 역삼동', '111-11', '101동');

INSERT INTO tb_member (mem_userid, mem_userpw, mem_name, mem_hp, mem_email, mem_hobby, 
mem_ssn1, mem_ssn2, mem_zipcode, mem_address1, mem_address2, mem_address3) VALUES
('avocado', '6666', '안카도', '010-6666-6666', 'avocado@avocado.com', '영화감상', 
'001011', '4068518', '12345', '서울 강남구 삼성동', '111-11', '101동');

INSERT INTO tb_member (mem_userid, mem_userpw, mem_name, mem_hp, mem_email, mem_hobby, 
mem_ssn1, mem_ssn2, mem_zipcode, mem_address1, mem_address2, mem_address3) VALUES
('cherry', '7777', '김채리', '010-7777-7777', 'cherry@cherry.com', '영화감상', 
'001011', '4068518', '12345', '서울 강남구 삼성동', '111-11', '101동');


use front_class;


ALTER TABLE tb_member ADD mem_point int default 0;

-- 데이터 수정(UPDATE)
-- UPDATE 테이블명 SET 필드명1 = 값1, 필드명2 = 값2 .. ;
-- UPDATE 테이블명 SET 필드명1 = 값1, 필드명2 = 값2 ... WHERE 조건절;

SELECT * FROM tb_member;
UPDATE tb_member set mem_point = 1000;
-- safe mode 걸려있어서  처음엔 이런식으로 한꺼번에 수정안됨.. 풀어줄거임
-- safe mode 해제 : edit - preferences - safe update 해제

UPDATE tb_member set mem_point = mem_point + 200 WHERE mem_idx = 1;
UPDATE tb_member set mem_point = mem_point + 500 WHERE mem_idx = 2;
UPDATE tb_member set mem_point = mem_point + 200 WHERE mem_idx = 3;
UPDATE tb_member set mem_point = mem_point + 300 WHERE mem_idx = 4;
UPDATE tb_member set mem_point = mem_point + 500 WHERE mem_idx = 5;
UPDATE tb_member set mem_point = mem_point + 700 WHERE mem_idx = 6;


-- 아래껀 where절 없어서 전체에 적용
UPDATE tb_member set mem_point = mem_point + 500;

-- 데이터 삭제 (delete)
-- DELETE FROM 테이블명;
-- DELETE FROM 테이블명 WHERE 조건절;
DELETE FROM tb_member WHERE mem_userid = 'avocado';


-- 데이터 검색 (select)
-- SELECT 컬럼명1, 컬럼명2, .. FROM 테이블명;   *는 모든컬럼

SELECT mem_userid, mem_name, mem_point FROM tb_member;
-- 꼭 테이블의 컬럼순서대로 쓸 필요는 없음
SELECT mem_name, mem_userid, mem_point FROM tb_member;
SELECT * FROM tb_member;   -- dbms의 성능을 떨어트림. 속도가 느려지기때문.. 실제로 개발할때는 사용 x

-- SELECT 컬럼명1, 컬럼명2 .. FROM 테이블명 WHERE 조건절;
SELECT mem_idx, mem_userid, mem_name, mem_point FROM tb_member WHERE mem_idx = 1;

-- 비교연산자 (=,>,<, >=, <=, <>)
-- 비교연산자 = 는  where절에 나오지 않음. 그래서 구분가능함
SELECT mem_idx, mem_userid, mem_name, mem_point FROM tb_member WHERE mem_point >= 1500;

-- 논리연산자(and, or, not)
-- 로그인에 사용되는 쿼리문
SELECT mem_userid FROM tb_member WHERE mem_userid = 'banana' and mem_userpw='2222';
-- mem_point 가 1500이상 2000이하인 회원
SELECT mem_idx, mem_userid, mem_name, mem_point FROM tb_member WHERE mem_point  >= 1500 and mem_point <= 2000;
-- between A and b (결과는 위와 동일하게 나온다. 같은표현!)
SELECT mem_idx, mem_userid, mem_name, mem_point FROM tb_member WHERE mem_point between 1500 and 2000;

-- 베에리 집주소 null로 바꾸기
UPDATE tb_member set mem_zipcode=null, mem_address1=null, mem_address2 = null, mem_address3=null where mem_idx=6;

-- 주소가 없는 회원 찾기
SELECT mem_idx, mem_userid, mem_name, mem_point, mem_zipcode, mem_address1,mem_address2,mem_address3
FROM tb_member WHERE mem_zipcode is null;

SELECT mem_idx, mem_userid, mem_name, mem_point, mem_zipcode, mem_address1,mem_address2,mem_address3
FROM tb_member WHERE mem_zipcode is not null;

SELECT mem_idx, mem_userid, mem_name, mem_point FROM tb_member WHERE mem_userid IN ('apple','orange','berry');


-- SELECT 컬럼명1, 컬럼명2, .. FROM 테이블명 order by 정렬의 기준이 되는 컬럼 asc 또는 desc;
SELECT mem_idx, mem_userid, mem_name, mem_point FROM tb_member ORDER BY mem_point;  -- 오름차순 정렬
SELECT mem_idx, mem_userid, mem_name, mem_point FROM tb_member ORDER BY mem_point asc; -- 오름차순 정렬
SELECT mem_idx, mem_userid, mem_name, mem_point FROM tb_member ORDER BY mem_point desc; -- 내림차순 정렬

UPDATE tb_member SET mem_point = 1500 WHERE mem_userid = 'orange';
SELECT * FROM tb_member;

SELECT mem_idx, mem_userid, mem_name, mem_point FROM tb_member ORDER BY mem_point desc, mem_idx desc;

-- 다음수업을 위해 테이블 수정
-- 성별 컬럼 추가

ALTER TABLE tb_member ADD mem_gender enum('남자', '여자');  -- 둘중에하나는 무조건 선택해야하는..


-- 그룹
-- select 집계함수 또는 그룹을 맺은 컬럼 from 테이블명 group by 컬럼명;
-- 그룹함수(sum(), avg(), max(), min(), count())

SELECT mem_gender FROM tb_member GROUP BY mem_gender;

SELECT mem_gender, count(mem_idx) from tb_member group by mem_gender;
-- 굳이 idx넣은 이유가 뭘까?  인덱스는 무조건 있기때문에, 프라이머리 키기 때문에 속도상 유리

-- count 결과값에 열 이름 주는 방법 두가지
SELECT mem_gender, count(mem_idx) as cnt from tb_member group by mem_gender;
SELECT mem_gender, count(mem_idx) cnt from tb_member group by mem_gender;

SELECT mem_gender, count(mem_idx) as cnt,  sum(mem_point) as sum, max(mem_point) as max,
min(mem_point) as min, avg(mem_point) as avg  FROM tb_member GROUP BY mem_gender;


-- select 그룹함수 또는 그룹을 맺은 컬럼 from 테이블명 where 조건절 group by 컬럼명 having 조건절 order by 정렬컬럼
select mem_gender, count(mem_idx) as cnt from tb_member where mem_point > 0 group by mem_gender
having mem_gender='남자';

-- limit 범위
select mem_idx, mem_userid, mem_name, mem_point from tb_member limit 3; -- 처음부터 3개 선택
select mem_idx, mem_userid, mem_name, mem_point from tb_member limit 3,2; 
-- 중간에 있는 몇개를 뽑아서 보고싶다.   3개 다음의 2개를 보여줘

alter table tb_member drop mem_gender; -- 젠더컬럼 지움

create table tb_profile(
	pro_useridx int not null,
    pro_age int,
    pro_birthday varchar(20),
    pro_blood varchar(10),
    foreign key(pro_useridx) references tb_member(mem_idx)
);

desc tb_profile;

insert into tb_profile values (1, 20, '20001011', 'A형');

SELECT * FROM tb_profile;

select * from tb_member;
insert into tb_profile values (6, 30, '19951010', 'B형');
insert into tb_profile values (7, 28, '19921119', 'B형'); -- 이건안됨 왜냐하면 외래키 참조잡은곳에 7번회원이없기때문에

insert into tb_profile values(2, 23, '19991010', 'B형');
insert into tb_profile values(3, 25, '19971111', 'O형');


-- 테이블 병합(JOIN)
-- 데이터 베이스 내의 여러 테이블에서 가져온 레코드를 조합하여 하나의 테이블이나 결과집합으로 표현
-- inner join (교집합), left join, right join

-- inner join
SELECT mem_idx, mem_userid, mem_name, pro_age, pro_birthday FROM tb_member INNER JOIN tb_profile
ON tb_member.mem_idx = tb_profile.pro_useridx;

-- left join  주로 left table을 쓰게되는데 이유는  주로 A(앞에위치)테이블이 원본테이블이기때문
SELECT mem_idx, mem_userid, mem_name, pro_age, pro_birthday FROM tb_member LEFT JOIN tb_profile
ON tb_member.mem_idx = tb_profile.pro_useridx;

-- right join
SELECT mem_idx, mem_userid, mem_name, pro_age, pro_birthday FROM tb_member RIGHT JOIN tb_profile
ON tb_member.mem_idx = tb_profile.pro_useridx;

-- Create Read Update Delete   CRUD를 여태 공부한 것.




