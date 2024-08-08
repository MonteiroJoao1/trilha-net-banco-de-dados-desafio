USE Filmes;

--##### Exerc�cio 1;
/************************************
 * Buscar o nome e ano dos filmes	*
 ************************************/
SELECT 
	COALESCE(f.Nome,'DESCONHECIDO') AS "Nome",
	COALESCE((CONVERT(VARCHAR,f.Ano)),'DESCONHECIDO') AS "Ano"
FROM Filmes f;


--##### Exerc�cio 2;
/********************************************
 * Buscar o nome e ano dos filmes			*
 * ordenados por ordem crescente pelo ano	*
 ********************************************/
SELECT 
	COALESCE(f.Nome,'DESCONHECIDO') AS "Nome",
	COALESCE((CONVERT(VARCHAR,f.Ano)),'DESCONHECIDO') AS "Ano"
FROM Filmes f
ORDER BY
	f.Ano
ASC;


--##### Exerc�cio 3;
/************************************************
 * Buscar pelo filme de volta para o futuro,	*
 * trazendo o nome, ano e a dura��o.			*
 ************************************************/
SELECT 
	COALESCE(f.Nome,'DESCONHECIDO') AS "Nome",
	COALESCE((CONVERT(VARCHAR,f.Ano)),'DESCONHECIDO') AS "Ano",
	COALESCE((CONVERT(VARCHAR,f.Duracao)+ ' minutos'),'DESCONHECIDO') AS "Dura��o"
FROM Filmes f
WHERE f.Nome COLLATE SQL_Latin1_General_CP1_CI_AS LIKE 'de volta para o futuro';


--##### Exerc�cio 4;
/****************************************
 * Buscar os filmes lan�ados em 1997	*
 ****************************************/
SELECT 
	COALESCE(f.Nome,'DESCONHECIDO') AS "Nome",
	COALESCE((CONVERT(VARCHAR,f.Ano)),'DESCONHECIDO') AS "Ano"
FROM Filmes f
WHERE f.Ano = 1997;


--##### Exerc�cio 5;
/************************************************
 * Buscar os filmes lan�ados AP�S o ano 2000	*
 ************************************************/
SELECT 
	COALESCE(f.Nome,'DESCONHECIDO') AS "Nome",
	COALESCE((CONVERT(VARCHAR,f.Ano)),'DESCONHECIDO') AS "Ano",
	COALESCE((CONVERT(VARCHAR,f.Duracao)+ ' minutos'),'DESCONHECIDO') AS "Dura��o"
FROM Filmes f
WHERE f.Ano > 2000
ORDER BY
	f.Nome
ASC;


--##### Exerc�cio 6;
/****************************************************************
 * Buscar os filmes com a duracao maior que 100					*
 * e menor que 150, ordenando pela duracao em ordem crescente	*
 ****************************************************************/
SELECT 
	COALESCE(f.Nome,'DESCONHECIDO') AS "Nome",
	COALESCE((CONVERT(VARCHAR,f.Ano)),'DESCONHECIDO') AS "Ano",
	COALESCE((CONVERT(VARCHAR,f.Duracao)+ ' minutos'),'DESCONHECIDO') AS "Dura��o"
FROM Filmes f
WHERE f.Duracao BETWEEN 101 AND 149
ORDER BY
	f.Duracao
ASC;



--##### Exerc�cio 7;
/********************************************************************
 * Buscar a quantidade de filmes lan�adas no ano,					*
 * agrupando por ano, ordenando pela duracao em ordem decrescente	*
 ********************************************************************/
SELECT 
	COALESCE((CONVERT(VARCHAR,f.Ano)),'DESCONHECIDO') AS "Ano",
	COUNT(COALESCE(f.Nome,'DESCONHECIDO')) AS "Quantidade"
FROM Filmes f
GROUP BY 
	f.Ano
ORDER BY
	"Quantidade"
DESC;


--##### Exerc�cio 8;
/********************************************
 * Buscar os Atores do g�nero masculino,	* 
 * retornando o PrimeiroNome, UltimoNome	*
 ********************************************/
