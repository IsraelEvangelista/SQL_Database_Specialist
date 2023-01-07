select @@autocommit;
use ecommerce;
show tables;

-- setar o autocommit = off, ou false ou 0
set @@autocommit = false;

-- Transação com Procedure:
-- Savepoint
savepoint insercao_pedido;

-- Transação
 delimiter //
    create procedure insercao_pedido_ecommerce()
		begin
			declare exit handler for sqlexception
			begin
				show errors limit 1;
				rollback to savepoint insercao_pedido;
                select 'A transação foi encerrada devido a algum erro ocorrido!' as Warning;
			end;
            
            start transaction;
            
            insert into cliente(nome, CNPJ_CPF, endereço, Dnascimento, e_mail, telefone) 
				values('Natanael Oliveira','22967028509','Rua NO','1995-10-02','n_ol@mail.com','(55)8998-7539');
			insert into pedido(status_pedido, descrição, frete, C_idcliente) 
				values('Pendente','Monitor Ultra Wide 4k LED','50.00','7');
            select 'A transação foi salva com sucesso!' as Warning;
            select 
				*
			from 
				cliente C
			left join 
				pedido P
                on C.idcliente = P.C_idcliente;
        end //
    delimiter ;

call insercao_pedido_ecommerce();
