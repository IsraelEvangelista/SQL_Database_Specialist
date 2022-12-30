-- Criação de triggers
-- BD Company
use company;
show tables;

select * from employee;
select * from dependent;
select * from departament;
select * from dept_locations;
select * from project;
select * from works_on;

-- Trigger null value check employee
delimiter //
create trigger null_value_check after insert on employee
for each row
	if (new.Address is null) then
		insert into user_messages (message, ssn) value (concat('Por favor, atualize seu endereço', new.Fname),new.Ssn);
	else 
		insert into user_messages (message, ssn) value (concat('Error',new.Fname),new.Ssn);
	end if;
//
delimiter ;

-- Trigger de aumento salarial de 20% no departamento 1
delimiter //
CREATE TRIGGER aumentar_salario AFTER INSERT ON employee
FOR EACH ROW
	BEGIN
  UPDATE employee SET Salary = 1.2 * Salary WHERE Dno = 1;
END;
//
delimiter ;