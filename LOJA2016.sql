INSERT INTO CLIENTE VALUES ('1','KIRK', 'ENTERPRISE','10');
INSERT INTO CLIENTE VALUES ('2','SPOCK', 'ENTERPRISE','9');
INSERT INTO CLIENTE VALUES ('3','SCOTTY', 'ENTERPRISE','8');
INSERT INTO CLIENTE VALUES ('4','BONES', 'ENTERPRISE','8');
INSERT INTO CLIENTE VALUES ('5','GORN', 'PLANETOIDARENA','1');
INSERT INTO CLIENTE VALUES ('6','KHAN', 'CETIALPHAFIVE','2');
INSERT INTO CLIENTE VALUES ('7','UHUNA', 'ENTERPRISE','7');
INSERT INTO CLIENTE VALUES ('8','CHEKOV', 'ENTERPRISE','6');
INSERT INTO CLIENTE VALUES ('9','SULU', 'ENTERPRISE','6');

INSERT INTO ITEM VALUES ('125','PHASER', '350','2');
INSERT INTO ITEM VALUES ('137','BEAM', '1500','250');
INSERT INTO ITEM VALUES ('143','SHIELD', '4500','3000');
INSERT INTO ITEM VALUES ('175','FUSIONMISSILE', '2750','500');
INSERT INTO ITEM VALUES ('211','CAPITAINLOG', '50','2');
INSERT INTO ITEM VALUES ('234','STARSHIP', '25000','15000');
INSERT INTO ITEM VALUES ('356','SENSOR', '245','15');
INSERT INTO ITEM VALUES ('368','INTERCOM1', '200','75');
INSERT INTO ITEM VALUES ('399','MEDICALKIT', '75','3');

INSERT INTO PEDIDO VALUES ('10058','1', '211','1','50');
INSERT INTO PEDIDO VALUES ('12001','1', '234','1','25000');
INSERT INTO PEDIDO VALUES ('10266','2', '356','50','12250');
INSERT INTO PEDIDO VALUES ('10042','3', '137','3','4500');
INSERT INTO PEDIDO VALUES ('10371','4', '399','10','750');
INSERT INTO PEDIDO VALUES ('10012','5', '125','2','700');
INSERT INTO PEDIDO VALUES ('11775','6', '125','3','1050');
INSERT INTO PEDIDO VALUES ('10023','6', '175','20','55000');
INSERT INTO PEDIDO VALUES ('10232','7', '368','1','1200');
INSERT INTO PEDIDO VALUES ('11593','8', '125','2','700');
INSERT INTO PEDIDO VALUES ('11070','9', '143','1','4500');

SELECT * FROM CLIENTE;
SELECT * FROM ITEM;
SELECT * FROM PEDIDO;

-- A QUANTIDADE DE CLIENTES QUE REALMENTE FIZERAM PELO MENOS 1 PEDIDO:
SELECT COUNT(DISTINCT ID_CLIENTE) FROM PEDIDO WHERE QUANTIDADE >= 1;

-- A DESCRI��O DO ITEM QUE POSSUI O MAIOR CUSTO:
SELECT DESCRI��O FROM ITEM WHERE PRE�O = (SELECT MAX(PRE�O) FROM ITEM);

-- O C�DIGO E A DESCRI��O DOS ITENS QUE TEM O PESO IGUAL A 2, OU QUE FORAM PEDIDOS PELO CLIENTE KIRK:
SELECT DISTINCT I.ID_ITEM, DESCRI��O FROM ITEM I, PEDIDO P WHERE PESO = 2 OR (P.ID_CLIENTE = '1' AND P.ID_ITEM = I.ID_ITEM);

-- INCLUIR UM CLIENTE QUALQUER "TODOS OS DADOS S�O OBRIGATORIOS":
INSERT INTO CLIENTE VALUES ('10','THAMIRES', 'ENTERPRISE','7');

-- ALTERAR O PRE�O DO ITEM 137 PARA 1700:
UPDATE ITEM SET PRE�O = '1700' WHERE ID_ITEM = 137;

-- ESCREVA UM SELECT PARA ESTE RESULTADO: 
-- ID   DESCRI��O    PRE�O PESO
-- 211  CAPTAINLOG  50    2
-- 234  STARSHIP     25000 15000
SELECT I.* FROM ITEM I, PEDIDO P WHERE P.ID_CLIENTE = '1' AND P.ID_ITEM = I.ID_ITEM;