SELECT 
	(COALESCE(a.PrimeiroNome,'')+' '+COALESCE(a.UltimoNome,'')) AS "Nome",
	(
		CASE
			WHEN a.Genero LIKE 'M'
				THEN 'Masculino'
			ELSE 
				'Feminino'
		END
	) AS "G�nero"
FROM Atores a
WHERE a.Genero LIKE 'M';


--##### Exerc�cio 9;
/********************************************
 * Buscar os Atores do g�nero feminino,		*
 * retornando o PrimeiroNome, UltimoNome,	*
 * e ordenando pelo PrimeiroNome			*
 ********************************************/
SELECT 
	(COALESCE(a.PrimeiroNome,'')+' '+COALESCE(a.UltimoNome,'')) AS "Nome",
	(
		CASE
			WHEN a.Genero LIKE 'M'
				THEN 'Masculino'
			ELSE 
				'Feminino'
		END
	) AS "G�nero"
FROM Atores a
WHERE a.Genero LIKE 'F'
ORDER BY
	a.PrimeiroNome
ASC;


--##### Exerc�cio 10;
/****************************************
 * Buscar o nome do filme e o g�nero	*
 ****************************************/
SELECT 
	COALESCE(f.Nome,'DESCONHECIDO') AS "Nome",
	COALESCE((CONVERT(VARCHAR,f.Ano)),'DESCONHECIDO') AS "Ano",
	COALESCE((CONVERT(VARCHAR,f.Duracao)+ ' minutos'),'DESCONHECIDO') AS "Dura��o",
	COALESCE(CONVERT(VARCHAR,g.Genero),'DESCONHECIDO') AS "G�nero do Filme"
FROM Filmes f
	INNER JOIN FilmesGenero fg ON fg.IdFilme = f.Id
	INNER JOIN Generos g ON g.Id = fg.IdGenero
ORDER BY
	f.Nome 
ASC;
--##### Exerc�cio 11;
/********************************************************
 * Buscar o nome do filme e o g�nero do tipo "Mist�rio"	*
 ********************************************************/
SELECT 
	COALESCE(f.Nome,'DESCONHECIDO') AS "Nome",
	COALESCE((CONVERT(VARCHAR,f.Ano)),'DESCONHECIDO') AS "Ano",
	COALESCE((CONVERT(VARCHAR,f.Duracao)+ ' minutos'),'DESCONHECIDO') AS "Dura��o",
	COALESCE(CONVERT(VARCHAR,g.Genero),'DESCONHECIDO') AS "G�nero do Filme"
FROM Filmes f
	INNER JOIN FilmesGenero fg ON fg.IdFilme = f.Id
	INNER JOIN Generos g ON g.Id = fg.IdGenero
WHERE g.Genero LIKE 'Mist�rio'
ORDER BY
	f.Nome 
ASC;

--##### Exerc�cio 12;
/****************************************************
 * Buscar o nome do filme e os atores, trazendo		*
 * o PrimeiroNome, UltimoNome e seu Papel			*
 ****************************************************/
SELECT 
	COALESCE(f.Nome,'DESCONHECIDO') AS "Nome",
	COALESCE((CONVERT(VARCHAR,f.Ano)),'DESCONHECIDO') AS "Ano",
	COALESCE((CONVERT(VARCHAR,f.Duracao)+ ' minutos'),'DESCONHECIDO') AS "Dura��o",
	COALESCE(CONVERT(VARCHAR,g.Genero),'DESCONHECIDO') AS "G�nero do Filme",
	(COALESCE(a.PrimeiroNome,'')+' '+COALESCE(a.UltimoNome,'')) AS "Nome do Ator",
	COALESCE(CONVERT(VARCHAR,ef.Papel),'DESCONHECIDO') AS "Papel do Ator"
FROM Filmes f
	INNER JOIN FilmesGenero fg ON fg.IdFilme = f.Id
	INNER JOIN Generos g ON g.Id = fg.IdGenero
	INNER JOIN ElencoFilme ef ON ef.IdFilme = f.Id
	INNER JOIN Atores a ON a.Id = ef.IdAtor
ORDER BY
	f.Nome 
ASC;
