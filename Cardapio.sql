-- Criação da tabela cardapio

create table cardapio (
   idPrato integer PRIMARY key AUTOINCREMENT,
   nomePrato char(50),
   preco float,   
   tipoPrato char(20),
   descricao char(50)
  ); 
  
-- inserção de dados na tabela cardapio
insert into cardapio(nomePrato, preco, tipoPrato, descricao) VALUES
('yakissoba', 25.99, 'massas', 'macarrão oriental com shoyu com carne bovina'),
('sushi', 20.99, 'peixes', 'peixe cru com algas e arroz'),
('temaki', 16.99, 'peixes', 'cone de peixe cru com creme de queijo'),
('lamen', 36.99, 'massas', 'caldo com macarrão, bisteca de porco e ovos');

-- ler todos os dados 
select * from cardapio

-- busca com operadores relacionais (Ler todos os dados cujo preco é maior que 20.99) 
select * from cardapio
where preco > 20.99

-- busca utilizado operadores lógicos (e ou)
select * from cardapio
where preco >= 17.00 and preco < 36.00

select * from cardapio
where nomeprato like '%i' or preco = 36.99

-- busca a partir da primeira ou ultima letra
select * from cardapio
where nomePrato like '%i' -- para a primeira letra coloque % por ultimo 

-- negação
select * from cardapio
where nomePrato NOT LIKE '%i'

select * from cardapio
where preco != 16.99

-- buscando campos especificos
select nomeprato, preco from cardapio

-- exclusão de dados
delete from cardapio
where id_pedido = 1

-- atualização de dados e operações matematicas
update cardapio
set preco = preco * 1.10-- aumento de 10% 
where id_pedido = 2


----- SOMA, MÉDIA, MIN, MAX, count
select sum(preco) as "Preço Total" from cardapio
select avg(preco) as "Média dos Preços" from cardapio 
select min(preco) as "Menor Preço" from cardapio 
select max(preco) as "Maior Preço" from cardapio
select count(preco) as "Contador de Pedidos" from cardapio

-- selecao distinta 
select DISTINCT preco from cardapio

-----------------------------------------------------------------
-- Ordenação Agrupação 

SELECT * from cardapio
order by preco desc -- ordena preco em ordem descresente 

-- Calcula a média de cada tipo de comida (peixes, massas)
select tipoprato, avg(preco) as "Média dos Tipos de Pratos"
from cardapio
GROUP by tipoprato

------------- CRIAÇÃO DE TABELAS COM RELAÇÕES
create table clientes (
  idCliente integer PRIMARY key AUTOINCREMENT,
  nomeCli char(20),
  telefone char(10),
  endereco char(20));
  
  
create table pedidos (
  idPedido integer PRIMARY key AUTOINCREMENT,
  idprato int, 
  idCliente INT,
  data datetime,
  foreign key(idprato) REFERENCES cardapio(idprato),
  foreign key(idcliente) REFERENCES cliente(idcliente)
  );
  
--- INSERINDO VALORES

insert into clientes (nomeCli, telefone, endereco) VALUES
("André Silva", "149911223344", "Av. Brasil 454"),
("Maria Souza", "119811223355", "Rua Paulo Freire, 87"),
("Joana Gomes", "179788445566", "Av. 07 de Setembro, 74"),
("Luíz Ramos", "21981122335544", "Rua 12 de Setembro, 798");

insert into pedidos (idCliente, idprato,  data) VALUES
(1, 1, '2021-11-01 17:25:31'),
-- AQUI o Cliente de ID 1 (André), pediu um prato de ID 1 (yakissoba) na data informada acima
(1, 2, '2021-11-05 18:25:31'),
(1, 2, '2021-11-08 18:12:05'),
(2, 3, '2021-11-12 11:05:15'),
(2, 4, '2021-11-12 12:15:32'),
(2, 1, '2021-11-14 11:01:49'),
(3, 4, '2021-11-15 18:50:47'),
(3, 2, '2021-11-17 19:42:36'),
(2, 3, '2021-11-19 15:33:01'),
(4, 2, '2021-11-20 12:21:17'),
(4, 4, datetime('now')); -- comando que pega a data e hora exata de agora

---- FAZENDO UNIÃO DAS TABELAS RELACIONADAS -----
--- QUERO SABER O NOME DO CLIENTE, O NOME PRATO PEDIDO E A DATA que foi realizada

SELECT clientes.nomeCli, cardapio.nomeprato, pedidos.data
from clientes, cardapio, pedidos
where clientes.idcliente = pedidos.idCliente AND
cardapio.idprato = pedidos.idprato
 

 






  




