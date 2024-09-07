-- Database: bd_aula_3

-- DROP DATABASE IF EXISTS bd_aula_3;

CREATE TABLE tbl_titulo (
codigo_titulo integer primary key,
titulo text not null,
descricao text not null,
categoria text not null
);

CREATE TABLE tbl_cliente (
codigo_cliente integer primary key,
nome text not null,
cidade text not null,
endereco text not null
);

create table tbl_livros (
cod_livro integer primary key,
codigo_titulo integer references tbl_titulo (codigo_titulo),
status text
);

create table tbl_emprestimo (
numero_emprestimo integer primary key,
codigo_cliente integer references tbl_cliente (codigo_cliente),
codigo_livro integer references tbl_livros (cod_livro)
);

CREATE DOMAIN chk_status text check (value in('DISPONIVEL','ALUGADO'));
CREATE DOMAIN chk_categoria text check (value in('DRAMA','COMEDIA'));

ALTER TABLE tbl_livros
ADD CONSTRAINT fk_codigo_titulo
FOREIGN KEY (codigo_titulo)
REFERENCES tbl_titulo (codigo_titulo);

ALTER TABLE tbl_emprestimo
ADD CONSTRAINT fk_codigo_cliente
FOREIGN KEY (codigo_cliente)
REFERENCES tbl_cliente (codigo_cliente);

ALTER TABLE tbl_emprestimo
ADD CONSTRAINT fk_cod_livro
FOREIGN KEY (codigo_livro)
REFERENCES tbl_livros (cod_livro);