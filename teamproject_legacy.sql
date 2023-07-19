create user teamproject_legacy identified by 1234;
grant connect, dba, resource to teamproject_legacy;

DROP TABLE user1 CASCADE CONSTRAINT PURGE ;
삭제 먼저 

CREATE TABLE user1 (
    id varchar2(30) primary key,
    name varchar2(30) not null,
    pw varchar2(100) not null,
    email varchar2(100) not null,
    img varchar2(1000) DEFAULT '/img/myimg.jpg',
    tel varchar2(15),
    regdate date default sysdate not null
);

insert into user1 values ('test1', '테스트', '1234', 'test@naver.com', 'userimg.jpg', '010-1111-1111', default);
select * from user1;

commit;


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
alter table board1 drop column upcheck;
select * from board1;

UPDATE [테이블] SET [열] = '변경할값' WHERE [조건];
update board1 set hashtag='#태그' where no=1;
update board1 set content='수정내용', hashtag='#태그', img1='test1.jpg', img2='test2.jpg', img3='test3.jpg', prv='0' where no=4;
delete from board1 where no=4;
insert into board1 values (1, 'test1', '테스트내용1', '#해시태그', default, default, 'test1.jpg', 'img2.png', 'img3.png', default);
insert into board1 values (2, 'test1', '테스트내용2', '#해시태그', default, default, 'test2.jpg', 'img2.png', 'img3.png', default);
insert into board1 values (3, 'test1', '테스트내용3테스트내용3테스트내용3테스트내용3테스트내용3테스트내용3테스트내용3테스트내용3테스트내용3테스트내용3테스트내용3테스트내용3', '#해시태그', default, default, 'test3.jpg', 'img2.png', 'img3.png', default);
insert into board1 values (4, 'test1', '수정테스트', '#해시태그', default, default, 'test1.jpg', 'test2.jpg', 'test3.jpg', default);

-- 게시글 전체 목록 조회하기
select u.name, b.id, u.img, b.content, b.img1, b.hashtag, b.regdate from user1 u inner join board1 b on u.id=b.id order by b.no desc;

-- 친구 게시글 목록 조회하기
select f.following_id, b.id, b.content, b.

-- 내가 쓴 게시글 목록 보기
select no, id, content, hashtag, regdate from board1 where id='test1' order by no desc;

-- 게시글 상세보기
select u.name, b.id, u.img, b.content, b.img1, b.img2, b.img3, b.hashtag, b.regdate from user1 u inner join board1 b on u.id=b.id where no=3 order by b.no desc;
select b.no, u.name, b.id, u.img, b.content, b.img1, b.img2, b.img3, b.hashtag, b.regdate from user1 u inner join board1 b on u.id=b.id where no=2 order by b.no desc;

select no, id, content, hashtag, regdate from board1 order by no desc;

commit;

insert into board1 values(3, 'wjdwnsgk', '안녕하세요123456666');

insert into user1 values('sons1998', '손승기');
insert into user1 values('dbwotjr', '유재석');
insert into user1 values('wjdwnsgk', '정준하');
insert into user1 values('qkraudtn', '박명수');
select * from follows;
insert into follows values(1, 'sons1998', 'dbwotjr');
insert into follows values(2, 'sons1998', 'wjdwnsgk');
insert into follows values(3, 'qkraudtn', 'sons1998');
insert into follows values(4, 'qkraudtn', 'dbwotjr');

--본인을 팔로우한 사람 조회
select u.id from user1 u inner join follows f on f.id = u.id where f.following_id = 'dbwotjr';

--본인이 팔로우한 사람 조회
select f.following_id from user1 u inner join follows f on f.id = u.id where f.id = 'test1';

--본인이 팔로우한 사람의 게시물 리스트 조회
select b.id, b.no from board1 b inner join follows f on f.id = b.id where f.follower_id = 'test1' order by;

select * from board1;
update board1 set content='수정', hashtag='#수정', img1='test1.jpg', img2='test2.jpg', img3='test3.jpg' where no=4;




commit;


select * from board1;

select b.no, u.name, b.id, b.up, b.prv, u.img, b.content, b.img1, b.img2, b.img3, b.hashtag, b.regdate from user1 u inner join board1 b on u.id=b.id where no=4;

