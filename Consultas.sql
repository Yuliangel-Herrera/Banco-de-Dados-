-- CONSULTAS
-- 1 quantidade de animais registrados no sistema?
-- 2 qual total de vacina aplicadas registras no sistema?
-- 3 quantos animais temos registrados para cada categoria?
-- 4 qual a categoria de animais que recebeu mais vacinas?
use Veterinaria;

Select Count(*) from Animal;

select Count(*) From Vacina;

select T.Tipo as categoria, count(A.Id) as Total_animais
from Tipo_animal T 
left join Animal A on T.Id = A.id_tipo_animal
group by T.Tipo;

select T.Tipo as categoria, count(V.Id) as Total_vacinas
from Tipo_animal T
left join Animal A on T.id = A.id_tipo_animal
left join vacina V on A.id = V.id_animal
group by T.Tipo
order by Total_vacinas desc limit 1;