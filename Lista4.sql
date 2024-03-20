-- Lista 4 - a)  O nome de todos os itens que já foram pedidos (fazer uma versão com DISTINCT e uma com GROUP BY).

SELECT 
PRODUCT.NMPRODUCT
FROM PRODUCTREQUEST
JOIN PRODUCT ON PRODUCT.CDPRODUCT = PRODUCTREQUEST.CDPRODUCT
GROUP BY PRODUCT.NMPRODUCT

SELECT 
DISTINCT PRODUCT.NMPRODUCT
FROM PRODUCTREQUEST
JOIN PRODUCT ON PRODUCT.CDPRODUCT = PRODUCTREQUEST.CDPRODUCT


-- Lista 4 - b) O nome do produto, o número de vezes que ele foi pedido e a quantidade total pedida.

SELECT
PRODUCT.NMPRODUCT,
COUNT(PRODUCT.NMPRODUCT) as AMOUNTREQUEST,
QTAMOUNT * COUNT(PRODUCT.NMPRODUCT) as AMOUNT
FROM PRODUCTREQUEST
JOIN PRODUCT ON PRODUCT.CDPRODUCT = PRODUCTREQUEST.CDPRODUCT
GROUP BY PRODUCT.NMPRODUCT, QTAMOUNT 
  
-- Lista 4 - c)  O nome do fornecedor, o total em estoque dos produtos fornecidos pelo fornecedor, a média de preço dos produtos fornecidos e quantos produtos ele fornece.

SELECT
SUPPLIER.NMSUPPLIER,
SUM(QTSTOCK) AS TLSTOCK,
AVG(VLPRICE) AS AVG,
COUNT(CDPRODUCT) AS PRODUCTS
FROM PRODUCT
JOIN SUPPLIER ON SUPPLIER.CDSUPPLIER = PRODUCT.CDSUPPLIER
GROUP BY SUPPLIER.NMSUPPLIER

-- Lista 4 - d) O nome do cliente, seu telefone, o valor da maior compra, o valor da menor compra, o total comprado e a média de valor comprado, ordenado por maior compra decrescente.


SELECT 
CUSTOMER.NMCUSTOMER,
CUSTOMER.IDFONE,
MAX(VLTOTAL) AS MAX,
MIN(VLTOTAL) AS MIN,
VLTOTAL,
AVG(VLTOTAL) AS MEDIA
FROM REQUEST
JOIN CUSTOMER ON CUSTOMER.CDCUSTOMER = REQUEST.CDCUSTOMER
GROUP BY CUSTOMER.NMCUSTOMER, CUSTOMER.IDFONE, VLTOTAL

-- FALTA ORDERNAR
  
-- Lista 4) - e) A data do pedido, o nome do cliente, quantos produtos distintos ele pediu, o valor total do pedido (baseado nos valores da tabela productrequest), a média de valores do pedido (baseado nos valores da tabela productrequest)
-- ordenado pela quantidade de produtos distintos pedidos.

SELECT
REQUEST.DTREQUEST,
CUSTOMER.NMCUSTOMER,
COUNT(CDPRODUCT) AS REQUEST_PRODUCTS,
VLUNITARY * QTAMOUNT AS VLTOTAL,
AVG(VLUNITARY) AS MEDIA
FROM PRODUCTREQUEST
JOIN REQUEST ON PRODUCTREQUEST.CDREQUEST = REQUEST.CDREQUEST
JOIN CUSTOMER  ON CUSTOMER.CDCUSTOMER = REQUEST.CDCUSTOMER
GROUP BY REQUEST.DTREQUEST, CUSTOMER.NMCUSTOMER, VLUNITARY, QTAMOUNT

-- Lista 4) - f) O nome do fornecedor e quantos produtos ele fornece, para todos os fornecedores que fornecem mais que um produto;




