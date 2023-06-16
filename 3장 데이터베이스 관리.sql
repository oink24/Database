#날짜 : 2023/06/16
#이름 : 강나은
#내용 : 3장 데이터베이스 관리


#-----실습3-1
#관리자 추가하기

#데이터 베이스 생성
CREATE DATABASE `TestDB`;

#일반 관리자 생성
CREATE USER 'tester'@'%' IDENTIFIED BY '1234';

#권한 부여
GRANT ALL PRIVILEGES ON TestDB.* TO 'tester'@'%';

#변경사항 적용
FLUSH PRIVILEGES;



#-----실습3-2
#관리자 비밀번호 변경 및 계정 삭제

#비밀번호 변경
ALTER USER 'tester'@'%' IDENTIFIED BY '12345';

#계정 삭제
DROP USER 'tester'@'%';

#변경사항 적용
FLUSH PRIVILEGES;