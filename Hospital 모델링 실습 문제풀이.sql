# 날짜 : 2023/06/28
# 이름 : 강나은
# 내용 : Hospital 모델링 실습 문제풀이


# ------- 문제1
# 모든 의사의 의사ID, 이름, 생년월일, 전공의과 번호, 전공의과 이름을 조회하시오.
SELECT a.doc_id, a.doc_name, a.doc_birth, a.dep_no, b.dep_name
		FROM `Doctors`     AS a
		JOIN `Departments` AS b ON a.dep_no = b.dep_no;


# ------- 문제2
# 모든 간호사의 간호사ID, 이름, 생년월일, 전공의과 번호, 전공의과 이름을 조회하시오.
SELECT a.nur_id, a.nur_name, a.nur_birth, a.dep_no, b.dep_name
		FROM `Nurses`      AS a
		JOIN `Departments` AS b ON a.dep_no = b.dep_no;


# ------- 문제3
# 모든 환자의 환자ID, 이름, 주민번호, 휴대폰, 담당의사 이름, 담당간호사 이름을 조회하시오.
SELECT a.pat_id, a.pat_name, a.pat_jumin, a.pat_phone, b.doc_name, c.nur_name
		FROM `Patients` AS a
		JOIN `Doctors`  AS b ON a.doc_id = b.doc_id
		JOIN `Nurses`   AS c ON a.nur_id = c.nur_id;


# ------- 문제4
# 모든 진료내역에서 환자 이름, 담당의사 이름, 진료내용, 처방내용, 진료날짜를 조회하시오.
SELECT a.pat_name, b.doc_name, c.treat_contents, d.chart_contents, c.treat_datetime
		FROM `Patients`   AS a
		JOIN `Doctors`    AS b ON a.doc_id = b.doc_id
		JOIN `Treatments` AS c ON b.doc_id = c.doc_id
		JOIN `Charts`     AS d ON c.treat_no = d.treat_no;


# ------- 문제5
# 모든 진료내역에서 '외과'에서 진료한 내역 가운데 진료번호, 환자이름, 담당의사명, 진료내용, 처방내용, 진료날짜를 조회하시오.
SELECT a.treat_no, pat_name, doc_name, treat_contents, chart_contents, treat_datetime
		FROM `TreatMents` AS a
		JOIN `Patients` AS b ON a.pat_id = b.pat_id
		JOIN `Doctors` AS c ON a.doc_id = c.doc_id
		JOIN `Charts` AS d ON a.treat_no = d.treat_no
		JOIN `Departments` AS e ON c.dep_no = e.dep_no
		WHERE e.dep_name = '외과';
		

# ------- 문제6
# 모든 진료내역에서 '화상'으로 진료한 내역 가운데 진료번호, 환자이름, 담당의사명, 진료내용, 처방내용, 진료날짜를 조회하시오.
# 진료, 환자, 의사, 처방
SELECT a.treat_no, pat_name, doc_name, treat_contents, chart_contents, treat_datetime
		FROM `Treatments` AS a
		JOIN `Patients`   AS b ON a.pat_id = b.pat_id
		JOIN `Doctors`    AS c ON a.doc_id = c.doc_id
		JOIN `Charts`     AS d ON a.treat_no = d.treat_no
		WHERE a.treat_contents LIKE '%화상%';


# ------- 문제7
# 현재 날짜를 기준으로 30세 이상 ~ 40세 미만 환자를 조회하시오.
SELECT `pat_name`
		FROM `Patients`
		WHERE (YEAR(NOW()) - CONCAT(19, SUBSTR(`pat_jumin`, 1, 2))+1) BETWEEN 30 AND 40;


# ------- 문제8
# 모든 전공부서에서 아직 의사ID가 부여되지 않은 의사의 이름과 부서명을 조회하시오.
SELECT a.dep_manager, a.dep_name
		FROM `Departments` AS a
		LEFT JOIN `Doctors` AS b
		ON a.dep_no = b.dep_no
		WHERE b.doc_id IS NULL;


# ------- 문제9
# 김태희 간호사가 맡고 있는 모든 환자의 이름을 구분자 ^으로 해서 '강동원^고소영^이나영'과 같이 조회하시오.
SELECT GROUP_CONCAT(`pat_name` SEPARATOR '^') AS `환자 목록`
		FROM `Nurses` AS a
		JOIN `Patients` AS b
		ON a.nur_id = b.nur_id
		WHERE `nur_name` = '김태희';
		
		
# ------- 문제10
# 가장 많은 환자 수를 담당하는 간호사ID, 간호사 이름, 담당환자 수를 조회하시오.
SELECT a.nur_id, a.nur_name, COUNT(b.pat_id) AS `담당환자 수`
		FROM `Nurses` AS a
		JOIN `Patients` AS b
		ON a.nur_id = b.nur_id
		GROUP BY a.nur_id
		ORDER BY `담당환자 수` DESC
		LIMIT 1;