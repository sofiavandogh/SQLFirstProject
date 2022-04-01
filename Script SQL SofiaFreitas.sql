
--COLLEGE4PAWS TRABALHO FINAL QUERIES - SOFIA FREITAS

create database trabalhoFinal; --Criar a Base de Dados trabalhoFinal

use trabalhoFinal; --Seleccionar a BD onde vamos executar as queries


--CRIAR TABELAS DAS ENTIDADES
create table tutores (
 nif varchar(9) primary key not null,
 nome varchar(30) not null,
 rua varchar (30),
 localidade varchar(15),
 codpostal varchar(8),
 telefone varchar(9) not null,
 email varchar(30) not null
);

create table caes (
  id int primary key identity(100,1),
  nome varchar(15) not null,
  idade int,
  peso int,
  raca varchar(25),
  niftutor varchar(9),
  FOREIGN KEY (niftutor) REFERENCES tutores(nif)
);

create table cursos (
  ref varchar(15) primary key not null,
  designacao varchar(30) not null,
  duracao int, --HORAS
  preco money
);

create table pacotes (
   id int primary key,
   nome varchar(30) not null,
   duracao int not null,--DIAS
   preco money
);

create table formadores (
  nif varchar(9) primary key not null,
  nome varchar(30) not null,
  cc varchar(8),
  ss varchar(11) not null,
  email varchar(30) not null,
  rua varchar (30),
  localidade varchar(15),
  codpostal varchar(8),
  telefone varchar(9) not null,
  datanasc date,
  habilitacoes varchar(20),
  ordenado money,
);

create table monitores (
  nif varchar(9) primary key not null,
  nome varchar(30) not null,
  cc varchar(8),
  ss varchar(11) not null,
  email varchar(30) not null,
  rua varchar (30),
  localidade varchar(15),
  codpostal varchar(8),
  telefone varchar(9) not null,
  datanasc date,
  ordenado money,
);

--CRIAR TABELAS DOS RELACIONAMENTOS
create table aprender (
  idcao int,
  refcurso varchar(15),
  FOREIGN KEY (idcao) REFERENCES caes(id),
  FOREIGN KEY (refcurso) REFERENCES cursos(ref)
);

create table frequentar (
  idcao int,
  idpacotecreche int,
  FOREIGN KEY (idcao) REFERENCES caes(id),
  FOREIGN KEY (idpacotecreche) REFERENCES pacotes(id)
);

create table ministrar (
  refcurso varchar(15),
  nifformador varchar(9),
  datacurso date,
  FOREIGN KEY (refcurso) REFERENCES cursos(ref),
  FOREIGN KEY (nifformador) REFERENCES formadores(nif)
);

create table supervisionar (
  idpacotecreche int,
  nifmonitor varchar(9),
  FOREIGN KEY (idpacotecreche) REFERENCES pacotes(id),
  FOREIGN KEY (nifmonitor) REFERENCES monitores(nif)
);

--INSERIR REGISTOS NAS TABELAS DAS ENTIDADES

insert into tutores values
  ('101101101', 'Júlio Magalhaes', 'Travessa do Sol, 3', 'Lisboa', '1900-111', '911222333', 'juliom@gmail.com'),
  ('123456789', 'Sofia Freitas', 'Rua das Flores, 4', 'Lisboa', '1705-151', '912587465', 'sfreitas@gmail.com'),
  ('101258987', 'Ana Pires', 'Avenida dos Aliados, 65', 'Oeiras', '2100-311', '931456987', 'anapires@sapo.pt'),
  ('114574212', 'Carlos Silva', 'Rua do Marquês, 13F', 'Parede', '2620-118', '964123564', 'carlossilva@sapo.pt'),
  ('136987452', 'Gonçalo Pereira', 'Praça da Liberdade, 23, 2ºDto', 'Sintra', '2500-233', '915874147', 'gpereira7@gmail.com'),
  ('147852369', 'Anabela Gomes', 'Jardim 9 de Abril, 3', 'Alcabideche', '2800-522', '912369852', 'anabelagomes22@gmail.com');

insert into caes (nome, idade, peso, raca, niftutor) values
  ('Bobi', 5, 18, 'Beagle', '101101101'),
  ('Bolota', 4, 21, 'Não Definida', '114574212'),
  ('Paloma', 9, 13, 'Cocker', '147852369'),
  ('Diogo Cão', 1, 10, 'Labrador', '123456789'),
  ('Charlie', 2, 10, 'Não Definida', '101258987'),
  ('Sissy', 6, 9, 'Jack Russel', '136987452');

