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
insert into user1 values('test3', '테스트', '1234', 'test3@naver.com', default, '010-1234-1234', default);


commit;


CREATE TABLE follows (
    id varchar2(30),   --id가 following_id를 팔로우함
    following_id varchar2(30),
    foreign key(id) references user1(id)
);
select * from follows;

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



--좋아요 테이블추가
--좋아요한 테이블 , 그리고 그걸 누른아이디 , 좋아요 유무
create table like1 (no number ,id varchar2(30) , upcheck number default 0 ,foreign key(no) references board1(no), foreign key(id) references user1(id));

commit;
<<<<<<< HEAD

select * from like1;
=======
select * from like1;
select * from board1;
select * from user1;
insert into user1 values ('test3', '테스트', '1234', 'test3@naver.com', 'userimg.jpg', '010-1234-1234', default);
>>>>>>> 8863f5b994bd097f1a308f60fd9f960d797e5e7e


--댓글 테이블추가
--댓글 글번호, 게시글 번호, 댓글 단 사람의 아이디, 내용
create table reply (rno number primary key, no number, id varchar2(30), comment1 varchar2(500), foreign key(no) references board1(no), foreign key(id) references user1(id));

insert into reply values ('1', '4', 'test1', '댓글테스트');
insert into reply values ('2', '4', 'test1', '댓글테스트2');
insert into reply values ('3', '6', 'test1', '댓글테스트3');
insert into reply values ('4', '6', 'test1', '댓글테스트4');
<<<<<<< HEAD
insert into reply values ('5', '4', 'test1', '댓글테스트5');
=======
>>>>>>> 8863f5b994bd097f1a308f60fd9f960d797e5e7e
select * from reply;

select rno, no, id,comment1 from reply where no=4 order by rno desc; 

-- 댓글 개수 구하기
select count(rno) from reply where no=4;

select * from board1;
select * from reply;

select (select count(*) from reply where no = b.no) as reply_cnt from board1 b;
insert into reply values ('5', '6', 'test2', '테스트5');

select b.no,u.name, b.id, u.img, b.content, b.img1, b.hashtag, b.regdate,b.up, (select count(*) from reply where no = b.no) as reply_cnt from user1 u inner join board1 b on u.id=b.id order by b.no desc;

select * from like1;

<<<<<<< HEAD
=======
-- test1 계정 프로필 사진 및 이름 변경
update user1 set name = '왓섭이' where id = 'test1';
update user1 set img = 'dangdang.png' where id = 'test1';
select * from user1;

-- board1 더미데이터 (개행문자 ||CHAR(13)||CHAR(10)||)
select * from board1 order by no;

INSERT INTO board1 VALUES
(0, 'test1', '2010년 1월 4일에 태어난 왓섭이를 소개하겠습니다'||CHR(13)||CHR(10)||'매우 귀여우니 심장 조심하세요', 
'#2010년 #첫만남 #꼬물이', DEFAULT, DEFAULT, '00.jpg', '02.jpg', '01.jpg', DEFAULT);

INSERT INTO board1 VALUES
(1, 'test1', '1살쯤 됐나 이때부터 눈에 보이는 건 다 물고 다님'||CHR(13)||CHR(10)||'그러다 나까지 물어버림', 
'#1살 #말티즈', DEFAULT, DEFAULT, '03.jpg', '04.jpg', '05.jpg', DEFAULT);

INSERT INTO board1 VALUES
(2, 'test1', '미용 망해서 옷 사줌'||CHR(13)||CHR(10)||'기분이 몹시 언짢아보임', 
'#미용망함 #까까머리', DEFAULT, DEFAULT, '06.jpg', '07.jpg', '08.jpg', DEFAULT);

INSERT INTO board1 VALUES
(3, 'test1', '산책 나가면 신나서 막 날라댕김'||CHR(13)||CHR(10)||'날아라 말티쥬', 
'#점프 #댕신남 #메롱', DEFAULT, DEFAULT, '09.jpg', '10.jpg', '11.jpg', DEFAULT);

INSERT INTO board1 VALUES
(4, 'test1', '누나 몰래 음식 훔쳐먹다 걸린 썰 푼다'||CHR(13)||CHR(10)||'사실 먹기 전에 걸렸다', 
'#개도둑 #완전범죄실패 #범죄현장', DEFAULT, DEFAULT, '12.jpg', '13.jpg', '14.jpg', DEFAULT);

