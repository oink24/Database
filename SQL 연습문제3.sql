# 날짜 : 2023/06/22
# 이름 : 강나은
# 내용 : SQL 연습문제3 풀이

#-----실습3-1
# 실습 데이터베이스와 사용자 생성하기
CREATE DATABASE `College`;
CREATE USER 'admin3'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON College.* TO 'admin3'@'%';
FLUSH PRIVILEGES;


#-----실습3-2
# 학생테이블 생성하기
CREATE TABLE `Student` (
		`stdNo` CHAR(8) PRIMARY KEY,
		`stdName` VARCHAR(20) NOT NULL,
		`stdHp` CHAR(13) UNIQUE KEY NOT NULL,
		`stdYear` TINYINT NOT NULL,
		`stdAddress` VARCHAR(100) DEFAULT NULL
);

# 강좌테이블 생성하기
CREATE TABLE `Lecture` (
		`lecNo` INT PRIMARY KEY,
		`lecName` VARCHAR(20) NOT NULL,
		`lecCredit` INT NOT NULL,
		`lecTime` INT NOT NULL,
		`lecClass` VARCHAR(10) DEFAULT NULL
);

# 수강테이블 생성하기
CREATE TABLE `Register` (
		`regStdNo` CHAR(8) NOT NULL,
		`regLecNo` INT NOT NULL,
		`regMidScore` INT DEFAULT NULL,
		`regFinalScore` INT DEFAULT NULL,
		`regTotalScore` INT DEFAULT NULL,
		`regGrade` CHAR(1) DEFAULT NULL
);


#-----실습3-3
# 학생테이블에 데이터 추가하기
INSERT INTO `Student` VALUES ('20201016', '김유신', '010-1234-1001', 3, NULL);
INSERT INTO `Student` VALUES ('20201126', '김춘추', '010-1234-1002', 3, '경상남도 경주시');
INSERT INTO `Student` VALUES ('20210216', '장보고', '010-1234-1003', 2, '전라남도 완도시');
INSERT INTO `Student` VALUES ('20210326', '강감찬', '010-1234-1004', 2, '서울시 영등포구');
INSERT INTO `Student` VALUES ('20220416', '이순신', '010-1234-1005', 1, '부산시 부산진구');
INSERT INTO `Student` VALUES ('20220521', '송상현', '010-1234-1006', 1, '부산시 동래구');

# 강좌테이블에 데이터 추가하기
INSERT INTO `Lecture` VALUES (159, '인지행동심리학', 3, 40, '본304');
INSERT INTO `Lecture` VALUES (167, '운영체제론', 3, 25, '본B05');
INSERT INTO `Lecture` VALUES (234, '중급 영문법', 3, 20, '본201');
INSERT INTO `Lecture` VALUES (239, '세법개론', 3, 40, '본204');
INSERT INTO `Lecture` VALUES (248, '빅데이터 개론', 3, 20, '본B01');
INSERT INTO `Lecture` VALUES (253, '컴퓨팅사고와 코딩', 2, 10, '본B02');
INSERT INTO `Lecture` VALUES (349, '사회복지 마케팅', 2, 50, '본301');

# 수강테이블에 데이터 추가하기
INSERT INTO `Register` VALUES ('20201126', 234, NULL, NULL, NULL, NULL);
INSERT INTO `Register` VALUES ('20201016', 248, NULL, NULL, NULL, NULL);
INSERT INTO `Register` VALUES ('20201016', 253, NULL, NULL, NULL, NULL);
INSERT INTO `Register` VALUES ('20201126', 239, NULL, NULL, NULL, NULL);
INSERT INTO `Register` VALUES ('20210216', 349, NULL, NULL, NULL, NULL);
INSERT INTO `Register` VALUES ('20210326', 349, NULL, NULL, NULL, NULL);
INSERT INTO `Register` VALUES ('20201016', 167, NULL, NULL, NULL, NULL);
INSERT INTO `Register` VALUES ('20220416', 349, NULL, NULL, NULL, NULL);


#-----실습3-4
# 강좌를 조회하시오.
SELECT * FROM `Lecture`;


#-----실습3-5
# 학생을 조회하시오.
SELECT * FROM `Student`;


#-----실습3-6
# 수강신청 내역을 조회하시오.
SELECT * FROM `Register`;


