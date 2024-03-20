-- Lista 2 - a) O nome e telefone de todos os clientes em que o telefone começa com o dígito 4.

SELECT NMCUSTOMER, IDFONE FROM CUSTOMER WHERE IDFONE LIKE '4%'

-- Lista 2 - b) Todas as colunas dos clientes que não possuem telefone cadastrado.

SELECT * FROM CUSTOMER WHERE IDFONE=NULL

-- Lista 2 - c) O nome e o telefone dos fornecedores em que o DDD não foi cadastrado;

SELECT IDFONE FROM SUPPLIER WHERE (LEN(IDFONE) < 10)

-- Lista 2 - d) O nome, quantidade em estoque e o preço com desconto de 10% dos produtos que tem mais de 2000 unidades em estoque.

SELECT NMPRODUCT, QTSTOCK, CASE WHEN QTSTOCK > 2000 THEN VLPRICE - (VLPRICE * 10 / 100)  ELSE VLPRICE END AS VLPRICE FROM PRODUCT

-- Lista 2 - e) O nome e o preço dos produtos com preço entre 10 e 20 reais.

SELECT NMPRODUCT, VLPRICE FROM PRODUCT WHERE ROUND(VLPRICE, 1) <= 20 AND ROUND(VLPRICE, 1) >= 10

-- Lista 2 - f) O nome do produto, o preço e o preço total do estoque dos produtos com preço acima de 50 reais.

SELECT NMPRODUCT, VLPRICE, VLPRICE * QTSTOCK AS TOTAL FROM PRODUCT WHERE ROUND(VLPRICE, 1) > 50

-- Lista 2 - g) O nome do produto, o nome do fornecedor e o telefone do fornecedor dos produtos com preço acima de 20 reais e que tenham mais de 1500 unidades em estoque;

SELECT NMPRODUCT, SUPPLIER.NMSUPPLIER AS NMSUPPLIER FROM PRODUCT JOIN SUPPLIER ON PRODUCT.CDSUPPLIER = SUPPLIER.CDSUPPLIER WHERE VLPRICE > 20 AND QTSTOCK > 1500

-- Lista 2 - h) O nome do cliente, a data do pedido e o valor total do pedido para pedidos feitos entre junho e julho de 2003

SELECT DTREQUEST, VLTOTAL, MONTH(DTREQUEST) AS DTREQUEST, CUSTOMER.NMCUSTOMER AS NMCUSTOER FROM REQUEST JOIN CUSTOMER ON REQUEST.CDCUSTOMER = CUSTOMER.CDCUSTOMER WHERE MONTH(DTREQUEST) = 6 OR MONTH(DTREQUEST) = 7

-- Lista 2 - i) O nome do cliente, o nome do produto, a data do pedido, a quantidade pedida, o valor unitário de venda dos produtos e o valor total do produto pedido, cujas unidades pedidas por pedido seja maior que 500

SELECT
CUSTOMER.NMCUSTOMER,
PRODUCT.NMPRODUCT, 
DTREQUEST,
QTAMOUNT,
VLUNITARY,
VLUNITARY * QTAMOUNT AS VLTOTAL
FROM PRODUCTREQUEST 
JOIN REQUEST ON PRODUCTREQUEST.CDREQUEST = REQUEST.CDREQUEST 
JOIN CUSTOMER ON CUSTOMER.CDCUSTOMER = REQUEST.CDCUSTOMER 
JOIN PRODUCT ON PRODUCT.CDPRODUCT = PRODUCTREQUEST.CDPRODUCT 
GROUP BY CUSTOMER.NMCUSTOMER,
PRODUCT.NMPRODUCT, 
DTREQUEST,
QTAMOUNT,
VLUNITARY
HAVING sum(QTAMOUNT) > 500

