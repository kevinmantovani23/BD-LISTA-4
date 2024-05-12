USE locadora

--Exercício 1

SELECT id, ano, 
	titulo = CASE WHEN (LEN(titulo) > 10)
		THEN
			(RTRIM(SUBSTRING(titulo, 1, 10)) + '...')
		ELSE
			titulo
		END
FROM filme
WHERE id IN (
	SELECT filmeid 
	FROM dvd
	WHERE data_fabricacao > '2020-01-01'
	)

--Exercício 2

SELECT num, data_fabricacao, 
qtd_meses_desde_fabricacao = DATEDIFF(MONTH, data_fabricacao, GETDATE())
FROM dvd
WHERE filmeid IN (
	SELECT id 
	FROM filme
	WHERE titulo = 'Interestelar'
	)

--Exercício 3

SELECT dvdNum, data_locacao, data_devolucao,
dias_alugado = DATEDIFF(DAY, data_locacao, data_devolucao),
valor
FROM locacao
WHERE clienteNum_cadastro IN(
	SELECT num_cadastro
	FROM cliente
	WHERE nome LIKE '%Rosa%'
	)

--Exercício 4

SELECT nome, 
logradouro + ' ' + CONVERT(VARCHAR(5), num) as endereco_completo,
cep = SUBSTRING(cep, 1, 5) + '-' + SUBSTRING(cep, 6,3)
FROM cliente
WHERE num_cadastro IN (
	SELECT clienteNum_cadastro
	FROM locacao
	WHERE dvdNum = 10002
	)