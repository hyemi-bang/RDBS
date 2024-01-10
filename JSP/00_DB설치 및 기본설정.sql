/*
 # Orcle XE 11g 다운로드 및 설치
 1. 구글링 & 다운로드
 2. 설치 (설치시 사용하는 포트번호 확인할 것. > 1521, 2030, 8080)
 
 # 설치 후 확인
 1. cmd에서 sqlplus로 실행여부 확인
 2. 관리자 계정으로 로그인 (sys as sysdba/ 1234)
 3. sql developer다운받아 관리자 계정으로 로그인
    (sys, Role(롤)을 sysbda로 변경한 후 접속)
    
 # 연습용 계정 설정하기
 1. 관리자 계정으로 로그인 했을때만 연습용계정 unlock 가능
 2. ALTER USER hr ACCOUNT UNLOCK; (잠금해제 하지 않으면 접속 불가능)
 3. ALTER user hr IDENTIFIED BY 1234; (비밀번호 변경)


*/

/*대괄호주석*/
-- 데이터베이스에서 사용하는 주석

-- CTRL + ENTER : 명령어 하나 실행
-- F5 : 이 스크립트의 모든 명령어 실행
-- HR : 연습용계정
-- SYS, SYSTEM : 관리자 계정



SELECT * FROM tabs; -- 현재 데이터베이스의 테이블 목록보기
SELECT * FROM all_users; -- 현제 데이터베이스의 계정 목록 보기

-- 연습용 계정 HR 잠금 해제
ALTER user hr ACCOUNT UNLOCK;
-- 연습용 계정 hr 비밀번호 변경하기
ALTER user hr IDENTIFIED BY 1234;


