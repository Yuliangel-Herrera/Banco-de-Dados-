use Ficha_medica;

insert into Cadastro(Nome, Dt_nascimento, sexo, Est_civil, RG, Telefone, Id_endereco_atual, Id_convenio)
Values
    ('Maria Fernanda Lima', '1990-04-12', 'F', 'Casada', '1234567', '11987654321', 1, 1),
    ('João Pedro Silva', '1985-08-23', 'M', 'Solteiro', '2345670', '21998765432', 2, 2),
    ('Ana Paula Mendes', '1992-11-05', 'F', 'Casada', '3456781', '31912345678', 3, 3),
    ('Carlos Henrique Souza', '1978-03-17', 'M', 'Divorciado', '6789012', '41987651234', 4, 2),
    ('Fernanda Costa Rocha', '2000-09-29', 'F', 'Solteira', '5890123', '61996543210', 5, 1);
    
insert into Endereco(Rua, Bairro, Cidade, Estado, CEP)  
values
	 ('Rua A', 'Centro', 'Videira', 'SC', 01000-000),
     ('Rua B', 'Jardins', 'Videira', 'SC', 01400-000),
     ('Rua C', 'Floresta', 'Joaçaba', 'SC', 02060-000),
     ('Rua D', 'Centro', 'Videira', 'SC', 03800-000),
	 ('Rua X', 'Metro', 'São Paulo', 'SP', 03000-720);
     
UPDATE Endereco E
JOIN Cadastro C ON C.Nome = 'Maria Fernanda Lima'
SET E.Id_cadastro = C.Id
WHERE E.Rua = 'Rua A';

UPDATE Endereco E
JOIN Cadastro C ON C.Nome = 'João Pedro Silva'
SET E.Id_cadastro = C.Id
WHERE E.Rua = 'Rua B';

UPDATE Endereco E
JOIN Cadastro C ON C.Nome = 'Ana Paula Mendes'
SET E.Id_cadastro = C.Id
WHERE E.Rua = 'Rua C';

UPDATE Endereco E
JOIN Cadastro C ON C.Nome = 'Carlos Henrique Souza'
SET E.Id_cadastro = C.Id
WHERE E.Rua = 'Rua D';

UPDATE Endereco E
JOIN Cadastro C ON C.Nome = 'Fernanda Costa Rocha'
SET E.Id_cadastro = C.Id
WHERE E.Rua = 'Rua X';

 insert into Convenio(Tipo) 
 values
     ('Unimed'),
     ('Amil'),
     ('Omint'),
     ('Pladisa'),
     ('SulAmérica Saúde'),
     ('Porto Seguro Saúde');
     
insert into Consulta(Data, Diagnostico, Crm_medico, Id_paciente)  
values 
	('2025-06-01', 'Enxaqueca crônica', 123456, 1),
    ('2025-06-02', 'Infecção viral leve', 234567, 2),
    ('2025-06-03', 'Gravidez de 8 semanas', 345678, 3),
    ('2025-06-04', 'Lesão cutânea benigna', 456789, 4),
    ('2025-06-05', 'Hipertensão arterial', 567890, 5);
    
insert into Medico(Crm, Nome, Especialidade)  
values 
    (123456, 'Dr. João Silva', 'Neurologia'),             
    (234567, 'Dra. Ana Oliveira', 'Pediatria'),
    (345678, 'Dr. Carlos Pereira', 'Obstetrícia'),
    (456789, 'Dr. Marcos Lima', 'Dermatologia'),
    (567890, 'Dra. Paula Duarte', 'Clínica Médica');

    
insert into Exame(Data, Tipo, Crm_medico, Id_consulta)
values 
    ('2025-06-01', 'Ressonância Magnética', 123456, 6),
    ('2025-05-28', 'Ultrassonografia', 234567, 7),
    ('2025-05-03', 'Exame Pré-natal', 345678, 8),
    ('2025-04-17', 'Biópsia de pele', 456789, 9),
    ('2025-06-05', 'Eletrocardiograma', 567890, 10);

-- CONSULTAS 
-- INFORMAÇÕES GERAIS DO PACIENTE 
select c.Nome, c.sexo, c.RG, c.Telefone, e.Cidade, co.Tipo
from Cadastro c 
join Endereco e on c.Id_endereco_atual = e.Id
join Convenio co on Id_convenio = co.Id;

-- INFORMAÇÕES DE CONSULTA
select c.Nome, co.Diagnostico, co.Data, m.Nome as Doctor, m.Especialidade 
from Consulta co
join Cadastro c on co.Id_paciente = c.Id
join Medico m on co.Crm_medico = m.Crm;

-- EXAMENS DO PACIENTE E CONVENIO 
select c.Nome, e.Tipo as Exame, co.Tipo
from Exame e
join Consulta cons on e.Id_consulta = cons.Id 
join Cadastro c on cons.Id_paciente = c.Id
join Convenio co on c.Id_convenio = co.Id;