insert into cursos values
  ('1A', 'Treino do Cão Jovem', 25, 120),
  ('2A', 'Agressividade e Medo', 50, 220),
  ('3A', 'Bem-estar em Associações', 50, 220),
  ('4A', 'Treino em Positivo', 150, 570),
  ('5A', 'Como andar à trela', 8, 50),
  ('6A', 'Busca e Salvamento', 280, 880);

insert into pacotes (id, nome, duracao, preco) values
  (1, '1 x semana', 1, 50),
  (2, '2 x semana', 2, 100),
  (3, '3 x semana', 3, 150),
  (4, '4 x semana', 4, 200),
  (5, '5 x semana', 5, 250),
  (6, '6 x semana', 6, 300);

insert into formadores values
  ('125474111', 'Bruno Castro', '11114115', '12514789632', 'brunocastro@gmail.com','Travessa do Farol, 5', 'Lisboa', '1500-111', '911222333', '1985-08-17', '12º ano', 850),
  ('214127366', 'César Monteiro', '12254212', '21235214521', 'cmonteiro@sapo.pt', 'Rua das Tulipas, 3', 'Lisboa', '1700-251', '912587231', '1979-02-14', 'Licenciatura', 1050),
  ('221547896', 'César Monjardino', '24121419', '12321412544', 'cesarmonjardino@sapo.pt','Avenida dos Frutos, 21', 'Oeiras', '2108-211', '965456987', '1990-01-12', 'Mestrado', 1100),
  ('251474336', 'Beatriz Figueira', '25551114', '21332226668', 'bfigueira@gmail.com', 'Rua do Taberneiro, 12', 'Loures', '2620-520', '964852564', '1991-05-01', '12º ano', 850),
  ('236987412', 'Tiago Filipe', '41225741', '12321123321', 'tiagof@gmail.com', 'Rua da Felicidade, 14, 2ºF', 'Massamá', '2520-270', '915874569', '1989-03-15', 'Licenciatura', 1050),
  ('258369147', 'Sandra Costa', '35147841', '21366225114', 'sandracosta@sapo.pt', 'Praça das Alfaces, 9', 'Murches', '2810-522', '912369121', '1985-09-09', 'Licenciatura', 1050);

insert into monitores values
  ('218474111', 'André Silva', '21114115', '12323789632', 'andresilva@gmail.com','Rua da Praia, 7', 'Sintra', '1500-115', '911569333', '1999-08-05', 800),
  ('227127366', 'Carla Ferreira', '14484212', '21363214521', 'carlaferre@sapo.pt', 'Rua das Flautas, 3', 'Lisboa', '1740-251', '912547231', '2000-02-01', 800),
  ('263547896', 'David Moita', '29121419', '12343412544', 'davidmoita@sapo.pt','Rua das Janelas, 21', 'Cacém', '3108-211', '965989987', '1998-05-12', 850),
  ('269474336', 'Filipa Santiago', '25551114', '21383226668', 'fsantiago@gmail.com', 'Travessa do Arco, 12', 'Odivelas', '2520-520', '964214564', '1991-04-04', 850),
  ('252987412', 'Hugo Vaz', '26625741', '12373123321', 'hugovaz@gmail.com', 'Travessa do Sul, 14, 2ºF', 'Odivelas', '2710-270', '915144569', '1999-03-22', 750),
  ('231369147', 'Sónia Neves', '24147841', '21313225114', 'sneves@sapo.pt', 'Rua Alves Redol, 9', 'Cascais', '2960-522', '912999121', '2000-09-30', 750);


--INSERIR REGISTOS NAS TABELAS DE RELACIONAMENTOS

insert into aprender (idcao, refcurso) values 
  (100, '1A'),
  (100, '3A'),
  (101, '1A'),
  (101, '4A'),
  (102, '6A'),
  (103, '5A'),
  (104, '5A'),
  (105, '3A');

insert into frequentar (idcao, idpacotecreche) values
  (101, 1),
  (103, 5),
  (105, 4),
  (104, 3),
  (102, 2),
  (100, 6);