#-----실습3-7
# 3학년 학생을 조회하시오.
SELECT * FROM `Student` WHERE `stdYear` = 3;


#-----실습3-8
# 2학점짜리 강좌를 조회하시오.
SELECT * FROM `Lecture` WHERE `lecCredit` = 2;


#-----실습3-9
# 아래와 같이 중간고사, 기말고사 점수를 입력 후 조회하시오.
UPDATE `Register` SET `regMidScore` = 36, `regFinalScore` = 42 WHERE `regStdNo`='20201126' AND `regLecNo` = 234;
UPDATE `Register` SET `regMidScore` = 24, `regFinalScore` = 62 WHERE `regStdNo`='20201016' AND `regLecNo` = 248;
UPDATE `Register` SET `regMidScore` = 28, `regFinalScore` = 40 WHERE `regStdNo`='20201016' AND `regLecNo` = 253;
UPDATE `Register` SET `regMidScore` = 37, `regFinalScore` = 57 WHERE `regStdNo`='20201126' AND `regLecNo` = 239;
UPDATE `Register` SET `regMidScore` = 28, `regFinalScore` = 68 WHERE `regStdNo`='20210216' AND `regLecNo` = 349;
UPDATE `Register` SET `regMidScore` = 16, `regFinalScore` = 65 WHERE `regStdNo`='20210326' AND `regLecNo` = 349;
UPDATE `Register` SET `regMidScore` = 18, `regFinalScore` = 38 WHERE `regStdNo`='20201016' AND `regLecNo` = 167;
UPDATE `Register` SET `regMidScore` = 25, `regFinalScore` = 58 WHERE `regStdNo`='20220416' AND `regLecNo` = 349;

SELECT * FROM `Register`;


#-----실습3-10
# 아래와 같이 총점과 등급을 입력 후 조회하시오.
UPDATE `Register` SET
		`regTotalScore` = `regMidScore` + `regFinalScore`,
		`regGrade` = if(`regTotalScore` >= 90, 'A',
						 if(`regTotalScore` >= 80, 'B',
						 if(`regTotalScore` >= 70, 'C',
						 if(`regTotalScore` >= 60, 'D', 'F'))));
						 
SELECT * FROM `Register`;


#-----실습3-11
# 점수가 큰 순서로 정렬하시오.
SELECT * FROM `Register` ORDER BY `regTotalScore` DESC;


#-----실습3-12
# 강좌번호가 349번이면서 총점이 가장 큰 순서로 조회하시오.
SELECT * FROM `Register` WHERE `regLecNo` = 349 ORDER BY `regTotalScore` DESC;


#-----실습3-13
# 30시간 이상인 강좌를 조회하시오.
SELECT * FROM `Lecture` WHERE `lecTime` >= 30;


#-----실습3-14
# 강좌명과 강의실을 조회하시오.
SELECT `lecName`, `lecClass` FROM `Lecture`;


#-----실습3-15
# 학번과 이름을 조회하시오.
SELECT `stdNo`, `stdName` FROM `Student`;


#-----실습3-16
# 주소를 입력하지 않은 학생을 조회하시오.
SELECT * FROM `Student` WHERE `stdAddress` IS NULL;


#-----실습3-17
# 부산에 거주하는 학생을 조회하시오.
SELECT * FROM `Student` WHERE `stdAddress` LIKE '부산시%';


#-----실습3-18
# 학생과 수강테이블을 결합하시오. 단, 수강신청을 하지 않아 점수가 없더라도 조회될 것.
SELECT * FROM `Student` AS a LEFT JOIN `Register` AS b
		ON a.`stdNo` = b.`regStdNo`;


#-----실습3-19
# 아래와 같이 조회하시오.
SELECT `stdNo`,
		 `stdName`, 
		 `regLecNo`, 
		 `regMidScore`, 
		 `regFinalScore`, 
		 `regTotalScore`, 
		 `regGrade`
		FROM `Student` AS a, `Register` AS b
		WHERE a.`stdNo` = b.`regStdNo`
		ORDER BY `stdNo`;


#-----실습3-20
# 강좌번호 349를 수강 신청한 학생의 이름과 학번을 조회하시오.
SELECT `stdName`, `stdNo`, `regLecNo`
		FROM `Student` AS a
		JOIN `Register` AS b
		ON a.stdNo = b.regStdNo
		WHERE `regLecNo` = 349;


