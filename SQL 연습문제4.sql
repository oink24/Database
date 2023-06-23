# 날짜 : 2023/06/23
# 이름 : 강나은
# 내용 : SQL 연습문제4 풀이

#-----실습4-1
# 실습 데이터베이스와 사용자 생성하기
CREATE DATABASE `BookStore`;
CREATE USER 'admin4'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON `BookStore`.* TO 'admin4'@'%';
FLUSH PRIVILEGES;


#-----실습4-2
# 고객테이블 생성하기
CREATE TABLE `Customer` (
		`custId` INT AUTO_INCREMENT PRIMARY KEY,
		`name` VARCHAR(10) NOT NULL,
		`address` VARCHAR(20) DEFAULT NULL,
		`phone` VARCHAR(13) DEFAULT NULL
);

# 책테이블 생성하기
CREATE TABLE `Book` (
		`bookId` INT PRIMARY KEY,
		`bookName` VARCHAR(20) NOT NULL,
		`publisher` VARCHAR(20) NOT NULL,
		`price` INT DEFAULT NULL
);

# 주문테이블 생성하기
CREATE TABLE `Order` (
		`orderId` INT AUTO_INCREMENT PRIMARY KEY,
		`custId` INT NOT NULL,
		`bookId` INT NOT NULL,
		`salePrice` INT NOT NULL,
		`orderDate` DATE NOT NULL
);


