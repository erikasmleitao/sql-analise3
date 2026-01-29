/*
Objetivo:
Retornar o total vendido pelos vendedores que venderam a partir de 5.000.000.

Banco de dados:
SQL Server (T-SQL)

Observação:
Utiliza variável para definir o valor de corte e a cláusula HAVING
para filtrar resultados agregados.
*/




USE sales
DECLARE @limite_corte DECIMAL
SET @limite_corte = '5000000'


SELECT 
dbo.vendedores.[ID do Vendedor],
dbo.vendedores.[Nome do Vendedor],
 SUM(vendas.[Preço Unitário] * vendas.[Quantidade Vendida]) AS total_vendida
FROM vendedores
LEFT JOIN
vendas ON vendedores.[ID do Vendedor] = vendas.[ID do Vendedor]
 GROUP BY 
 dbo.vendedores.[ID do Vendedor],
 dbo.vendedores.[Nome do Vendedor]
HAVING 
SUM(vendas.[Preço Unitário] * vendas.[Quantidade Vendida]) > @limite_corte
ORDER BY
total_vendida DESC
