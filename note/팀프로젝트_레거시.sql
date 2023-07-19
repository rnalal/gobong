--create user teamproject_legacy identified by 1234;
--grant connect, dba, resource to teamproject_legacy;

CREATE TABLE user1 (
    id varchar2(30) primary key,
    name varchar2(30) not null,
    pw varchar2(100) not null,
    email varchar2(100) not null,
    tel varchar2(15),
    regdate date default sysdate not null
);




CREATE TABLE follows (
    id varchar2(30),   --id가 following_id를 팔로우함
    following_id varchar2(30),
    foreign key(id) references user1(id)
);

commit;

CREATE TABLE board1 (
    no number primary key,
    id varchar2(30) ,
    content varchar2(500),
    hashtag varchar2(100),
    up number default 0,
    regdate date default sysdate not null,
    img1 varchar2(1000) not null,
    img2 varchar2(1000),
    img3 varchar2(1000),
    prv number default 0 --전체공개, 친구공개, 비공개
    ,foreign key(id) references user1(id)
);

-- 보드테이블 upcheck 삭제

alter table board1 drop column upcheck;


commit;

--0718
CREATE TABLE user1 (
    id varchar2(30) primary key,
    name varchar2(30) not null,
    pw varchar2(100) not null,
    email varchar2(100) not null,
    img varchar2(1000) DEFAULT '/img/myimg.jpg',
    tel varchar2(15),
    regdate date default sysdate not null
);

--유저테이블 수정으로 집어넣기

alter table user1 add img varchar2(1000) DEFAULT '/img/myimg.jpg';

desc user1;


-- 보드테이블 upcheck 삭제

CREATE TABLE board1 (
    no number primary key,
    id varchar2(30) ,
    content varchar2(500),
    hashtag varchar2(100),
    up number default 0,
    regdate date default sysdate not null,
    img1 varchar2(1000) not null,
    img2 varchar2(1000),
    img3 varchar2(1000),
    prv number default 0 --전체공개, 친구공개, 비공개
    ,foreign key(id) references user1(id)
);

--수정으로 컬럼제거

alter table board1 drop column upcheck;

desc board1;


--좋아요 테이블추가
--좋아요한 테이블 , 그리고 그걸 누른아이디 , 좋아요 유무
create table like1 (no number ,id varchar2(30) , upcheck number default 0 ,foreign key(no) references board1(no), foreign key(id) references user1(id));



commit;


----------------------------------------------------------------------------------------------------
-- 셀렉트구문


--본인을 팔로우한 사람 조회
select u.id from user1 u inner join follows f on f.id = u.id where f.following_id = 'test2';

--본인이 팔로우한 사람 조회
select u.id , f.following_id from user1 u inner join follows f on f.id = u.id where f.id = 'test1';

--본인이 팔로우한 사람의 게시물 리스트 조회
select b.id, b.no from board1 b inner join follows f on f.id = b.id where f.follower_id = 'sons1998' order by;
select pw from user1 where id = 'test1';

--------------------------------------------------------------------------------------------------------------

-- 더미테이블

-- 더미유저
insert into user1 values('test1','테스트유저','1234','dddd@test.com','010-0000-0000',default);
insert into user1 values('test2','테스트유저','1234','dddd@test.com','010-0000-0000',default);
insert into user1 values('test3','테스트유저','1234','dddd@test.com','010-0000-0000',default);
-- 더미팔로워
insert into follows values('test1','test2');
insert into follows values('test1','test3');

--더미게시글 (업체크 없앤후)
insert into board1 values (1, 'test1', '테스트내용1', '#해시태그', default, default, 'test1.jpg', 'img2.png', 'img3.png', default);
insert into board1 values (2, 'test1', '테스트내용2', '#해시태그', default, default, 'test2.jpg', 'img2.png', 'img3.png', default);
insert into board1 values (3, 'test1', '테스트내용3테스트내용3테스트내용3테스트내용3테스트내용3테스트내용3테스트내용3테스트내용3테스트내용3테스트내용3테스트내용3테스트내용3', 
'#해시태그', default, default, 'test3.jpg', 'img2.png', 'img3.png', default);

select * from board1;

commit;

-------------------------------------


--테스트테이블
CREATE TABLE test_board (
    no number primary key,
    content varchar2(500),
    img1 varchar2(1000) not null
);
insert into test_board values(1,'테스트내용입니다','file');
commit;
select * from test_board;

insert into board1 values (9, 'test1', '테스트내용1', '#해시태그', default, default, 'test1.jpg', 'img2.png', 'img3.png', default);
delete from board1 where no>=0;
commit;
select b.no,u.name, b.id, u.img, b.content, b.img1, b.hashtag, b.regdate from user1 u inner join board1 b on u.id=b.id order by b.no desc;
select * from board1;