create database Formularios;
use Formularios;

create table Dd_Cadastrais (
    Id int not null auto_increment primary key,
    Nome varchar(250) not null,
    Dt_Nascimento date not null,
    Nacionalidade varchar(250) not null,
    Sexo varchar(100) not null,
    Est_Civil varchar(100) not null,
    RG int not null,
    CPF varchar(11) not null unique,
    Dt_Admissao date not null,
    Id_Cargo int,
    Id_Lotacao int,
    foreign key (Id_Cargo) references Cargos_Ocupados(Id),
    foreign key (Id_Lotacao) references Dpt_Lotacao(Id)
);

create table Endereco (
   Id int not null auto_increment primary key,
   Rua varchar(250) not null,
   Bairro varchar(250) not null,
   Cidade varchar(250) not null,
   Estado varchar(250) not null,
   CEP int not null,
   Id_Dd_Cadastrais INT UNIQUE,
    foreign key (Id_Dd_Cadastrais) references Dd_Cadastrais(Id)
    on delete cascade
    on update cascade
);

create table Cargos_Ocupados (
    Id int not null auto_increment primary key,
    Cargo varchar(200) not null,
    Dt_Inicio date not null,
    Dt_Fim date 
);

create table Dpt_lotacao (
    Id int not null auto_increment primary key,
    Departamento varchar(200) not null
);

create table Dependentes (
    Id int not null auto_increment primary key,
	Nome varchar(250) not null,
    Dt_Nascimento date not null,
    Parentesco varchar(160) not null,
    Id_Dd_Cadastrais int,
    foreign key (Id_Dd_Cadastrais) references Dd_Cadastrais(Id)
);