INSERT INTO board1 VALUES
(5, 'test1', '팬아트 선물받음'||CHR(13)||CHR(10)||'길쭉길쭉 모델견', 
'#롱다리 #닭발컷', DEFAULT, DEFAULT, '15.png', '16.jpg', null, DEFAULT);

INSERT INTO board1 VALUES
(6, 'test1', '증사 찍었다'||CHR(13)||CHR(10)||'긴장해서 실물보다 못 나온듯', 
'#증사 #증명사진 #실물파', DEFAULT, DEFAULT, '17.jpg', '18.jpg', '19.jpg', DEFAULT);

INSERT INTO board1 VALUES
(7, 'test1', '자는데 왜 깨워'||CHR(13)||CHR(10)||'졸리다고', 
'#개졸려 #하품 #고슴도치', DEFAULT, DEFAULT, '21.jpg', '22.jpg', '20.jpg', DEFAULT);

INSERT INTO board1 VALUES
(8, 'test1', '만사 귀찬타'||CHR(13)||CHR(10)||'암것도 하기 실타', 
'#고라파덕 #귀찮', DEFAULT, DEFAULT, '23.jpg', '24.jpg', null, DEFAULT);

INSERT INTO board1 VALUES
(9, 'test1', '조명 맛집에서 셀카'||CHR(13)||CHR(10)||'눈에 별 박았음', 
'#개미남 #렌즈', DEFAULT, DEFAULT, '25.jpg', '26.jpg', null, DEFAULT);

INSERT INTO board1 VALUES
(10, 'test1', '산책 인싸템 장만했다'||CHR(13)||CHR(10)||'밤산책 어서오고', 
'#꿀벌가방 #산책LED', DEFAULT, DEFAULT, '27.jpg', null, null, DEFAULT);

INSERT INTO board1 VALUES
(11, 'test1', '사진 찍지 말고 빨리 와라', 
'#눈으로 욕하기 #빨리빨리', DEFAULT, DEFAULT, '28.jpg', '29.jpg', '30.jpg', DEFAULT);

INSERT INTO board1 VALUES
(12, 'test1', '털찌는 과정',
'#살인미소 #메롱', DEFAULT, DEFAULT, '31.jpg', '32.jpg', '33.jpg', DEFAULT);

INSERT INTO board1 VALUES
(13, 'test1', '사진 찍지 말고 빨리 와라 2'||CHR(13)||CHR(10)||'겨울에도 이러네', 
'#겨울산책 #패딩', DEFAULT, DEFAULT, '34.jpg', '35.jpg', null, DEFAULT);

INSERT INTO board1 VALUES
(14, 'test1', '먹방 찍기 시작함'||CHR(13)||CHR(10)||'더 줘', 
'#황태츄 #개껌', DEFAULT, DEFAULT, '36.jpg', '37.jpg', '38.jpg', DEFAULT);

INSERT INTO board1 VALUES
(15, 'test1', '생일이라 놀러가서 사진 찍음', 
'#생파 #선글라스', DEFAULT, DEFAULT, '39.jpg', '40.jpg', '41.jpg', DEFAULT);

INSERT INTO board1 VALUES
(16, 'test1', '요즘 근황', 
'#키티 #닌텐도', DEFAULT, DEFAULT, '42.jpg', '43.jpg', null, DEFAULT);

select * from board1;

COMMIT;


-- user1에 whatsup, dubu, mori, tama 계정 4개 추가 / 프로필 사진 변경
INSERT INTO user1 VALUES('whatsup', '왓섭', '1234', 'whatsup@dang.com', '/whatsup/whatsup.png', '010-7979-0102', '2010-01-04');
INSERT INTO user1 VALUES('dubu', '두부', '1234', 'dubu@dang.com', '/dutamo/dubu.png', '010-7979-0505', '2013-05-05');
INSERT INTO user1 VALUES('tama', '타마', '1234', 'tama@meow.com', '/dutamo/tama.png', '010-7979-1026', '2022-10-26');
INSERT INTO user1 VALUES('mori', '모리', '1234', 'mori@meow.com', '/dutamo/mori.png', '010-7979-1226', '2022-12-26');
select * from user1;

-- board1 더미데이터 (개행문자 ||CHAR(13)||CHAR(10)||)  delete from board1;
select * from board1 order by no;

