INSERT INTO `Customer` VALUES ('760121-1234567', '정우성', '서울', '1976-01-21', NULL, '010-1101-7601', '배우');
INSERT INTO `Customer` VALUES ('750611-1234567', '이정재', '서울', '1975-06-11', NULL, '010-1102-7506', '배우');
INSERT INTO `Customer` VALUES ('890530-1234567', '전지현', '대전', '1989-05-30', 'jjh@naver.com', '010-1103-8905', '자영업');
INSERT INTO `Customer` VALUES ('790413-1234567', '이나영', '대전', '1979-04-13', 'lee@naver.com', '010-2101-7904', '회사원');
INSERT INTO `Customer` VALUES ('660912-1234567', '원빈', '대전', '1966-09-12', 'one@daum.net', '010-2104-6609', '배우');
INSERT INTO `Customer` VALUES ('790728-1234567', '장동건', '대구', '1979-07-28', 'jang@naver.com', '010-3101-7907', '배우');
INSERT INTO `Customer` VALUES ('840615-1234567', '고소영', '대구', '1984-06-15', 'goso@daum.net', '010-4101-8406', '회사원');
INSERT INTO `Customer` VALUES ('651021-1234567', '김연아', '대구', '1965-10-21', 'yuna@daum.net', '010-5101-6510', '운동선수');
INSERT INTO `Customer` VALUES ('721128-1234567', '유재석', '부산', '1972-11-28', NULL, '010-6101-7211', '개그맨');
INSERT INTO `Customer` VALUES ('920907-1234567', '강호동', '부산', '1992-09-07', NULL, '010-7103-9209', '개그맨');
INSERT INTO `Customer` VALUES ('891209-1234567', '조인성', '광주', '1989-12-09', 'join@gmail.com', '010-7104-8912', '배우');
INSERT INTO `Customer` VALUES ('770314-1234567', '강동원', '광주', '1977-03-14', 'dong@naver.com', '010-8101-7703', '배우');

INSERT INTO `Card` VALUES ('2111-1001-1001', '760121-1234567', '1011-1001-1001', '2020-01-21', 1000000, '2020-02-10', 'check');
INSERT INTO `Card` VALUES ('2041-1001-1002', '890530-1234567', '1011-1001-1002', '2020-06-11', 3000000, '2020-06-15', 'check');
INSERT INTO `Card` VALUES ('2011-1001-1003', '790413-1234567', '1011-1001-1003', '2020-05-30', 5000000, '2020-06-25', 'check');
INSERT INTO `Card` VALUES ('2711-1001-1004', '660912-1234567', NULL, '2020-04-13', 1000000, '2020-05-10', 'credit');
INSERT INTO `Card` VALUES ('2611-1001-1005', '840615-1234567', '1011-1002-1005', '2020-09-12', 1500000, '2020-10-10', 'check');
INSERT INTO `Card` VALUES ('2781-1001-1006', '651021-1234567', '1011-1002-1006', '2020-07-28', 10000000, '2020-08-15', 'check');
INSERT INTO `Card` VALUES ('2345-1001-1007', '721128-1234567', '1011-1001-1007', '2020-06-15', 2000000, '2020-07-25', 'check');
INSERT INTO `Card` VALUES ('2221-1001-1008', '920907-1234567', NULL, '2020-10-21', 5000000, '2020-11-15', 'credit');
INSERT INTO `Card` VALUES ('2144-1001-1009', '891209-1234567', '1011-1001-1009', '2020-11-28', 1000000, '2020-12-10', 'check');
INSERT INTO `Card` VALUES ('2789-1001-1010', '770314-1234567', NULL, '2020-09-07', 1000000, '2020-10-10', 'credit');

