-- Lista 3 - a) O nome do produto, o nome do fornecedor, o preço do produto, o preço com 10% de desconto, o preço com 20% de desconto e o preço com 30% de desconto para produtos cujo valor com 10% de desconto ultrapasse os 15 reais, isso ordenado por preço e produto.

SELECT
NMPRODUCT,
SUPPLIER.NMSUPPLIER,
VLPRICE,
VLPRICE - (VLPRICE * 10/100) AS DISCOUNT_10,
VLPRICE - (VLPRICE * 20/100) AS DISCOUNT_20,
CASE WHEN VLPRICE - (VLPRICE * 10/100) > 15 THEN VLPRICE - (VLPRICE * 30/100) ELSE NULL END  AS DISCOUNT_30 
FROM PRODUCT
JOIN SUPPLIER ON SUPPLIER.CDSUPPLIER = PRODUCT.CDSUPPLIER
ORDER BY VLPRICE 

-- Lista 3) - b) O nome do produto, o nome do fornecedor, o preço do produto, o preço total do produto no estoque e o preço total para o dobro do estoque para produtos com preço total acima de 12000, ordenados por fornecedor e produto.

SELECT
NMPRODUCT,
SUPPLIER.NMSUPPLIER,
VLPRICE,
VLPRICE * QTSTOCK AS VLTOTAL,
CASE WHEN VLPRICE * QTSTOCK > 12000 THEN VLPRICE * (QTSTOCK * 2) ELSE NULL END AS DUOSTOCK 
FROM PRODUCT
JOIN SUPPLIER ON SUPPLIER.CDSUPPLIER = PRODUCT.CDSUPPLIER
ORDER BY NMPRODUCT

-- Lista 3) - c) Todas as colunas dos clientes que possuem telefone cadastrado e começam com a letra J, ordenado pelo nome do cliente.

SELECT * FROM CUSTOMER WHERE NMCUSTOMER LIKE 'J%' AND IDFONE <> NULL ORDER BY NMCUSTOMER

-- Lista 3) - d) O nome do produto, o preço e o nome do fornecedor dos produtos que o fornecedor tenha no nome os caracteres ‘ica’, ordenado por fornecedor e preço.

SELECT 
NMPRODUCT,
VLPRICE, 
SUPPLIER.NMSUPPLIER
FROM PRODUCT
JOIN SUPPLIER ON PRODUCT.CDSUPPLIER = SUPPLIER.CDSUPPLIER
GROUP BY NMPRODUCT,
VLPRICE, 
SUPPLIER.NMSUPPLIER
HAVING SUPPLIER.NMSUPPLIER LIKE '%ica%'

-- Lista 3) - e)  O nome do fornecedor, o fone do fornecedor, o nome do produto, o preço e o preço total do produto no estoque para produtos que comecem com a letra S, tendo preço acima de 50, ordenado por fornecedor e preço.

SELECT 
SUPPLIER.NMSUPPLIER,
SUPPLIER.IDFONE,
NMPRODUCT,
VLPRICE,
CASE WHEN NMPRODUCT LIKE 'S%' AND VLPRICE > 50 THEN VLPRICE * QTSTOCK ELSE NULL END AS VLTOTAL
FROM PRODUCT
JOIN SUPPLIER ON PRODUCT.CDSUPPLIER = SUPPLIER.CDSUPPLIER

-- Lista 3) - f)  O nome do cliente, o nome do produto, a data do pedido, a data de entrega, a quantidade pedida, o valor unitário de venda dos produtos e o valor total do produto pedido, cujas unidades pedidas por pedido sejam menor que 600 e a
-- data do pedido seja no mês de agosto de 2003 e o produto comece com a letra M;

SELECT
CUSTOMER.NMCUSTOMER,
PRODUCT.NMPRODUCT,
REQUEST.DTREQUEST,
REQUEST.DTDELIVER,
QTAMOUNT,
VLUNITARY,
VLUNITARY * QTAMOUNT AS VLTOTAL
FROM PRODUCTREQUEST
JOIN PRODUCT ON PRODUCT.CDPRODUCT= PRODUCTREQUEST.CDPRODUCT
JOIN REQUEST ON REQUEST.CDREQUEST = PRODUCTREQUEST.CDREQUEST
JOIN CUSTOMER ON CUSTOMER.CDCUSTOMER = REQUEST.CDREQUEST
GROUP BY CUSTOMER.NMCUSTOMER,
PRODUCT.NMPRODUCT,
REQUEST.DTREQUEST,
REQUEST.DTDELIVER,
QTAMOUNT,
VLUNITARY,
VLTOTAL
HAVING QTAMOUNT < 600 AND PRODUCT.NMPRODUCT LIKE 'M%' AND MONTH(REQUEST.DTREQUEST) = 8 

-- Lista 3) - g) O nome do cliente, o nome do produto, o nome do fornecedor, a data do pedido, a data de entrega e o preço, somente se o fornecedor for de São Paulo (011) e o preço seja maior que 20 reais

SELECT
CUSTOMER.NMCUSTOMER,
PRODUCT.NMPRODUCT,
SUPPLIER.NMSUPPLIER,
REQUEST.DTREQUEST,
REQUEST.DTDELIVER,
VLUNITARY
FROM PRODUCTREQUEST
JOIN PRODUCT ON PRODUCT.CDPRODUCT = PRODUCTREQUEST.CDPRODUCT
JOIN REQUEST ON REQUEST.CDREQUEST = PRODUCTREQUEST.CDREQUEST
JOIN CUSTOMER ON CUSTOMER.CDCUSTOMER = REQUEST.CDCUSTOMER
JOIN SUPPLIER ON SUPPLIER.CDSUPPLIER = PRODUCT.CDSUPPLIER
GROUP BY 
CUSTOMER.NMCUSTOMER,
PRODUCT.NMPRODUCT,
SUPPLIER.NMSUPPLIER,
REQUEST.DTREQUEST,
REQUEST.DTDELIVER,
VLUNITARY,
SUPPLIER.IDFONE 
HAVING VLUNITARY > 20 AND SUPPLIER.IDFONE LIKE '(011)%'












