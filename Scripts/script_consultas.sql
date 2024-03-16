---------------------------
 -- Consultas
---------------------------
-- 1 - Top 10 Atletas que mais marcaram gols

SELECT atleta_gols, COUNT(*) AS total_gols
FROM tb_gols
GROUP BY atleta_gols
ORDER BY total_gols DESC
LIMIT 10;

-- 2 - Atleta que mais marcou gols em cada ano

SELECT ano, atleta_gols, total_gols
FROM (
SELECT EXTRACT(YEAR FROM tb_jogos.data_jogos) AS ano, atleta_gols, COUNT(*) AS total_gols,
RANK() OVER(PARTITION BY EXTRACT(YEAR FROM tb_jogos.data_jogos) ORDER BY COUNT(*) DESC) AS ranking
FROM tb_gols
JOIN tb_jogos ON tb_gols.id_partida_gols = tb_jogos.id_partida_jogos
GROUP BY EXTRACT(YEAR FROM tb_jogos.data_jogos), atleta_gols
	) AS subquery
WHERE ranking = 1;


-- 3 - Clube que mais ganhou jogos

SELECT clube_vencedor_jogos, 
COUNT(CASE WHEN clube_vencedor_jogos IS NOT NULL AND clube_vencedor_jogos <> '-' THEN 1 END) AS total_vitorias
FROM tb_jogos
GROUP BY clube_vencedor_jogos
ORDER BY total_vitorias DESC;

-- 4 - Jogador com mais cartoes em cada ano

SELECT ano, atleta_cartoes, total_cartoes
FROM (
SELECT EXTRACT(YEAR FROM tb_jogos.data_jogos) AS ano, atleta_cartoes, COUNT(*) AS total_cartoes,
RANK() OVER(PARTITION BY EXTRACT(YEAR FROM tb_jogos.data_jogos) ORDER BY COUNT(*) DESC) AS ranking
FROM tb_cartoes
JOIN tb_jogos ON tb_cartoes.id_partida_cartoes = tb_jogos.id_partida_jogos
GROUP BY EXTRACT(YEAR FROM tb_jogos.data_jogos), atleta_cartoes
	) AS subquery
WHERE ranking = 1;

-- 5 - Clubes com maior aproveitamento de chutes

SELECT clube_estatistica, 
CASE 
WHEN SUM(chutes_estatistica) > 0 THEN ROUND((SUM(chutes_gol_estatistica) * 100.0) / SUM(chutes_estatistica), 2)
ELSE 0
END AS aproveitamento
FROM tb_estatisticas
GROUP BY clube_estatistica
ORDER BY aproveitamento DESC;

-- 6 - Formacoes com maior aproveitamento

SELECT formacao, 
COUNT(*) AS total_vitorias
FROM (
SELECT formacao_mandante_jogos AS formacao
FROM tb_jogos
WHERE clube_vencedor_jogos = clube_mandante_jogos AND formacao_mandante_jogos <> ''
UNION ALL
SELECT formacao_visitante_jogos AS formacao
FROM tb_jogos
WHERE clube_vencedor_jogos = clube_visitante_jogos AND formacao_visitante_jogos <> ''
	) AS formacoes_vencedoras
GROUP BY formacao
ORDER BY total_vitorias DESC;

-- 7 - Tecnico com mais vitorias

SELECT tecnico, 
COUNT(*) AS total_vitorias
FROM (
SELECT tecnico_mandante_jogos AS tecnico
FROM tb_jogos
WHERE clube_vencedor_jogos = clube_mandante_jogos AND tecnico_mandante_jogos <> ''
UNION ALL
SELECT tecnico_visitante_jogos AS tecnico
FROM tb_jogos
WHERE clube_vencedor_jogos = clube_visitante_jogos AND tecnico_visitante_jogos <> ''
	) AS tecnicos_vencedores
GROUP BY tecnico
ORDER BY total_vitorias DESC;


-- 8 - Top 10 jogadores que mais marcaram gols contra

SELECT atleta_gols, COUNT(*) AS total_gols_contra
FROM tb_gols
JOIN tb_jogos ON tb_gols.id_partida_gols = tb_jogos.id_partida_jogos
WHERE tipo_gols = 'Gol Contra'
GROUP BY atleta_gols
ORDER BY total_gols_contra DESC
LIMIT 10;

-- 9 - Top 10 jogadores que mais marcaram penaltys

SELECT atleta_gols, COUNT(*) AS total_gols_penalty
FROM tb_gols
JOIN tb_jogos ON tb_gols.id_partida_gols = tb_jogos.id_partida_jogos
WHERE tipo_gols = 'Penalty'
GROUP BY atleta_gols
ORDER BY total_gols_penalty DESC
LIMIT 10;

-- 10 - Percentual de vitorias de jogos em casa e fora

SELECT 
(SELECT COUNT(*) FROM tb_jogos WHERE clube_vencedor_jogos = clube_mandante_jogos) * 100.0 / COUNT(*) AS percentual_vitorias_casa,
(SELECT COUNT(*) FROM tb_jogos WHERE clube_vencedor_jogos = clube_visitante_jogos) * 100.0 / COUNT(*) AS percentual_vitorias_fora
FROM tb_jogos;


-- 11 - Media de gols por tempo

WITH gols_por_tempo AS (
SELECT
id_partida_gols,
CASE
WHEN position('+' in minuto_gols) > 0 THEN
substring(minuto_gols from 1 for position('+' in minuto_gols)-1)
ELSE minuto_gols
END AS minuto_base,
minuto_gols
FROM tb_gols
						),
gols_convertidos AS (
SELECT
id_partida_gols,
CASE
WHEN CAST(minuto_base AS INTEGER) <= 45 THEN 'Primeiro Tempo'
ELSE 'Segundo Tempo'
END AS tempo,
COUNT(*) AS gols
FROM gols_por_tempo
GROUP BY id_partida_gols, tempo
					)
SELECT tempo,
AVG(gols) AS media_gols
FROM gols_convertidos
GROUP BY tempo;

-- 12 - Contagem de gols por tempo (descontando os gols feitos no acrescimo)

WITH gols_minutos AS (
SELECT
CASE 
WHEN position('+' in minuto_gols) > 0 THEN
CAST(substring(minuto_gols FROM 1 FOR position('+' in minuto_gols) - 1) AS INTEGER)
ELSE
CAST(minuto_gols AS INTEGER)
END AS minuto_jogo,
COUNT(*) AS total_gols
FROM tb_gols
GROUP BY minuto_jogo
					)
SELECT minuto_jogo, total_gols
FROM gols_minutos
ORDER BY minuto_jogo;