CREATE TABLE heroes
(
id SERIAL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
alterego VARCHAR(100),
poderes TEXT,
equipe VARCHAR(50),
data_de_criacao DATE);

INSERT INTO heroes (nome, alterego, poderes, equipe, data_de_criacao)
VALUES ('Superman', 'Clark Kent', 'Super força, visão de raio-x, voo', 'Liga da Justiça',
'1938-04-18'), ('Batman', 'Bruce Wayne', 'Inteligência, artes marciais, tecnologia avançada',
'Liga da Justiça', '1939-05-01'), ('Mulher-Maravilha', 'Diana Prince', 'Força sobre-humana,
agilidade, braceletes mágicos', 'Liga da Justiça', '1941-12-01'), ('Flash', 'Barry Allen',
'Super velocidade, viagem no tempo', 'Liga da Justiça', '1940-01-01'), ('Aquaman', 'Arthur Curry',
'Comunicação com animais marinhos, super força', 'Liga da Justiça', '1941-11-01');

INSERT INTO heroes (nome, alterego, poderes, equipe, data_de_criacao, id)
values ('Aquaman', 'Arthur Curry',
'Comunicação com animais marinhos, super força', 'Liga da Justiça', '1941-11-01','5');

Select * from heroes order by nome;


SELECT equipe, COUNT(*) AS quantidade_de_herois
FROM heroes
GROUP BY equipe;

DELETE FROM heroes WHERE id = '9';


SELECT * FROM heroes WHERE equipe = 'Liga da Justiça' AND data_de_criacao < '1950-01-01';

-- criando tabelas

CREATE TABLE poderes (
id SERIAL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
descricao TEXT
);

CREATE TABLE herois_poderes (
id_heroi INTEGER REFERENCES heroes(id),
id_poder INTEGER REFERENCES poderes(id),
PRIMARY KEY (id_heroi, id_poder)
);


----************* Conhecendo o SQL (Join, Function,View, Procedure) e queries avançadas **********
INSERT INTO poderes (nome, descricao)
VALUES ('Super força', 'Habilidade de levantar objetos pesados e destruir obstáculos com facilidade.'),
('Visão de raio-x', 'Capacidade de ver através de objetos sólidos.'),
('Voo', 'Habilidade de voar pelos céus com velocidade e destreza.'),
('Inteligência', 'Elevado nível de raciocínio lógico e capacidade estratégica.'),
('Artes marciais', 'Mestre em várias técnicas de luta corpo a corpo.'),
('Tecnologia avançada', 'Utilização de equipamentos e gadgets de alta tecnologia.');

—--------
INSERT INTO herois_poderes (id_heroi, id_poder)
VALUES
     --	( 5, 7), (5, 8) --Aquama 
	(2,8), --Batman
	(4,10), (4,9), --Flash
	(3,10), (3, 7), (3, 8), --Mulher-Maravilha
	(1, 8), (1, 12), (1, 9); --Superman

update from herois_poderes (id_heroi, id_poder)
VALUES
     --	(5, 1), (5, 3), --Aquaman
	(2,8), --Batman
	(4,10), (4,9), --Flash
	(3,10), (3, 7), (3, 8), --Mulher-Maravilha
	(1, 8), (1, 12), (1, 9); --Superman

DELETE FROM poderes

select * from  poderes 

TRUNCATE TABLE poderes;

update  table heroes


--Conhecendo o SQL (Join, Function,View, Procedure) e queries avançadasPágina
--12de 20Com a nova estrutura,vamos entender como realizar as nossas consultas
--com os JOINs.Exemplo de INNER JOIN:O  INNER  JOIN  combina  apenas  os
--registros  que  têm  correspondência  nas duas tabelas. Vamos recuperar os
--heróis e seus respectivos poderes, considerando apenas os heróis que têm
--poderes associados na tabela "herois_poderes":

SELECT h.nome AS nome_heroi, p.nome AS poder_heroi
FROM heroes h
INNER JOIN herois_poderes hp ON h.id = hp.id_heroi
INNER JOIN poderes p ON hp.id_poder = p.id;


--Exemplo de LEFT JOIN:O LEFT JOIN retorna todos os registros da tabela da esquerda
--(primeira tabela) e os registros correspondentes da tabela da direita (segunda tabela).
--Se não houver correspondência na tabela da direita, serão retornados valores NULL.

SELECT h.nome AS nome_heroi, p.nome AS poder_heroi
FROM heroes h
LEFT JOIN herois_poderes hp ON h.id = hp.id_heroi
LEFT JOIN poderes p ON hp.id_poder = p.id;

-- O  RIGHT  JOIN  é  similar  ao  LEFT  JOIN,  mas  retorna  todos  os  registros
--da tabela da direita e os registros correspondentes da tabela da esquerda.
--Se não houver correspondência na tabela da esquerda, serão retornados valores NULL.

SELECT h.nome AS nome_heroi, p.nome AS poder_heroi
FROM heroes h
RIGHT JOIN herois_poderes hp ON h.id = hp.id_heroi
RIGHT JOIN poderes p ON hp.id_poder = p.id;

--O  FULL  JOIN  retorna  todos  os  registros  das  duas  tabelas,
--combinando-os quando  houver  correspondência.  Se  não  houver
--correspondência  em  uma  das tabelas,  os  valores  correspondentes
--da  outra  tabela  serão  retornados  com  valores NULL

SELECT h.nome AS nome_heroi, p.nome AS poder_heroi
FROM heroes h
FULL JOIN herois_poderes hp ON h.id = hp.id_heroi
FULL JOIN poderes p ON hp.id_poder = p.id;