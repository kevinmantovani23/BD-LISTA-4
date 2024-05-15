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
-- Ramon: DATEADD espera retorno numerico para especificar a quantidade de tempo a ser adicionada à data e não precisa da comparação no Case
SELECT nome, descricao, dataproj,
       CASE id
           WHEN 10001 THEN DATE_ADD(dataproj, INTERVAL 15 DAY)
           ELSE NULL
       END AS data_final
FROM projects
WHERE id IN (
    SELECT projects_id
    FROM user_has_projects
    WHERE users_id IN (
        SELECT id 
        FROM users
        WHERE email = 'aparecido@empresa.com'
    )
);

--Exercício 3
-- Ramon: Só melhorei com o Join

SELECT u.nome, u.email 
FROM users u
JOIN user_has_projects up ON u.id = up.users_id
JOIN projects p ON up.projects_id = p.id
WHERE p.nome = 'Auditoria';

--Exercício 4
-- Ramon: 
SELECT nome, descricao, dataproj,
       '2014-09-16' AS data_final,
       (79.85 * DATEDIFF('2014-09-16', dataproj)) AS custo_total
FROM projects
WHERE nome LIKE '%Manutenção%';


