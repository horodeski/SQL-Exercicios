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

