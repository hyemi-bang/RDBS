select*from menu;
select*from receipt;
select*from membership;

delete menu;
delete receipt;

-- menu 테이블에 데이터 삽입
INSERT INTO menu(menu_id, menu_name, choice1, choice2, choice3, choice4, choice5, choice6, menu_price, category5_id)
VALUES(111, '파인트', '아몬드 봉봉', '바닐라', '민트 초콜릿 칩' , NULL, NULL, NULL, 9800, 1);
INSERT INTO menu(menu_id, menu_name, choice1, choice2, choice3, choice4, choice5, choice6, menu_price, category5_id)
VALUES(1, '더블주니어', '초코', '바닐라', NULL , NULL, NULL, NULL, 5100, 1);
INSERT INTO menu(menu_id, menu_name, choice1, choice2, choice3, choice4, choice5, choice6, menu_price, category5_id)
VALUES(2, '용감한 쿠키 블라스트', NULL, NULL, NULL , NULL, NULL, NULL, 5000, 4);
INSERT INTO menu(menu_id, menu_name, choice1, choice2, choice3, choice4, choice5, choice6, menu_price, category5_id)
VALUES(10, '노티드 스마일 크림 버니', NULL, NULL, NULL , NULL, NULL, NULL, 31000, 2);



-- 영수증 데이터 삽입
INSERT INTO receipt(receipt_id, menu_name, membership_id, menu_price, total_price, menu_id, receipt_date)
VALUES (2023112801, '더블주니어', 20, 5100, 5100, 1, TO_DATE('2023-11-28', 'YYYY-MM-DD'));
INSERT INTO receipt(receipt_id, menu_name, membership_id, menu_price, total_price, menu_id, receipt_date)
VALUES (2023112802, '용감한 쿠키 블라스트', 20, 5000, 5000, 2, TO_DATE('2023-11-28', 'YYYY-MM-DD'));
INSERT INTO receipt(receipt_id, menu_name, membership_id, menu_price, total_price, menu_id, receipt_date)
VALUES (2023112910, '노티드 스마일 크림 버니', 21, 31000, 31000, 10, TO_DATE('2023-11-29', 'YYYY-MM-DD'));
INSERT INTO receipt(receipt_id, menu_name, membership_id, menu_price, total_price, menu_id, receipt_date)
VALUES (20231002111, '파인트,아몬드 봉봉,바닐라,민트 초콜릿 칩', NULL, 9800, 9800, 111, TO_DATE('2023-10-02', 'YYYY-MM-DD'));


COMMIT;