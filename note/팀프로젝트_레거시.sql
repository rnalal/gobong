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
    upcheck number default 0,   --좋아요 눌렀는지 안눌렀는지
    img1 varchar2(1000) not null,
    img2 varchar2(1000),
    img3 varchar2(1000),
    prv number default 0 --전체공개, 친구공개, 비공개
    ,foreign key(id) references user1(id)
);

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
select u.id from user1 u inner join follows f on f.id = u.id where f.id = 'sons1998';

--본인이 팔로우한 사람의 게시물 리스트 조회
select b.id, b.no from board1 b inner join follows f on f.id = b.id where f.follower_id = 'sons1998' order by;


commit;

