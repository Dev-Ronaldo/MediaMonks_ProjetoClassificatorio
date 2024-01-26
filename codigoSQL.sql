CREATE TABLE tabela_resultado AS
-- Questão 1 Volume de Vendas
SELECT
B.c2 AS 'MARCA/MODELO',
SUM(A.c3) AS VALOR,
'-' AS COLUNA_3,
'Volume de Vendas por marca' AS LEGENDA
FROM correct_database_1 A 
INNER JOIN correct_database_2 B ON A.c2 = B.c1
GROUP BY 
B.c1,
B.c2
ORDER BY VALOR DESC;

INSERT INTO tabela_resultado
-- Questão 2 Veiculo Maior Receita
SELECT 
A.c5 AS MODELO,
SUM(A.c3*a.c4) AS TOTAL,
'-' AS COLUNA_3,
'Veiculos que geraram maior receita' AS LEGENDA
FROM correct_database_1 A
INNER JOIN correct_database_2 B ON A.c2 = B.c1 
GROUP BY
B.c1,
A.c5 
ORDER BY TOTAL DESC;

INSERT INTO tabela_resultado
-- Questão 2 Menor Receita
SELECT 
A.c5 AS MODELO,
SUM(A.c3*a.c4) AS TOTAL,
'-' AS COLUNA_3,
'Veiculos que geraram menor Receita' AS LEGENDA
FROM correct_database_1 A
INNER JOIN correct_database_2 B ON A.c2 = B.c1 
GROUP BY 
B.c1,
A.c5 
ORDER BY TOTAL ASC;

INSERT INTO tabela_resultado
-- Questão 3 media de vendas do ano por marca
SELECT 
B.c2 MARCA,
ROUND(AVG(A.c3),2) AS MEDIA,
CAST(A.c1 AS DATE) ANO,
'Media de Vendas no Ano' AS LEGENDA
FROM correct_database_1 A
INNER JOIN correct_database_2 B ON A.c2 = B.c1 
GROUP BY 
B.c1,
B.c2
ORDER BY MEDIA DESC;

INSERT INTO tabela_resultado
-- Questão 4 Qual marca gera receita maior com menor numero de vendas
SELECT 
B.c2 AS MARCA,
SUM(A.c4*A.c3)/ SUM(A.c3) AS RESULTADO_DIVISAO, --valor total dividido pela quantidade de vendas
SUM(A.c3) AS VENDAS,
'Maior Receita com menor numero de vendas' AS LEGENDA
FROM correct_database_1 A
INNER JOIN correct_database_2 B ON A.c2 = B.c1 
GROUP BY 
B.c1,
B.c2 
ORDER BY RESULTADO_DIVISAO DESC;

INSERT INTO tabela_resultado
-- Questão 5 Relação de veiculos mais vendidos
SELECT
A.c5 AS MODELO,
SUM(A.c3) AS QUANTIDADE_DE_VEICULOS_VENDIDOS,
B.c2 AS MARCA,
'Veiculos mais vendidos/Quantidade/Marca' AS LEGENDA
FROM correct_database_1 A
INNER JOIN correct_database_2 B ON A.c2 = B.c1
GROUP BY
B.c1, A.c5
ORDER BY
QUANTIDADE_DE_VEICULOS_VENDIDOS DESC;

SELECT * FROM tabela_resultado