#-----실습4-3
# 고객테이블에 데이터 추가하기
INSERT INTO `Customer` VALUES (1, '박지성', '영국 맨체스타', '000-5000-0001');
INSERT INTO `Customer` VALUES (2, '김연아', '대한민국 서울', '000-6000-0001');
INSERT INTO `Customer` VALUES (3, '장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO `Customer` VALUES (4, '추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO `Customer` VALUES (5, '박세리', '대한민국 대전', NULL);

# 책테이블에 데이터 추가하기
INSERT INTO `book` VALUES (1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO `book` VALUES (2, '축구아는 여자', '나무수', 13000);
INSERT INTO `book` VALUES (3, '축구의 이해', '대한미디어', 22000);
INSERT INTO `book` VALUES (4, '골프바이블', '대한미디어', 35000);
INSERT INTO `book` VALUES (5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO `book` VALUES (6, '역도 단계별기술', '굿스포츠', 6000);
INSERT INTO `book` VALUES (7, '야구의 추억', '이상미디어', 20000);
INSERT INTO `book` VALUES (8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO `book` VALUES (9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO `book` VALUES (10, 'Olympic Champions', 'Pearson', 13000);

# 주문테이블에 데이터 추가하기
INSERT INTO `Order` VALUES (NULL, 1, 1, 6000, '2014-07-01');
INSERT INTO `Order` VALUES (NULL, 1, 3, 21000, '2014-07-03');
INSERT INTO `Order` VALUES (NULL, 2, 5, 8000, '2014-07-03');
INSERT INTO `Order` VALUES (NULL, 3, 6, 6000, '2014-07-04');
INSERT INTO `Order` VALUES (NULL, 4, 7, 20000, '2014-07-05');
INSERT INTO `Order` VALUES (NULL, 1, 2, 12000, '2014-07-07');
INSERT INTO `Order` VALUES (NULL, 4, 8, 13000, '2014-07-07');
INSERT INTO `Order` VALUES (NULL, 3, 10, 12000, '2014-07-08');
INSERT INTO `Order` VALUES (NULL, 2, 10, 7000, '2014-07-09');
INSERT INTO `Order` VALUES (NULL, 3, 8, 13000, '2014-07-10');


#-----실습4-4
# 모든 회원의 회원번호, 이름, 주소를 조회하시오.
SELECT `custId`, `name`, `address` FROM `Customer`;


#-----실습4-5
# 모든 도서의 이름과 가격을 조회하시오.
SELECT `bookName`, `price` FROM `book`;


#-----실습4-6
# 모든 도서의 가격과 이름을 조회하시오.
SELECT `price`, `bookName` FROM `book`;


#-----실습4-7
# 모든 도서의 도서번호, 도서이름, 출판사, 가격을 조회하시오.
SELECT `bookId`, `bookName`, `publisher`, `price` FROM `book`;


#-----실습4-8
# 도서테이블에 있는 모든 출판사를 조회하시오.
SELECT `publisher` FROM `book`;


#-----실습4-9
# 도서테이블에 있는 모든 출판사를 조회하시오. 단, 조회 결과에서 중복을 제거하시오.
SELECT DISTINCT `publisher` FROM `book`;


#-----실습4-10
# 가격이 20,000원 이상인 도서를 조회하시오.
SELECT * FROM `book` WHERE `price` >= 20000;


#-----실습4-11
# 가격이 20,000원 미만인 도서를 조회하시오.
SELECT * FROM `book` WHERE `price` < 20000;


#-----실습4-12
# 가격이 10,000원 이상 20,000 이하인 도서를 조회하시오.
SELECT * FROM `book` WHERE `price` >= 10000 AND `price` <= 20000;


#-----실습4-13
# 가격이 15,000원 이상 30,000원 이하인 도서의 도서번호, 도서명, 도서가격을 조회하시오.
SELECT `bookId`, `bookName`, `price` FROM `book` WHERE `price` >= 15000 AND `price` <= 30000


#-----실습4-14
# 도서번호가 2, 3, 5인 도서를 조회하시오.
SELECT * FROM `book` WHERE `bookId` IN ('2', '3', '5');


#-----실습4-15
# 도서번호가 짝수번호인 도서를 조회하시오.
SELECT * FROM `book` WHERE MOD(bookId, 2) = 0;


#-----실습4-16
# 박씨 성 고객을 조회하시오.
SELECT * FROM `Customer` WHERE `name` LIKE '박%';


#-----실습4-17
# 대한민국에 거주하는 고객을 조회하시오.
SELECT * FROM `Customer` WHERE `address` LIKE '대한민국%';


#-----실습4-18
# 휴대폰 번호가 유효한 고객만 조회하시오.
SELECT * FROM `Customer` WHERE `phone` IS NOT NULL;


#-----실습4-19
# 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 조회하시오.
SELECT * FROM `book` WHERE `publisher` IN ('굿스포츠', '대한미디어');


#-----실습4-20
# '축구의 역사'를 출간한 출판사를 조회하시오.
SELECT `publisher` FROM `book` WHERE `bookName` = '축구의 역사';


#-----실습4-21
# 도서이름에 `축구`가 포함된 출판사를 조회하시오.
SELECT `publisher` FROM `book` WHERE `bookName` LIKE '%축구%';


#-----실습4-22
# 도서이름의 왼쪽 두 번째 위치에 '구'라는 문자열을 갖는 도서를 조회하시오.
SELECT * FROM `book` WHERE `bookName` LIKE '_구%';


#-----실습4-23
# 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 조회하시오.
SELECT * FROM `book` WHERE `bookName` LIKE '%축구%' AND `price` >= 20000;


#-----실습4-24
# 도서를 이름순으로 조회하시오.
SELECT * FROM `book` order BY `bookName`;


#-----실습4-25
# 도서를 가격순으로 조회하고, 가격이 같으면 이름순으로 조회하시오.
SELECT * FROM `book` order BY `price`, `bookName`;


#-----실습4-26
# 도서를 가격의 내림차순으로 조회하시오. 단, 가격이 같다면 출판사를 오름차순으로 조회
SELECT * FROM `book` order BY `price` DESC, `publisher`;


#-----실습4-27
# 도서가격이 큰 1, 2, 3위 도서를 조회하시오.
SELECT * FROM `book` order BY `price` DESC LIMIT 3;


#-----실습4-28
# 도서가격이 작은 1, 2, 3위 도서를 조회하시오.
SELECT * FROM `book` order BY `price` LIMIT 3;


#-----실습4-29
# 고객이 주문한 도서의 총 판매액을 조회하시오.
SELECT SUM(`salePrice`) AS `총판매액` FROM `Order`;


#-----실습4-30
# 고객이 주문한 도서의 총 판매액, 평균값, 최저가, 최고가를 조회하시오.
SELECT 
		 SUM(`salePrice`) AS `총판매액`,
		 AVG(`salePrice`) AS `평균값`,
		 MIN(`salePrice`) AS `최저가`,
		 MAX(`salePrice`) AS `최고가`
		FROM `Order`;


#-----실습4-31
# 도서 판매 건수를 조회하시오.
SELECT COUNT(`orderId`) AS `판매건수` FROM `Order`;


#-----실습4-32
# 도서제목에 야구가 포함된 도서를 농구로 변경한 후 도서목록을 조회하시오.
UPDATE `book` 
		SET `bookName` = REPLACE(bookName, '야구', '농구')
		WHERE `bookName` LIKE '%야구%';

SELECT * FROM `book`;


#-----실습4-33
# 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문도서의 총 수량을 조회하시오.
# 단, 두 권 이상 구매한 고객만 조회할 것
SELECT a.`custId`, COUNT(b.`bookId`) AS `수량`
		FROM `Customer` AS a
		JOIN `Order` AS b
		ON a.custId = b.custId
		JOIN `Book` AS c
		ON b.bookId = c.bookId
		WHERE c.`price` >= 8000
		GROUP BY `custId`
		HAVING `수량` >= 2;


#-----실습4-34
# 고객과 고객의 주문에 관한 데이터를 모두 조회하시오.
SELECT * FROM `Customer` AS a
		JOIN `Order` AS b
		ON a.custId = b.custId;


#-----실습4-35
# 고객과 고객의 주문에 관한 데이터를 고객번호 순으로 정렬하여 조회하시오.
SELECT * FROM `Customer` AS a
		JOIN `Order` AS b
		ON a.custId = b.custId
		order BY a.`custId`;


#-----실습4-36
# 고객의 이름과 고객이 주문한 도서의 판매가격을 조회하시오.
SELECT a.`name`, b.`salePrice` 
		FROM `Customer` AS a
		JOIN `Order` AS b
		ON a.custId = b.custId;


#-----실습4-37
# 고객별로 주문한 모든 도서의 총 판매액을 조회하고, 고객별로 정렬하시오.
SELECT a.`name`, SUM(salePrice)
		FROM `Customer` AS a
		JOIN `Order` AS b
		ON a.custId = b.custId
		GROUP BY a.`name`;


#-----실습4-38
# 고객의 이름과 고객이 주문한 도서의 이름을 조회하시오.
SELECT a.`name`, c.`bookName`
		FROM `Customer` AS a
		JOIN `Order` AS b
		ON a.custId = b.custId
		JOIN `Book` AS c
		ON b.bookId = c.bookId;


#-----실습4-39
# 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 조회하시오.
SELECT a.`name`, c.`bookName`
		FROM `Customer` AS a
		JOIN `Order` AS b
		ON a.custId = b.custId
		JOIN `Book` AS c
		ON b.bookId = c.bookId
		WHERE c.`price` = 20000;


#-----실습4-40
# 도서를 구매하지 않은 고객을 포함해서 고객명과 주문한 도서의 판매가격을 조회하시오.
SELECT a.`name`, b.`salePrice`
		FROM `Customer` AS a
		LEFT JOIN `Order` AS b
		ON a.custId = b.custId;


#-----실습4-41
# 김연아 고객이 주문한 도서의 총 판매액을 조회하시오.
SELECT SUM(salePrice) AS `총매출`
		FROM `Customer` AS a
		JOIN `Order` AS b
		ON a.custId = b.custId
		WHERE a.`name` = '김연아';


#-----실습4-42
# 가장 비싼 도서의 이름을 조회하시오.
SELECT `bookName`
		FROM `book`
		order BY `price` DESC
		LIMIT 1;


#-----실습4-43
# 도서를 주문하지 않은 고객의 이름을 조회하시오.
SELECT a.`name`
		FROM `Customer` AS a
		LEFT JOIN `Order` AS b
		ON a.custId = b.custId
		WHERE `salePrice` IS NULL;


#-----실습4-44
# Book 테이블에 새로운 도서 `스포츠 의학`을 추가하십시오.
# 스포츠의학은 한솔의학서적에서 출간했으며 가격은 미정이다.
INSERT INTO `book` VALUES (11, '스포츠의학', '한술의학서', NULL);


#-----실습4-45
# Customer 테이블에서 고객번호가 5인 고객의 주소를 '대한민국 부산'으로 변경하시오.
UPDATE `Customer` SET `address` = '대한민국 부산' WHERE `custId` = 5;


#-----실습4-46
# Customer 테이블에서 고객번호가 5인 고객을 삭제하시오.
DELETE FROM `Customer` WHERE `custId` = 5;

