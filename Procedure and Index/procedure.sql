-- Procedure de cadastro de cliente:
delimiter \\
create procedure cadastro_cliente(nome_cliente varchar(30), cpf_cliente varchar(15), email_cliente varchar(60), telefone_cliente varchar(30), out saida varchar(80))
begin 
	if exists(select * from cliente where nome = nome_cliente) then 
		begin
			set saida = 'Este cliente já está cadastrado!';
		end;
    elseif exists(select * from cliente where cpf = cpf_cliente) then 
		begin
			set saida = 'Este cliente já está cadastrado!';
		end;
	else 
		insert into cliente(nome, cpf, email, telefone)
        values (nome_cliente, cpf_cliente, email_cliente, telefone_cliente);
		
        if row_count() = 0 then
			set saida = 'O cliente não foi cadastrado';
		else 
			set saida = 'Cliente cadastrado com sucesso!';
            end if;
	end if;
    select saida;
end \\
delimiter ;

call cadastro_cliente ('Israel Evangelista', '00744532101', 'i_ev@mail.com', '(55)9998-9999', @saida);

-- Procedure de controle de data de emissão:
delimiter \\
create procedure proced_insert_ordem(
	in emissao date,
    in previsao_conclusao date,
    in status ENUM('Em Serviço', 'Finalizado', 'Entregue')
    )
    begin
		if (emissao < previsao_conclusao) then
			insert into ordem (emissao, previsao_conclusao, status) values(emissao_p, previsao_conclusao_p, status_p);
            select * from ordem;
		else 
			select 'A "data de conclusão" não pode ser menor que a "data de emissão". Inserir nova "data de conclusão".' as 'Messagem de Erro';
		end if;
        
	end \\
delimiter ;

call proced_insert_ordem('2022-12-12','2022-11-10','Finalizado');
