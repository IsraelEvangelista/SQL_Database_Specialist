select @@autocommit;
use ecommerce;
show tables;

-- setar o autocommit = off, ou false ou 0
set @@autocommit = false;

-- Transação 01:
start transaction;
	-- Consulta
	select PD.categoria, 
	   sum(PP.quantidade) as Quantidade, 
       sum(PD.valor) as Valor, 
       sum(P.frete) as Frete, 
       sum(((PP.quantidade*PD.valor)+P.frete)) as 'Valor Total'
from 
	pedido P
left join 
	rel_produto_pedido PP
    on P.idpedido = PP.P_idpedido
left join
	produto PD
    on PP.PD_idproduto = PD.idproduto
    group by PD.categoria
    order by 5;
COMMIT;

-- Transação 02:
/*Primiera Transação*/
Start transaction;
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
    order by C.nome;   
Commit;

/*Segunda Transação*/
Start transaction;
	-- select orderNumbers as ID, orderStatus as Status, productCode as Product, price * 0,10 as Send_value from orders natural join ordersDetails;
    update pedido set status_pedido = 'Entregue' where C_idcliente = 1;
commit;