INSERT INTO board1 VALUES
(0, 'whatsup', '2010년 1월 4일에 태어난 우리 왓섭이'||CHR(13)||CHR(10)||'매우 귀여우니 심장 조심', 
'#2010년 #첫만남 #꼬물이', DEFAULT, DEFAULT, '/whatsup/00.jpg', '/whatsup/02.jpg', '/whatsup/01.jpg', DEFAULT);

INSERT INTO board1 VALUES
(1, 'whatsup', '1살쯤 됐나 이때부터 눈에 보이는 건 다 물고 다님'||CHR(13)||CHR(10)||'그러다 나까지 물어버림', 
'#1살 #말티즈', DEFAULT, DEFAULT, '/whatsup/03.jpg', '/whatsup/04.jpg', '/whatsup/05.jpg', DEFAULT);

INSERT INTO board1 VALUES
(2, 'whatsup', '미용 망해서 옷 사줌'||CHR(13)||CHR(10)||'기분이 몹시 언짢아보임', 
'#미용망함 #까까머리', DEFAULT, DEFAULT, '/whatsup/06.jpg', '/whatsup/07.jpg', '/whatsup/08.jpg', DEFAULT);

INSERT INTO board1 VALUES
(3, 'whatsup', '산책 나가면 신나서 막 날라댕김'||CHR(13)||CHR(10)||'날아라 말티쥬', 
'#점프 #댕신남 #메롱', DEFAULT, DEFAULT, '/whatsup/09.jpg', '/whatsup/10.jpg', '/whatsup/11.jpg', DEFAULT);

INSERT INTO board1 VALUES
(4, 'whatsup', '누나 몰래 음식 훔쳐먹다 걸린 썰 푼다'||CHR(13)||CHR(10)||'사실 먹기 전에 걸렸다', 
'#개도둑 #완전범죄실패 #범죄현장', DEFAULT, DEFAULT, '/whatsup/12.jpg', '/whatsup/13.jpg', '/whatsup/14.jpg', DEFAULT);

INSERT INTO board1 VALUES
(5, 'whatsup', '팬아트 선물받음'||CHR(13)||CHR(10)||'길쭉길쭉 모델견', 
'#롱다리 #닭발컷', DEFAULT, DEFAULT, '/whatsup/15.png', '/whatsup/16.jpg', null, DEFAULT);

INSERT INTO board1 VALUES
(6, 'whatsup', '증사 찍었다'||CHR(13)||CHR(10)||'긴장해서 실물보다 못 나온듯', 
'#증사 #증명사진 #실물파', DEFAULT, DEFAULT, '/whatsup/17.jpg', '/whatsup/18.jpg', '/whatsup/19.jpg', DEFAULT);

INSERT INTO board1 VALUES
(7, 'whatsup', '자는데 왜 깨워'||CHR(13)||CHR(10)||'졸리다고', 
'#개졸려 #하품 #고슴도치', DEFAULT, DEFAULT, '/whatsup/21.jpg', '/whatsup/22.jpg', '/whatsup/20.jpg', DEFAULT);

INSERT INTO board1 VALUES
(8, 'whatsup', '만사 귀찬타'||CHR(13)||CHR(10)||'암것도 하기 실타', 
'#고라파덕 #귀찮', DEFAULT, DEFAULT, '/whatsup/23.jpg', '/whatsup/24.jpg', null, DEFAULT);

INSERT INTO board1 VALUES
(9, 'whatsup', '조명 맛집에서 셀카'||CHR(13)||CHR(10)||'눈에 별 박았음', 
'#개미남 #렌즈', DEFAULT, DEFAULT, '/whatsup/25.jpg', '/whatsup/26.jpg', null, DEFAULT);

INSERT INTO board1 VALUES
(10, 'whatsup', '산책 인싸템 장만했다'||CHR(13)||CHR(10)||'밤산책 어서오고', 
'#꿀벌가방 #산책LED', DEFAULT, DEFAULT, '/whatsup/27.jpg', null, null, DEFAULT);

INSERT INTO board1 VALUES
(11, 'whatsup', '사진 찍지 말고 빨리 와라', 
'#눈으로 욕하기 #빨리빨리', DEFAULT, DEFAULT, '/whatsup/28.jpg', '/whatsup/29.jpg', '/whatsup/30.jpg', DEFAULT);