insert into ministrar (refcurso, nifformador, datacurso) values
  ('1A', '125474111', '2019-05-02'),
  ('3A', '214127366', '2019-05-03'),
  ('1A', '221547896', '2019-05-04'),
  ('4A', '251474336', '2019-05-05'),
  ('6A', '236987412', '2019-05-06'),
  ('5A', '258369147', '2019-05-07'),
  ('5A', '221547896', '2019-05-08'),
  ('3A', '214127366', '2019-05-09');

insert into supervisionar (idpacotecreche, nifmonitor) values
  (1, '231369147'),
  (2, '252987412'),
  (3, '269474336'),
  (4, '263547896'),
  (5, '227127366'),
  (6, '218474111');


--QUERIES PARA CONSULTA DOS DADOS (20 queries = 2 x 10 tabelas)

-- 1.listar todas as tabelas da BD trabalhoFinal:
  select * from INFORMATION_SCHEMA.TABLES;  

-- 2.encontrar o nome e email de cada tutor:
  select nome as nometutor, email from tutores; 

-- 3.identificar os tutores que morem em Lisboa e cujo telefone comece por "911":
  select nome from tutores where localidade like 'Lisboa' and telefone like '911%'; 

-- 4.identificar o nome dos primeiros 5 formadores, por ordem alfabética:
  select top 5 nome from formadores order by nome ASC; 
  
-- 5.identificar todos os registos de formadores que vivam numa localidade cujo nome comece por uma letra entre M e Z, por ordem alfabética;
  select * from formadores where localidade like '[M-Z]%' order by localidade; 
  
-- 6. quantos monitores vivem em Odivelas?
  select count(localidade) as num_monitores_odivelas from monitores where localidade like 'Odivelas';
  
-- 7.quantos cães de raça existem?
 select count(raca) as caes_raca from caes where raca not like 'Não Definida'; 

-- 8.qual o preço médio dos cursos disponíveis?
 select avg(preco) as PrecoMedioCursos from cursos; 

-- 9.qual o pacote com o preço mais elevado?
 select max(preco) as PrecoMaisElevado, nome from pacotes; 

-- 10.qual o nome do pacote que tem o preço mais elevado?
 select nome, preco from pacotes where preco = (select max(preco) from pacotes); 

-- 11.identificar quais os cursos (nome/designação), sem repetições, que ocorreram nos primeiros 4 dias de Maio
  select distinct designacao from cursos
     inner join ministrar
	 on cursos.ref = ministrar.refcurso where datacurso between '2019-05-01' and '2019-05-04';

--qual ou quais os cursos que a Sissy completou?
-- 12.primeiro saber qual o id da Sissy:

 select id as idSissy from caes where nome like 'Sissy';

-- 13.depois saber a designação do curso ou cursos na tabela aprender que tem como idcao o id da Sissy
 select designacao from cursos
     inner join aprender
	 on cursos.ref = aprender.refcurso where idcao = 105;

--qual o cão ou cães que frequentam a Creche 3 dias por semana?
-- 14.primeiro saber qual o id do pacote "3 x semana":

 select id as idPacote3Dias from pacotes where nome like '3 x semana';

-- 15.depois saber o nome do cão ou cães que frequentam o pacote com este id:
 select nome as nomeCao from caes
     inner join frequentar
	 on caes.id = frequentar.idcao where idpacotecreche = 3;

--onde vive o monitor ou monitores que supervisionam a Creche 2 vezes por semana?
-- 16.primeiro saber qual o id do pacote "2 x semana":

 select id as idPacote2Dias from pacotes where nome like '2 x semana';

-- 17.depois saber a localidade do monitor que supervisiona o pacote com este id:
 select localidade from monitores
     inner join supervisionar
	 on monitores.nif = supervisionar.nifmonitor where idpacotecreche = 2;

--na tabela "caes" queremos substituir a coluna "idade" por ano de nascimento:
-- 18.primeiro eliminar a coluna "idade":
 alter table caes drop column idade;
 
-- 19.depois inserir coluna "anonasc":
 alter table caes add anonasc varchar(4);

-- 20.introduzir dados na coluna "anonasc":
 update caes set anonasc = '2017' where id = 100;
 update caes set anonasc = '2018' where id = 101;
 update caes set anonasc = '2013' where id = 102;
 update caes set anonasc = '2020' where id = 103;
 update caes set anonasc = '2019' where id = 104;
 update caes set anonasc = '2016' where id = 105;

 select * from caes; --confirmar alteração 



