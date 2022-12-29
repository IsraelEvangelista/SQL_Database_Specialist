-- Perguntas: 
-- Qual o departamento com maior número de pessoas? 
use company;
select * from employee;
select * from departament;

explain select 
	D.Dname as Departamento,
    count(E.Dno) as "Quantidade de Empregados"
from
	employee E, departament D
where
	E.Dno = D.Dnumber
    group by D.Dname;
    
-- Índice para "departamento com maior número de pessoas?"

create index idx_employee on employee(Dno);
    
-- Quais são os departamentos por cidade? 

select * from dept_locations;
select * from departament;

explain select
	DL.Dlocation as Cidade,
    D.Dname as Departamento
from
	departament D
left join
	dept_locations DL
    on D.Dnumber = DL.Dnumber;

-- Índice para "Quais são os departamentos por cidade?"
    
create index idx_departament on departament(Dnumber);
    
-- Relação de empregrados por departamento?

select * from employee;
select * from departament;

explain select 
	concat(E.Fname," ",E.Minit," ",E.Lname) as Empregado,
    D.Dname as Departamento
from
	employee E
left join
	departament D
    on D.Dnumber = E.Dno;
    
-- Índice para "Relação de empregrados por departamento?"

alter table employee add key idx_employee (Dno);

create index idx_employee_FullName on employee((concat(Fname, " ", Minit, " ", Lname)));
create index idx_employee_Fname on employee(Fname) using hash; -- não acontece. SGBD converte para BTREE
create index idx_employee_Minit on employee(Minit) using hash; -- não acontece. SGBD converte para BTREE
create index idx_employee_Lname on employee(Lname) using hash; -- não acontece. SGBD converte para BTREE

show index from employee;