INSERT INTO board1 VALUES
(12, 'whatsup', '털찌는 과정',
'#살인미소 #메롱', DEFAULT, DEFAULT, '/whatsup/31.jpg', '/whatsup/32.jpg', '/whatsup/33.jpg', DEFAULT);

INSERT INTO board1 VALUES
(13, 'whatsup', '사진 찍지 말고 빨리 와라 2'||CHR(13)||CHR(10)||'겨울에도 이러네', 
'#겨울산책 #패딩', DEFAULT, DEFAULT, '/whatsup/34.jpg', '/whatsup/35.jpg', null, DEFAULT);

INSERT INTO board1 VALUES
(14, 'whatsup', '먹방 찍기 시작함'||CHR(13)||CHR(10)||'더 줘', 
'#황태츄 #개껌', DEFAULT, DEFAULT, '/whatsup/36.jpg', '/whatsup/37.jpg', '/whatsup/38.jpg', DEFAULT);

INSERT INTO board1 VALUES
(15, 'whatsup', '생일이라 놀러가서 사진 찍음', 
'#생파 #선글라스', DEFAULT, DEFAULT, '/whatsup/39.jpg', '/whatsup/40.jpg', '/whatsup/41.jpg', DEFAULT);

INSERT INTO board1 VALUES
(16, 'whatsup', '요즘 근황', 
'#키티 #닌텐도', DEFAULT, DEFAULT, '/whatsup/42.jpg', '/whatsup/43.jpg', null, DEFAULT);

INSERT INTO board1 VALUES
(17, 'mori', '어서와 박스냥은 처음이지', 
'#캣타워 #박스', DEFAULT, DEFAULT, '/dutamo/mori00.jpg', '/dutamo/mori01.jpg', null, DEFAULT);

INSERT INTO board1 VALUES
(18, 'mori', '오늘의 할 일'||CHR(13)||CHR(10)||'낮잠 자기', 
'#zzZ #낮잠', DEFAULT, DEFAULT, '/dutamo/mori04.jpg', null, null, DEFAULT);

INSERT INTO board1 VALUES
(19, 'dubu', '촉촉한 초코칩'||CHR(13)||CHR(10)||'까만콩 세 개', 
'#까만콩 #초코칩 #뷰러입술', DEFAULT, DEFAULT, '/dutamo/dubu01.jpg', '/dutamo/dubu02.jpg', '/dutamo/dubu00.jpg', DEFAULT);

INSERT INTO board1 VALUES
(20, 'tama', '머해'||CHR(13)||CHR(10)||'나랑 놀아', 
'#아이컨택 #장화신은 #고양이', DEFAULT, DEFAULT, '/dutamo/tama03.jpg', '/dutamo/tama05.jpg', '/dutamo/tama04.jpg', DEFAULT);

INSERT INTO board1 VALUES
(21, 'tama', '요즘은 냥북이 대세', 
'#냥북 #맥북 #노트북', DEFAULT, DEFAULT, '/dutamo/tama00.jpg', '/dutamo/tama02.jpg', '/dutamo/tama01.jpg', DEFAULT);

INSERT INTO board1 VALUES
(22, 'mori', '눕는게 제일 좋아', 
'#눕냥 #이불 #침대', DEFAULT, DEFAULT, '/dutamo/mori02.jpg', '/dutamo/mori03.jpg', '/dutamo/mori05.jpg', DEFAULT);

select * from reply;
-- 팔로우 팔로잉 추가 delete from follows;
select * from follows;

INSERT INTO follows VALUES ('whatsup', 'dubu');
INSERT INTO follows VALUES ('whatsup', 'tama');
INSERT INTO follows VALUES ('whatsup', 'mori');

INSERT INTO follows VALUES ('dubu', 'whatsup');
INSERT INTO follows VALUES ('dubu', 'tama');
INSERT INTO follows VALUES ('dubu', 'mori');

INSERT INTO follows VALUES ('tama', 'dubu');
INSERT INTO follows VALUES ('tama', 'whatsup');
INSERT INTO follows VALUES ('tama', 'mori');

INSERT INTO follows VALUES ('mori', 'dubu');
INSERT INTO follows VALUES ('mori', 'whatsup');
INSERT INTO follows VALUES ('mori', 'tama');

COMMIT;

create table introduceMe1 (id varchar2(30), content1 varchar2(1000), foreign key(id) references user1(id));





>>>>>>> 8863f5b994bd097f1a308f60fd9f960d797e5e7e
commit;
