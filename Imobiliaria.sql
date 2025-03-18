create database  Imobiliaria;
use Imobiliaria;
create table `imovel` (
   `Id` int,
   `Nome` char(30),
   `Descricao` text,
   `Nro_quartos` int,
   `Valor_venda` float
);

insert into imovel (Id, Nome, Descricao, Nro_quartos, Valor_venda)
values (6, 'Apartamento', 'No centro da cidade', 2, 50.644 ), 
       (5, 'casa', 'Prossima da praia', 4, 102.644 ), 
       (3, 'Conjugado', 'Com otima locação', 2, 90.544 ), 
       (9, 'casa', 'No centro da cidade', 2, 150.643 ), 
       (7, 'casa', 'luxosa', 3, 189.433 ), 
       (2, 'Apartamento', 'lindo', 1, 500.544 ), 
       (8, 'conjugado', 'Com gardim', 2, 480.644 ), 
       (1, 'Apartamento', 'Com piscina', 1, 832.644 ),
       (10, 'Apartamento', 'Com vista ao mar', 2, 599.644 ), 
       (6, 'Apartamento', 'Amplio', 3, 583.644 );
       
       select * from `imovel`;
       select * from `imovel` where Nome = 'Apartamento';
       select Nome, Nro_quartos, Descricao from imovel;
       