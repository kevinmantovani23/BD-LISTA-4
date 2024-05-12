USE projetos

--Exercício 1

SELECT id, nome, email, nomeusuario,
	senha = CASE(senha)
		WHEN '123mudar' THEN
			'********'
		ELSE
			senha
		END
FROM users

--Exercício 2

SELECT nome, descricao, dataproj,
	data_final = CASE(id)
		WHEN 10001 THEN
			DATEADD(DAY, 15, dataproj)
		ELSE
			NULL
		END
FROM projects
WHERE id IN (
	SELECT projects_id
	FROM user_has_projects
	WHERE users_id IN(
		SELECT id 
		FROM users
		WHERE email = 'aparecido@empresa.com'
		)
		)

--Exercício 3

SELECT nome, email 
FROM users
WHERE id IN(
	SELECT users_id 
	FROM user_has_projects
	WHERE projects_id IN(
		SELECT id 
		FROM projects
		WHERE nome = 'Auditoria'
		)
		)
		
--Exercício 4

SELECT nome, descricao, dataproj,
	data_final = '16/09/2014',
	custo_total = (79.85 * DATEDIFF(DAY, dataproj, '2014-09-16'))
FROM projects
WHERE nome LIKE '%Manutenção%'


