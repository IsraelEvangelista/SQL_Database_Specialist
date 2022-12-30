-- BD Company
use mysql;
show tables;
select * from user;

-- proj_dept_manager -> Gerente
create user 'Gerente'@localhost identified by '123456789';
grant all privileges on company.proj_dept_manager to 'Gerente'@localhost;

-- employee_dep_manag -> Não foi necessário, pois a visão apenas informa se há ou não dependentes vinculados, assim como se o funcionário é ou não gerente.

-- BD ecommerce

-- (Dados privados de fornecedores e terceiros)
-- count_prod_vendors -> Gerente
create user 'Gerente_ecommerce'@localhost identified by '123456789';
grant all privileges on ecommerce.count_prod_vendors to 'Gerente_ecommerce'@localhost;

-- count_prod_tercvendors -> Gerente
create user 'Gerente_ecommerce'@localhost identified by '123456789';
grant all privileges on ecommerce.count_prod_tercvendors to 'Gerente_ecommerce'@localhost;

-- pedido_total -> Gerente
create user 'Gerente_ecommerce'@localhost identified by '123456789';
grant all privileges on ecommerce.pedido_total to 'Gerente_ecommerce'@localhost;

-- pedidos_status_forma -> Gerente
create user 'Gerente_ecommerce'@localhost identified by '123456789';
grant all privileges on ecommerce.pedidos_status_forma to 'Gerente_ecommerce'@localhost;

-- esp_cliente_pedido -> Gerente
create user 'Gerente_ecommerce'@localhost identified by '123456789';
grant all privileges on ecommerce.esp_cliente_pedido to 'Gerente_ecommerce'@localhost;

-- cliente_mais_200 -> Gerente
create user 'Gerente_ecommerce'@localhost identified by '123456789';
grant all privileges on ecommerce.cliente_mais_200 to 'Gerente_ecommerce'@localhost;