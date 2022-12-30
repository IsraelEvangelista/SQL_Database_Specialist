-- BD Company
use company;
show tables;
select * from employee;
select * from dependent;
select * from departament;
select * from dept_locations;
select * from project;
select * from works_on;

-- Número de empregados por departamento e localidade
create view employee_dept_local as
select 
	DL.Dlocation as Localidade,
    D.Dname as Departamento,
    count(Ssn) as Quantidade
from
	Employee E
left join
	departament D
    on D.Dnumber = E.Dno
left join
	dept_locations DL
	on D.Dnumber = DL.Dnumber
    group by Localidade, Departamento;
    
select * from employee_dept_local;

-- Lista de departamentos e seus gerentes
create view dept_manager as
select
	D.Dname as Departamentos,
    concat(E.Fname," ",E.Minit," ",E.Lname) as Gerente
from
	departament D
left join
	employee E
    on E.Ssn = D.Mgr_ssn;
    
select * from dept_manager;

-- Projetos com maior número de empregados (ex: por ordenação desc) 
create view proj_group_employee as
select
	P.Pname as Projetos,
    count(W.Essn) as Empregados
from
	project P
left join 
	works_on W
    on W.Pno = P.Pnumber
    group by Projetos
    order by 2 desc;
    
select * from proj_group_employee;

-- Lista de projetos, departamentos e gerentes 
create view proj_dept_manager as
select
	P.Pname as Projetos,
    D.Dname as Departamentos,
    concat(E.Fname," ",E.Minit," ",E.Lname) as Gerente
from
	project P
left join
	departament D
    on P.Dnum = D.Dnumber
left join
	employee E
	on D.Mgr_ssn = E.Ssn
    group by Projetos, Departamentos
    order by Gerente desc;
    
    select * from proj_dept_manager;

-- Quais empregados possuem dependentes e se são gerentes
create view employee_dep_manag as
select 
	concat(E.Fname," ",E.Minit," ",E.Lname) as Empregados,
    case 
		when DP.Essn is null then 'Não possui dependentes'
        else 'Possui dependente'
	end as 'Situação de dependência',
	case 
		when D.Mgr_ssn is null then 'Não é Gerente'
        else 'É Gerente'
	end as 'Situação de gerencia'
from
	employee E
left join 
	departament D
    on D.Mgr_ssn = E.Ssn
left join
	dependent DP
    on DP.Essn = E.Ssn;
    
select * from employee_dep_manag;

-- BD Ecommerce
use ecommerce;
show tables;
select * from cliente;
select * from pedido;
select * from produto;
select * from estoque;
select * from produto_estoque;
select * from fornecedor;
select * from terceiro;

-- Quantificando mercadorias dos fornecedores
create view count_prod_vendors as
select
	PD.descrição as 'Mercadoria dos Fornecedores',
    sum(D.quantidade) as 'Quantidade'
from
	produto PD,
    fornecedor F,
    disponibilizando D
where
	PD.idproduto = D.PD_idproduto and
    F.idfornecedor = D.F_idfornecedor
group by PD.descrição
order by 2 desc;

select * from count_prod_vendors;

-- Quantificando mercadorias de terceiros
create view count_prod_tercvendors as
select
	PD.descrição as 'Mercadoria dos Terceiros',
    sum(DT.quantidade) as 'Quantidade'
from
	produto PD,
    terceiro T,
    disponibilizando_terc DT
where
	PD.idproduto = DT.PD_idproduto and
    T.idterceiro = DT.T_idterceiro
group by PD.descrição
order by 2 desc;

select * from count_prod_tercvendors;

-- Listar quais pedidos foram realizados e verificar o valor total:                  
create view pedido_total as
select 
    P.descrição as Pedido, 
    PD.descrição as Descrição, 
    C.nome as Comprador, 
    PD.categoria, 
    PP.quantidade,
    PD.valor,
    P.frete,
    ((PP.quantidade*PD.valor)+P.frete) as 'Valor Total'
from
	cliente C
left join
	pedido P
    on C.idcliente = P.C_idcliente
left join
	rel_produto_pedido PP
    on P.idpedido = PP.P_idpedido
left join
	produto PD
    on PP.PD_idproduto = PD.idproduto
    order by 8 desc;

select * from pedido_total;    

    -- Ordenar os produtos por clientes, forma de pagamento e status do pedido
create view pedidos_status_forma as
select 
	P.descrição as Pedido,
    C.nome as Cliente,
	FP.tipo_pagamento as 'Forma de Pagamento',
    P.status_pedido as 'Status do Pedido'
from
	forma_pagamento FP
left join
	pedido P
    on P.idpedido = FP.idforma_pgt
left join
	cliente C
    on C.idcliente = P.C_idcliente
    order by C.nome;
    
select * from pedidos_status_forma;
    
-- Ordenar por um cliente específico os produtos, forma de pagamento e status do pedido
 create view esp_cliente_pedido as
 select 
	C.nome as Cliente,
    P.descrição as Produto,
	FP.tipo_pagamento as 'Forma de Pagamento',
    P.status_pedido as 'Status do Pedido'
from
	forma_pagamento FP
left join
	pedido P
    on P.idpedido = FP.idforma_pgt
left join
	cliente C
    on C.idcliente = P.C_idcliente
    having(C.nome) = 'Israel Evangelista'
    order by 4;   
    
select * from esp_cliente_pedido;

-- Clientes que compraram mais de R$ 200 no total
create view cliente_mais_200 as
select 
	C.nome as Cliente,
    PD.categoria as Categoria, 
	sum(PP.quantidade) as Quantidade, 
	sum(PD.valor) as Valor, 
	sum(P.frete) as Frete, 
	sum(((PP.quantidade*PD.valor)+P.frete)) as 'Total'
from 
	cliente C
left join
	pedido P
    on C.idcliente = P.C_idcliente
left join 
	rel_produto_pedido PP
    on P.idpedido = PP.P_idpedido
left join
	produto PD
    on PP.PD_idproduto = PD.idproduto
    group by 1, 2 
    having(Total) > 200
    order by 6 desc;

select * from cliente_mais_200;
