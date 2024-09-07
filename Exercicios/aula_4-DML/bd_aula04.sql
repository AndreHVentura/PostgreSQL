
create domain chk_categoria text check (value='DRAMA' or value='COMEDIA');
create domain chk_status text check (value='DISPONIVEL' or value='ALUGADO');

create table tbl_cliente (
codigo_cliente integer PRIMARY KEY, 
nome text not null, 
cidade text, endereco text
);

create table tbl_titulo (
codigo_titulo integer primary key, 
titulo text not null, 
descricao text, 
categoria chk_categoria
);

create table tbl_livros (
cod_livro integer PRIMARY KEY, 
codigo_titulo integer REFERENCES tbl_titulo(codigo_titulo), 
status chk_status DEFAULT 'DISPONIVEL'
);

create table tbl_emprestimo (
numero_emprestimo integer PRIMARY KEY, 
codigo_cliente integer REFERENCES tbl_cliente(codigo_cliente), 
codigo_livro integer REFERENCES tbl_livros(cod_livro)
);

insert into tbl_cliente
(codigo_cliente, nome, cidade, endereco)
values
(1,'João Silva','São Paulo','Rua A, 123'),
(2,'Maria Santos','Rio de Janeiro','Av.B, 456'),
(3,'Pedro Almeida','Belo Horizonte','Rua C, 789'),
(4,'Ana Oliveira','Salvador','Av.D, 1011'),
(5,'Carlos Lima','Brasilia','Rua E, 1213');

insert into tbl_titulo
(codigo_titulo, titulo, descricao, categoria)
values
(1,'Aventuras Urbanas','Uma hístoria emocionante','DRAMA'),
(2,'Mistérios Antigos','Enigmas por resolver','COMEDIA'),
(3,'Amor nas Estrelas','Um romance intergaláctico','DRAMA'),
(4,'Código Enigmático','Segredos ocultos','COMEDIA'),
(5,'Histórias Perdidas','Contos esquecidos','DRAMA');

insert into tbl_livros
(cod_livro, codigo_titulo, status)
values
(1,1,'DISPONIVEL'),
(2,1,'ALUGADO'),
(3,2,'DISPONIVEL'),
(4,3,'ALUGADO'),
(5,4,'DISPONIVEL');

insert into tbl_emprestimo
(numero_emprestimo, codigo_cliente, codigo_livro)
values
(1,1,2),
(2,2,4),
(3,3,1),
(4,4,5),
(5,5,3);

--selecionar todos os clientes
SELECT * FROM tbl_cliente;

--Selecionar os clientes onde o código é maior que 3
SELECT * FROM tbl_cliente
WHERE codigo_cliente > 3;

--Selecionar todos os títulos
SELECT * FROM tbl_titulo;

CREATE TABLE tbl_cliente2 AS
SELECT codigo_cliente
FROM tbl_cliente;

INSERT INTO tbl_cliente2 (codigo_cliente)
SELECT codigo_cliente
FROM tbl_cliente;

UPDATE tbl_livros
SET status = 'DISPONIVEL'
WHERE status = 'ALUGADO';

DELETE FROM tbl_cliente2
WHERE codigo_cliente > 3;