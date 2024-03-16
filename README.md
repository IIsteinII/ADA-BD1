# **ADA - SANTANDER CODERS 2023 - PROJETO SQL**

**NOME: Artur Stein Carmo**\
**ID: 1116023**

# **DATASET**
O Dataset escolhido para o projeto foi **Campeonato Brasileiro de futebol** de autoria do Adão Duque, Dataset que contém 8404 partidas de 2003 até 2023, e suas respectivas informações.

- [Kaggle do projeto](https://www.kaggle.com/datasets/adaoduque/campeonato-brasileiro-de-futebol)
- [Github do projeto](https://github.com/adaoduque/Brasileirao_Dataset)

# **INFORMAÇÕES SOBRE AS TABELAS**
O Dataset possui 4 tabelas nomeadas de: Campeonato-brasileiro-cartoes, Campeonato-brasileiro-estatisticas-full, Campeonato-brasileiro-full, Campeonato-brasileiro-gols.

**Campeonato-brasileiro-cartoes:**\
Tabela que contém as informações sobre os cartöes de cada partida, tendo a suas colunas: **id_partida, rodada, clube, cor, atleta, num_camisa, posicao, minuto.** 

**Campeonato-brasileiro-estatisticas-full:**\
Tabela que contém as informações sobre as estatistícas de cada partida, tendo a suas colunas: **id_partida_estatisticas, rodada_estatistica, clube, chutes, chutes_gol, posse_bola, passes, precisao_passes, faltas, qtd_cartoes_ama, qtd_cartoes_verm, impedimentos, escanteios.** 

**Campeonato-brasileiro-full:**\
Tabela principal que contém as informações gerais sobre cada partida, tendo a suas colunas: **id_partida,rodada, data, horario, clube_mandante, clube_visitante, formacao_mandante, formacao_visitante, tecnico_mandante, tecnico_visitante, clube_vencedor, arena, placar_mandante, placar_visitante, estado_mandante, estado_visitante.** 

**Campeonato-brasileiro-gols:**\
Tabela que contém as informações sobre os gols de cada partida, tendo a suas colunas: **id_partida, rodada, clube, atleta_gols, minuto_gols, tipo_gols.** 

Todas essas informações não estão normalizadas, tendo as suas chaves candidatas em repetição nas suas colunas, além disso apresenta diversos valores faltantes, devido a difuldade de encontrar certos dados de partidas antigas.

# **CRIAÇÃO E IMPORTAÇÃO DAS TABELAS**
Todas as colunas necessárias para a criação do banco foram retiradas do Kaggle, tendo o resultado:

![alt text](image.png)

![alt text](image-1.png)

![alt text](image-2.png)

![alt text](image-3.png)

Para a importação dos dados, utilizou-se a ferramenta **Import/Export Data**, disponível no pgAdmin4. Como mostra a imagem:

![alt text](import.png)

Devido os problemas mencionados acima com a falta de diferentes valores e como foram preenchdos no csv, onde diferentes colunas, seus valores faltantes eram marcados com "", "None", "-". Para a importação dos arquivos ocorrer de forma correta foi necessário um pequeno tratamento de dados, já presente nos arquivos do repositório. Outros foram mantidos já que não resultavam em erros na importação dos arquivos, sendo tratados nas consultas.

Já que o foco do projeto não é consistência e sim as consultas, mantive as tabelas com estes erros de normalização e dados faltantes, resultando assim em tabelas sem chaves, já que não apresentavam valores únicos.

OBS: as colunas que contém minutos foram criadas como VARCHAR devido aos acréscimos, que foram colocados como "90+1" pelo criador do Dataset, o tratamento foi feito nas consultas que utilizam esses valores.

# **CONSULTAS**
- **Top 10 atletas que mais marcaram gols**:

![alt text](image-4.png)
![alt text](image-5.png)

- **Atletas que mais marcaram gols em cada ano**:

![alt text](image-6.png)
![alt text](image-7.png)

- **Clubes que mais ganharam jogos**:

![alt text](image-8.png)
![alt text](image-9.png)

- **Jogadores que mais receberam cartões em cada ano**:

![alt text](image-10.png)
![alt text](image-11.png)

- **Clubes com maior aproveitamento em seus chutes**:

![alt text](image-12.png)
![alt text](image-13.png)

- **Formações com maior aproveitamento**:

![alt text](image-14.png)
![alt text](image-15.png)

- **Técnicos com mais vitórias**:

![alt text](image-16.png)
![alt text](image-17.png)

- **Top 10 atletas que mais marcaram gols contra**:

![alt text](image-18.png)
![alt text](image-19.png)

- **Top 10 atletas que mais marcaram cobrando penaltys**:

![alt text](image-20.png)
![alt text](image-21.png)

- **Percentual de jogos ganho em casa e fora**:

![alt text](image-22.png)
![alt text](image-23.png)

- **Média de gols por cada tempo**:

![alt text](image-24.png)
![alt text](image-25.png)

- **Contagem de gols por cada tempo (erxcluindo gols que aconteceram nos acréscimos)**:

![alt text](image-26.png)
![alt text](image-27.png)

# **CONSIDERACOES FINAIS**

Este projeto buscou aplicar os conhecimentos de SQL adquiridos no módulo de Banco de Dados I por meio da aplicação prática. O objetivo deste projeto era analisar dados de partidas de futebol e estatísticas associadas para extrair insights relevantes sobre o desempenho das equipes, jogadores e técnicos. As consultas realizadas forneceram informações valiosas sobre diferentes aspectos das partidas, incluindo resultados, estatísticas de jogadores e técnicos, e distribuição de gols ao longo do tempo.

Obrigado pela atenção!

Agradecimento especial ao professor desse módulo **Aruã Sousa**!
