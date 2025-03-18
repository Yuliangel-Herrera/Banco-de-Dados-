create database Unoesc_bank;
use Unoesc_bank;
create table Cliente(
	id int not null auto_increment primary key,
    nome varchar(255)
);

create table Conta(
    id int not null auto_increment primary key,
    nro_conta varchar(10) not null,
    id_cliente int not null,
    constraint fk_id_cliente_conta
    foreign key (id_cliente)
    references Cliente(id)
);

create table Transacao(
   id int not null auto_increment primary key,
   id_conta int not null,
   tipo_transacao int not null,
   data_hora datetime not null,
   valor float not null
);

-- Definindo uma FK posteriormente a criação da tabela
alter table transacao
add foreign key (id_conta)
references conta(id);

-- Criando índices
create index idx_transacao_tp_transacao
on Transacao (tipo_transacao);

create index idx_transacao_data_hora
on Transacao (data_hora);