INSERT INTO `Account` VALUES ('1011-1001-1001', '760121-1234567', '자유입출금', 4160000, 'Y', '2023-01-21 13:00:02');
INSERT INTO `Account` VALUES ('1011-1001-1002', '890530-1234567', '자유입출금', 376000, 'Y', '2023-06-11 13:00:02');
INSERT INTO `Account` VALUES ('1011-1001-1003', '790413-1234567', '자유입출금', 1200000, 'Y', '2023-05-30 13:00:02');
INSERT INTO `Account` VALUES ('1011-2001-1004', '660912-1234567', '정기적금', 1000000, 'N', '2023-04-13 13:00:02');
INSERT INTO `Account` VALUES ('1011-1002-1005', '840615-1234567', '자유입출금', 820000, 'Y', '2023-09-12 13:00:02');
INSERT INTO `Account` VALUES ('1011-1002-1006', '651021-1234567', '자유입출금', 3520000, 'Y', '2023-07-28 13:00:02');
INSERT INTO `Account` VALUES ('1011-1001-1007', '721128-1234567', '자유입출금', 7620500, 'Y', '2023-06-15 13:00:02');
INSERT INTO `Account` VALUES ('1011-2001-1008', '920907-1234567', '정기적금', 3400000, 'N', '2023-10-21 13:00:02');
INSERT INTO `Account` VALUES ('1011-1001-1009', '891209-1234567', '자유입출금', 1763000, 'Y', '2023-11-28 13:00:02');
INSERT INTO `Account` VALUES ('1011-2001-1010', '770314-1234567', '정기적금', 1080000, 'N', '2023-09-07 13:00:02');

INSERT INTO `Transaction` VALUES (1, '1011-1001-1001', '입금', '2월 정기급여', 3500000, '2023-02-10 12:36:12');
INSERT INTO `Transaction` VALUES (2, '1011-1001-1003', '출금', 'ATM 출금', 300000, '2023-02-10 12:37:21');
INSERT INTO `Transaction` VALUES (3, '1011-1001-1001', '입금', '2월 급여', 2800000, '2023-02-10 12:38:21');
INSERT INTO `Transaction` VALUES (4, '1011-1001-1007', '출금', '2월 공과금', 116200, '2023-02-10 12:39:21');
INSERT INTO `Transaction` VALUES (5, '1011-1001-1005', '출금', 'ATM 출금', 50000, '2023-02-10 12:40:21');
INSERT INTO `Transaction` VALUES (6, '1011-1001-1007', '입금', '홍길동 이체', 400000, '2023-02-10 12:41:21');
INSERT INTO `Transaction` VALUES (7, '1011-1001-1007', '출금', '2월 관리비', 145000, '2023-02-10 12:42:21');
INSERT INTO `Transaction` VALUES (8, '1011-1001-1002', '입금', '홍길동 입금', 200000, '2023-02-10 12:43:21');
INSERT INTO `Transaction` VALUES (9, '1011-1001-1009', '입금', '연말정산 환급', 112000, '2023-02-10 12:44:21');
INSERT INTO `Transaction` VALUES (10, '1011-1001-1006', '출금', 'ATM 출금', 30000, '2023-02-10 12:45:21');


# 1. 고객 테이블 조회
SELECT * FROM `Customer`;

#2. 카드 테이블 조회
SELECT * FROM `Card`;

#3. 예금계좌 테이블 조회
SELECT * FROM `Account`;

#4. 예금계좌거래내역 테이블 조회
SELECT * FROM `Transaction`;

#5. 카드종류가 신용카드인 고객에 대한 모든 정보(고객명, 주소, 생년월일, 이메일, 전화번호, 직업) 조회
SELECT a.cust_name, a.cust_addr, a.cust_birth, a.cust_email, a.cust_phnum, a.cust_job 
		FROM `Customer` AS a JOIN `Card` AS b
		ON a.cust_jumin = b.cust_jumin
		WHERE `card_type` = 'credit';

#6. 예금잔고가 4,000,000원 이상 고객에 대한 고객명, 주민번호, 전화번호, 주소 조회
SELECT a.cust_name, a.cust_jumin, a.cust_phnum, a.cust_addr
		FROM `Customer` AS a JOIN `Account` AS b
		ON a.cust_jumin = b.cust_jumin
		WHERE `acc_balance` >= 4000000;