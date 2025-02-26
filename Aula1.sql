-- CRIAR BD
create database GREENHOUSE;

-- DEFINIR BD COMO PADRÃO / UTILIZAVEL
use GREENHOUSE;

-- CRIAR TABELA / ENTIDADE
create table `plants`(
    `plant_name` char(30) not null,
    `sensor_value` float default null,
    `sensor_event` timestamp not null default current_timestamp on update current_timestamp,
    primary key `pk_plants` (`plant_name`)
);

-- VISUALIZAR TODAS OS OCORRÊNCIAS EM PLANTS 
-- LISTAR TODOS OS REGISTROS DE DADOS 
select * from `plants`;
-- VISUALIZAR COLUNAS ESPECIFICAS
select plant_name, sensor_value, sensor_event
from plants;

-- INSERIR DADOS NA TABELA / ENTIDADE PLANTS
insert into `plants`(plant_name, sensor_value)
values ('Rosa', 0.2319);

-- INSERIR MULTIPLOS REGISTROS DE UMA VEZ
insert into `plants`(plant_name, sensor_value)
values ('Cactus', 0.5893), ('girassol', 0.4893), ('Orquídea', 0.7492), ('Lírio', 0.3783);

-- CONSULTA APLICANDO FILTROS
select * from plants where plant_name = 'Cactus';

-- FILTROS COMPOSTOS COM OPERADORES AND OR XOR..
select * from plants where plant_name <> 'cannabis' and sensor_value <0.5566 and sensor_value> 0.2411