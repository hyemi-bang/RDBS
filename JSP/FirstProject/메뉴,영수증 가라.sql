select*from menu;
select*from receipt;
select*from membership;

delete menu;
delete receipt;

-- menu ���̺� ������ ����
INSERT INTO menu(menu_id, menu_name, choice1, choice2, choice3, choice4, choice5, choice6, menu_price, category5_id)
VALUES(111, '����Ʈ', '�Ƹ�� ����', '�ٴҶ�', '��Ʈ ���ݸ� Ĩ' , NULL, NULL, NULL, 9800, 1);
INSERT INTO menu(menu_id, menu_name, choice1, choice2, choice3, choice4, choice5, choice6, menu_price, category5_id)
VALUES(1, '�����ִϾ�', '����', '�ٴҶ�', NULL , NULL, NULL, NULL, 5100, 1);
INSERT INTO menu(menu_id, menu_name, choice1, choice2, choice3, choice4, choice5, choice6, menu_price, category5_id)
VALUES(2, '�밨�� ��Ű ���Ʈ', NULL, NULL, NULL , NULL, NULL, NULL, 5000, 4);
INSERT INTO menu(menu_id, menu_name, choice1, choice2, choice3, choice4, choice5, choice6, menu_price, category5_id)
VALUES(10, '��Ƽ�� ������ ũ�� ����', NULL, NULL, NULL , NULL, NULL, NULL, 31000, 2);



-- ������ ������ ����
INSERT INTO receipt(receipt_id, menu_name, membership_id, menu_price, total_price, menu_id, receipt_date)
VALUES (2023112801, '�����ִϾ�', 20, 5100, 5100, 1, TO_DATE('2023-11-28', 'YYYY-MM-DD'));
INSERT INTO receipt(receipt_id, menu_name, membership_id, menu_price, total_price, menu_id, receipt_date)
VALUES (2023112802, '�밨�� ��Ű ���Ʈ', 20, 5000, 5000, 2, TO_DATE('2023-11-28', 'YYYY-MM-DD'));
INSERT INTO receipt(receipt_id, menu_name, membership_id, menu_price, total_price, menu_id, receipt_date)
VALUES (2023112910, '��Ƽ�� ������ ũ�� ����', 21, 31000, 31000, 10, TO_DATE('2023-11-29', 'YYYY-MM-DD'));
INSERT INTO receipt(receipt_id, menu_name, membership_id, menu_price, total_price, menu_id, receipt_date)
VALUES (20231002111, '����Ʈ,�Ƹ�� ����,�ٴҶ�,��Ʈ ���ݸ� Ĩ', NULL, 9800, 9800, 111, TO_DATE('2023-10-02', 'YYYY-MM-DD'));


COMMIT;