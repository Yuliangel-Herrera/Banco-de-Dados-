create database Ficha_medica;
use Ficha_medica;

create table Cadastro(
    Id int not null auto_increment primary key,
    Nome varchar(200) not null,
    Dt_nascimento date not null,
    Sexo varchar(60) not null,
    Est_civil varchar(100) not null,
    RG varchar(7) not null,
    Telefone varchar(11) not null,
    Id_endereco_atual int,
    Id_convenio int,
      foreign key (Id_convenio) references Convenio(Id)
);

alter table Cadastro
add constraint fk_endereco_atual
  foreign key (Id_endereco_atual) references Endereco(Id);

create table Endereco (
   Id int not null auto_increment primary key,
   Rua varchar(250) not null,
   Bairro varchar(250) not null,
   Cidade varchar(250) not null,
   Estado varchar(250) not null,
   CEP int not null,
   Id_cadastro int unique,
    foreign key (Id_cadastro) references Cadastro(Id)
    on delete cascade
    on update cascade
);

create table Convenio(
	Id int not null auto_increment primary key,
    Tipo varchar(200) not null
);

create table Consultas(
    Id int not null auto_increment primary key,
    Data date not null,
    Diagnostico varchar(400) not null,
    Crm_medico int,
    Id_paciente int,
     foreign key (Crm_medico) references Medico(Crm),
     foreign key (Id_paciente) references Cadastro(Id)
);

create table Medico(
    Crm int not null auto_increment primary key,
    Nome varchar(200) not null,
    Especialidade varchar(200) not null
);

create table Exame(
	Id int not null auto_increment primary key,
    Data date not null,
    Tipo varchar(200) not null,
    Crm_medico int,
      foreign key (Crm_medico) references Medico(Crm)
);
