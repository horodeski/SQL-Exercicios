-- Lista 2 - a) O nome e telefone de todos os clientes em que o telefone começa com o dígito 4

SELECT * FROM SUPPLIER WHERE IDFONE LIKE '4%'

-- Lista 2 - b) Todas as colunas dos clientes que não possuem telefone cadastrado

select * from supplier where IDFONE=NULL

-- Lista 2 - c) Todas as colunas dos clientes que não possuem telefone cadastrado

SELECT IDFONE FROM SUPPLIER WHERE (LEN(IDFONE) < 10)

-- Lista 2 - d) O nome, quantidade em estoque e o preço com desconto de 10% dos produtos que tem mais de 2000 unidades em estoque
