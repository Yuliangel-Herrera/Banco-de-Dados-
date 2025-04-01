use `Nota_Fiscal_Normalizada`;

-- Forma classica de consultas combinadas
Select Nota_fiscal.*, Item_Nota_Fiscal.*
From Nota_fiscal, Item_Nota_Fiscal where Nota_fiscal.Nro_nota = Item_Nota_Fiscal.Nro_nota;

-- Podemos definir ALIAS (Apelidos) para as tabelas e facilitar a codificação
Select NF.Nro_Nota, NF.Dt_emissao, NF.Vl_total, INF.Cod_produto, INF.Qtd__produto, P.Desc_produto, P.Un_med, INF.Vl_preco, INF.Vl_total
From Nota_fiscal as NF, Item_nota_fiscal as INF, Produto as P
where NF.Nro_nota = INF.Nro_nota and INF.Cod_produto = P.Cod_produto
order by NF.Nro_nota Desc, INF.Cod_produto asc;

-- INNER JOIN 
Select NF.Nro_Nota, NF.Dt_emissao, NF.Vl_total, 
INF.Cod_produto, INF.Qtd__produto, 
P.Desc_produto, P.Un_med, INF.Vl_preco, INF.Vl_total
From 
    Nota_fiscal as NF 
    inner join 
       Item_nota_fiscal as INF on NF.Nro_nota = INF.Nro_nota 
	inner join 
       Produto as P on INF.Cod_produto = P.Cod_produto
where NF.Nro_nota = 4
order by 
     NF.Nro_nota Desc, INF.Cod_produto asc;
     
     -- FUNÇO~ES DE AGREGAÇÃO Contando e quantificando registros
     -- Quantas notas fiscais tem emitidas?
     select count(*)
     from Nota_fiscal;
     
-- Notas Fiscais por período
select count(*) 
from Nota_fiscal where Dt_emissao > '2025-03-21' and Dt_emissao < '2025-03-25';

-- Utilizando Between
select count(*) 
from Nota_fiscal where Dt_emissao between '2025-03-21' and '2025-03-25';

-- TOTAL DE NOTAS NO ANO
Select count(*) 
from Nota_fiscal where year(Dt_emissao)  = 2025;

-- Max() -> Obtendo o cliente que mais comprou determinado produto em uma única Nf
Select 
    NF.Nm_cliente as Cliente,
    P.Desc_Produto as Produto,
    Max(Qtd__produto) as Qtd
from Item_nota_fiscal as INF
inner join Nota_fiscal as NF on INF.Nro_nota = NF.Nro_nota
inner join Produto as P
    on INF.Cod_produto = P.Cod_produto
-- where INF.Cod_produto = 2
group by NF.Nm_cliente, P.desc_produto
order by Cliente, Qtd desc;