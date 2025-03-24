/* banco de dados para armazenar os registros dos Tipos_animais que atende, podendo ser Caninos, Felinos, Suínos, Caprinos, Equinos, etc 
onde cada Tipo_animal podera ter varios animais, para cada animal, voce deve armazenar (Id, nome, Id_tipo_animal, Dt_Nascimento, Cor, Peso, Altura).
Alem disso, o BD deve armazenar um historico de vacinas, onde animal pode ter 'N' vacinas. Para a tabela vacina, armazene 
(Id, nome, data_aplicacao, Id_animal [FK])*/

create database Veterinaria;
use Veterinaria;

create table Tipo_animal(
    Tipo varchar(30) not null,
    Id int not null auto_increment primary key
);

create table Animal(
    Id int not null auto_increment primary key,
    nome varchar(60) not null,
    Dt_Nascimento date not null,
    Cor varchar(60) not null,
    Peso float not null,
    Altura float not null,
    id_tipo_animal int not null,
    constraint fk_id_tipo_animal
       foreign key (id_tipo_animal) references tipo_animal(id)
);

create table Vacina(
   id int not null auto_increment primary key,
   nome varchar(60) not null,
   data_ap date not null,
   id_animal int not null,
   constraint fk_id_animal
      foreign key (id_animal) references Animal(id)
);

-- Tipos de animais
Insert into tipo_animal (tipo) values
('Caninos'), ('Felinos'), ('Suínos'), ('Caprinos'), ('Equinos'), ('Exóticos');

-- Caracteristicas
insert into Animal (nome, Dt_Nascimento, Cor, Peso, Altura, id_tipo_animal) values
('Lola', '2023-01-04', 'branco', 4.2, 0.42, 1),
('Miel', '2024-09-14', 'branco e laranja', 2.5, 0.40, 2),
('Mimi', '2019-05-08', 'preto', 6.6, 0.70, 3),
('Sugar', '2020-11-09', 'cinza', 3.0, 0.30, 4),
('Dudu', '2021-12-12', 'branco', 100.5, 0.25, 5);

-- Vacinas
insert into Vacina (nome, data_ap, id_animal) values
('V10', '2024-06-05', 1),
('Antirrábica', '2025-01-27', 4),
('Tétano', '2025-01-27', 4),
('Clostridial', '2023-07-10', 5),
('Gripe Suína', '2023-04-01', 5);