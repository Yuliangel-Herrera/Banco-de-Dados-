use Formularios;

insert into Cargos_Ocupados(Cargo, Dt_Inicio, Dt_Fim) 
values 
    ('Analista de Sistemas', '2024-06-01', null),
	('Desenvolvedor', '2025-08-24', null),
    ('Gerente de Projetos', '2024-06-28', '2029-06-28'),
    ('Auxiliar de Vendas', '2023-02-28', '2028-04-28');
    
insert into Dpt_lotacao(Departamento)
values
	 ('Tecnologia da Informação'),
     ('Recursos Humanos'),
     ('Ventas'),
     ('Financeiro');

insert into Endereco(Rua, Bairro, Cidade, Estado, CEP)
values
     ('Rua A', 'Centro', 'Videira', 'SC', 01000-000),
     ('Rua B', 'Jardins', 'Videira', 'SC', 01400-000),
     ('Rua C', 'Floresta', 'Videira', 'SC', 02060-000),
     ('Rua D', 'Centro', 'Videira', 'SC', 03800-000),
	 ('Rua X', 'Metro', 'São Paulo', 'SP', 03000-720);

insert into Dd_Cadastrais (Nome, Dt_Nascimento, Nacionalidade, Sexo, Est_Civil, RG, CPF, Dt_Admissao, Id_Cargo, Id_Lotacao)
values
	('Marianita Silva', '2000-01-22', 'Brasileiro', 'Feminino', 'Solteiro', 222456789, '12345678901', '2024-06-01', 1, 1),
    ('Maria Oliveira', '2005-04-01', 'Argentina', 'Feminino', 'Casado', 242456777, '11912345678', '2022-08-24', 4, 4),
    ('Bruno Canguro', '1995-05-15', 'Brasileiro', 'Masculino', 'Casado', 123456789, '22345678901', '2023-01-10', 3, 2),
    ('Maria Fabiola', '1990-08-20', 'Brasileira', 'Feminino', 'Casada', 987654321, '10987654321', '2023-02-18', 4, 3),
    ('Carlos Pereira', '1982-12-30', 'Brasileiro', 'Masculino', 'Divorciado', 456789123, '12312312312', '2023-03-01', 2, 1);
    
insert into Dependentes (Nome, Dt_Nascimento, Parentesco, Id_Dd_Cadastrais)
values
    ('Ana Silva', '2000-04-25', 'Esposa', 3),
	('Carla Oliveira', '2020-01-28','Filho', 4),
	('Pedro Pereira', '2018-11-07', 'Filho', 5);

-- COLSULTAS TESTE
-- Selecionar todos os dados cadastrais com informações de cargo e departamento
select  dc.Nome, dc.CPF, co.Cargo, dl.departamento
from Dd_Cadastrais dc
join Cargos_Ocupados co on dc.Id_Cargo = co.id
join Dpt_lotacao dl on dc.Id_Lotacao = dl.id;

-- Selecionar dependentes de um funcionário específico
select d.Nome, d.Parentesco
from Dependentes d
join Dd_Cadastrais dc on d.Id_Dd_Cadastrais = dc.id where dc.Nome = 'Bruno Canguro';

-- Selecionar funcionario, data de admissao na empresa e data de inicio no cargo atual
select dc.Dt_Admissao, dc.Nome, co.Cargo, co.Dt_Inicio
from Dd_Cadastrais dc
join Cargos_Ocupados co on dc.Id_Cargo = co.id