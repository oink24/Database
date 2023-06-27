# 날짜 : 2023/06/27
# 이름 : 강나은
# 내용 : University 모델링 실습 문제풀이


# ------- 문제1
# 모든 학생의 학생번호, 이름, 휴대폰, 학과번호, 학과명을 조회하시오.
SELECT a.`stdNo`, a.`stdName`, a.`stdHp`, a.`depNo`, b.`depName`
		FROM `Students` AS a
		JOIN `Departments` AS b
		ON a.`depNo` = b.`depNo`;


# ------- 문제2
# 모든 교수의 교수번호, 이름, 휴대폰, 학과번호, 학과명을 조회하시오.
SELECT a.`proNo`, a.`proName`, a.`proHp`, a.`depNo`, b.`depName`
		FROM `Professors` AS a
		JOIN `Departments` AS b
		ON a.`depNo`= b.`depNo`;


# ------- 문제3
# 모든 강좌의 강좌번호, 강좌명, 담당교수명, 휴대폰을 조회하시오.
SELECT a.`lecNo`, a.`lecName`, b.`proName`, b.`proHp`
		FROM `Lectures` AS a
		JOIN `Professors` AS b
		ON a.`proNo` = b.`proNo`;


# ------- 문제4
# 모든 강좌의 강좌번호, 강좌명, 담당교수 번호, 담당교수명, 휴대폰, 학과번호, 학과명을 조회하시오.
SELECT a.`lecNo`, a.`lecName`, b.`proNo`, b.`proName`, b.`proHp`, b.`depNo`, c.`depName`
		FROM `Lectures` AS a
		JOIN `Professors` AS b
		ON a.`proNo` = b.`proNo`
		JOIN `Departments` AS c
		ON b.`depNo` = c.`depNo`;


# ------- 문제5
# 모든 수강신청 내역에서 학생번호, 학생명, 강좌번호, 강좌명, 교수번호, 교수명을 조회하시오.
SELECT a.`stdNo`, a.`stdName`, c.`lecNo`, c.`lecName`, b.`proNo`, b.`proName`
		FROM `Students` AS a
		JOIN `Professors` AS b
		ON a.`proNo` = b.`proNo`
		JOIN `Lectures` AS c
		ON b.`proNo` = c.`proNo`;


# ------- 문제6
# 수강신청 테이블에 출석점수, 중간고사점수, 기말고사점수를 임의로 입력하시오. (1~100 사이)
UPDATE `Register` SET
							`regAttenScore` = CEIL(RAND() * 100),
							`regMidScore` = CEIL(RAND() * 100),
							`regFinalScore` = CEIL(RAND() * 100);


# ------- 문제7
# 수강신청 테이블에 입려한 출석점수, 중간고사점수, 기말고사점수를 모두 합산 후
# 평균을 구해 총점에 입력하시오.
UPDATE `Register` SET 
							`regTotal` = ( `regAttenScore` + `regMidScore` + `regFinalScore` ) / 3;


# ------- 문제8
# 수강신청 테이블에 총점을 기준으로 A ~ F 등급을 입력하시오.
UPDATE `Register` SET 
							`regGrade` = if(`regTotal` >= 90, 'A',
											 if(`regTotal` >= 80, 'B',
											 if(`regTotal` >= 70, 'C',
											 if(`regTotal` >= 60, 'D', 'F'))));
							

# ------- 문제9
# 수강신청 테이블에서 총점이 가장 큰 점수를 조회하시오.
SELECT MAX(regTotal) FROM `Register`;


# ------- 문제10
# 수강신청 테이블에서 정우성 학생의 총점의 평균을 조회하시오.
SELECT AVG(regTotal) FROM `Register` AS a
		JOIN `Students` AS b
		ON a.`stdNo` = b.`stdNo`
		WHERE b.`stdName` = '정우성';
