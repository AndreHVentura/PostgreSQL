

create table cliente(
nome_cliente varchar,
cidade_cliente varchar,
endereco_cliente varchar
);

create table conta(
numero_conta integer,
nome_agencia varchar,
saldo real
);

create table emprestimo(
numero_emprestimo integer,
nome_agencia varchar,
valor real
);

create table agencia(
nome_agencia varchar,
cidade_agencia varchar,
depositos real
);

create table funcionario(
nome_funcionario varchar,
nome_agencia varchar,
cidade_funcionario varchar,
endereco_funcionario varchar
);

drop table cliente;
drop table funcionario;
drop table agencia;
drop table emprestimo;
drop table conta;

alter table cliente add column idade integer;
alter table cliente add column cpf varchar;

create schema andre;