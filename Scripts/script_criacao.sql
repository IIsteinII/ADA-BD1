---------------------------
 -- Criacao das tabelas
---------------------------
CREATE TABLE tb_jogos(
	id_partida_jogos INT,
	rodada_jogos INT,
	data_jogos DATE,
	horario_jogos TIME,
	clube_mandante_jogos VARCHAR(200),
	clube_visitante_jogos VARCHAR(200),
	formacao_mandante_jogos VARCHAR(200),
	formacao_visitante_jogos VARCHAR(200),
	tecnico_mandante_jogos VARCHAR(200),
	tecnico_visitante_jogos VARCHAR(200),
	clube_vencedor_jogos VARCHAR(200),
	arena_jogos VARCHAR(200),
	placar_mandante_jogos INT,
	placar_visitante_jogos INT,
	estado_mandante_jogos VARCHAR(200),
	estado_visitante_jogos VARCHAR(200)
);

SELECT * FROM tb_jogos;
---------------------------
---------------------------
CREATE TABLE tb_estatisticas(
	id_partida_estatisticas INT,
	rodada_estatistica INT,
	clube_estatistica VARCHAR(200),
	chutes_estatistica INT,
	chutes_gol_estatistica INT,
	posse_bola_estatistica INT,
	passes_estatistica INT,
	precisao_passes_estatistica INT,
	faltas_estatistica INT,
	qtd_cartoes_ama_estatistica INT,
	qtd_cartoes_verm_estatistica INT,
	impedimentos_estatistica INT,
	escanteios_estatistica INT
);

SELECT * FROM tb_estatisticas;
---------------------------
---------------------------
CREATE TABLE tb_gols(
	id_partida_gols INT,
	rodada_gols INT,
	clube_gols VARCHAR(200),
	atleta_gols VARCHAR(300),
	minuto_gols VARCHAR(300),
	tipo_gols VARCHAR(200)
);

SELECT * FROM tb_gols;
---------------------------
---------------------------
CREATE TABLE tb_cartoes(
	id_partida_cartoes INT,
	rodada_cartoes INT,
	clube_cartoes VARCHAR(200),
	cor_cartoes VARCHAR(200),
	atleta_cartoes VARCHAR(300),
	num_camisa_cartoes INT,
	posicao_cartoes VARCHAR(200),
	minuto_cartoes VARCHAR(300)
);

SELECT * FROM tb_cartoes;
---------------------------











