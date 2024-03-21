-- Lista 7 - a) Excluindo todos os pedidos que forem menores que R$ 1.000,00, que não possuam itens cadastrados e que sejam no mês de junho/2003

DELETE REQUEST FROM REQUEST
JOIN PRODUCTREQUEST ON PRODUCTREQUEST.CDREQUEST = REQUEST.CDREQUEST
WHERE REQUEST.VLTOTAL < 1000 AND YEAR(REQUEST.DTREQUEST) = 2003 AND MONTH(REQUEST.DTREQUEST) = 6 AND PRODUCTREQUEST.CDPRODUCT IS NULL

-- Lista 7 - b) Atualizando o preço do produto como sendo a média dos valores unitários de venda, somente para produtos que venderam menos que 800 unidades

UPDATE PRODUCT 
SET VLPRICE = (SELECT AVG(VLUNITARY)
FROM PRODUCTREQUEST WHERE PRODUCTREQUEST.CDPRODUCT = PRODUCT.CDPRODUCT
GROUP BY CDPRODUCT)
FROM PRODUCTREQUEST WHERE (SELECT SUM(QTAMOUNT)
FROM PRODUCTREQUEST WHERE PRODUCT.CDPRODUCT = PRODUCTREQUEST.CDPRODUCT) > 800;

-- Lista 7 - c) Inserindo os fornecedores como clientes. Utilize como código o valor máximo mais o código do fornecedor para gerar o código do novo cliente criado a partir do fornecedor

INSERT INTO CUSTOMER (CDCUSTOMER, NMCUSTOMER, IDFONE)
SELECT ( SELECT MAX(CDCUSTOMER) FROM CUSTOMER) + CDSUPPLIER, NMSUPPLIER, SUPPLIER.IDFONE FROM SUPPLIER

-- Lista 7 - d)  Atualizando a data de entrega do pedido como sendo a data do pedido + 30 dias para pedidos em que a diferença entre essas duas datas seja menor que 10 dias e o cliente tenha comprado menos que R$ 10.000,00

UPDATE REQUEST
SET DTDELIVER = DAY(DTREQUEST) + 30
WHERE (DAY(DTDELIVER) - DAY(DTDELIVER) - DAY(DTREQUEST) + 30 ) > 10 AND REQUEST.VLTOTAL < 10000