#-----실습3-21
# 학생별 수강신청 건수와 모든 수강과먹의 전체점수 합계, 평균을 조회하시오.
SELECT 
		 `stdNo`,
		 `stdName`,
		 COUNT(stdNo) AS `수강신청 건수`,
		 SUM(regTotalScore) AS `종합점수`,
		 SUM(regTotalScore) / COUNT(stdNo) AS `평균`
		FROM `Student` AS a
		JOIN `Register` AS b
		ON a.stdNo = b.regStdNo
		GROUP BY `stdNo`
		ORDER BY `stdNo`;


#-----실습3-22
# 수강테이블과 강좌테이블을 결합하시오.
SELECT * FROM `Register` AS a
		JOIN `Lecture` AS b
		ON a.regLecNo = b.lecNo;


#-----실습3-23
# 아래와 같이 조회하시오.
SELECT
		`regStdNo`,
		`regLecNo`,
		`lecName`,
		`regMidScore`,
		`regFinalScore`,
		`regTotalScore`,
		`regGrade`
	FROM `Register` AS a JOIN `Lecture` AS b ON a.regLecNo = b.lecNo;


#-----실습3-24
# '사회복지 마케팅' 강좌를 신청한 건수와 평균을 조회하시오.
SELECT 
		COUNT(*) AS `사회복지 마케팅 수강 신청건수`,
		AVG(regTotalScore) AS `사회복지 마케팅 평균`
	FROM `Register` AS a JOIN `Lecture` AS b ON a.regLecNo = b.lecNo
	WHERE b.lecNo = 349;


#-----실습3-25
# 'A' 등급을 받은 학번과 강좌명을 조회하시오.
SELECT
		`regStdNo`,
		`lecName`
	FROM `Register` AS a JOIN `Lecture` AS b ON a.regLecNo = b.lecNo
	WHERE a.`regGrade` = 'A';


#-----실습3-26
# 학생테이블과 수강테이블 그리고 강좌테이블을 결합하시오.
SELECT * FROM `Student` AS a
		JOIN `Register` AS b ON a.stdNo = b.regStdNo
		JOIN `Lecture` AS c ON b.regLecNo = c.lecNo
		ORDER BY `stdNo`;


#-----실습3-27
# 아래와 같이 조회하시오.
SELECT
		`stdNo`,
		`stdName`,
		`lecNo`,
		`lecName`,
		`regMidScore`,
		`regFinalScore`,
		`regTotalScore`,
		`regGrade`
	FROM `Student` AS a
	JOIN `Register` AS b ON a.stdNo = b.regStdNo
	JOIN `Lecture` AS c ON b.regLecNo = c.lecNo
	ORDER BY `regGrade`, `regTotalScore` DESC;


#-----실습3-28
# 'F' 학점을 받은 학번과 이름, 수강과목명, 점수 그리고 등급을 조회하시오.
SELECT 
		`stdNo`,
		`stdName`,
		`lecName`,
		`regTotalScore`,
		`regGrade`
	FROM `Student` AS a
	JOIN `Register` AS b ON a.stdNo = b.regStdNo
	JOIN `Lecture` AS c ON b.regLecNo = c.lecNo
	WHERE `regGrade` = 'F';


#-----실습3-29
# 학생별 이수학점을 조회하시오. 단, F등급 받은 과목은 학점으로 인정되지 않음.
SELECT 
		`stdNo`,
		`stdName`,
		SUM(lecCredit) AS `이수학점`
	FROM `Student` AS a
	JOIN `Register` AS b ON a.stdNo = b.regStdNo
	JOIN `Lecture` AS c ON b.regLecNo = c.lecNo
	WHERE `regGrade` != 'F'
	GROUP BY `stdNo`
	ORDER BY `stdNo`;


#-----실습3-30
# 신청과목과 이수과목을 조회하시오. 단, F등급 받은 과목은 이수과목으로 인정되지 않음.
SELECT 
		`stdNo`,
		`stdName`,
		GROUP_CONCAT(lecName) AS `신청과목`,
		GROUP_CONCAT(if(`regTotalScore` >= 60, `lecName`, NULL)) AS `이수과목`
	FROM `Student` AS a
	JOIN `Register` AS b ON a.stdNo = b.regStdNo
	JOIN `Lecture` AS c ON b.regLecNo = c.lecNo
	GROUP BY `stdNo`;