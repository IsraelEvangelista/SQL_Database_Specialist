# SQL Database Specialist


<picture> <img align="left" src="https://hermes.digitalinnovation.one/tracks/bc454148-6e72-4047-95cc-d516706ae405.png" width = 250px></picture>

Desenvolva suas habilidades com banco de dados, aprenda como modelar uma base de dados de acordo com necessidades de negócios, aprenda a trabalhar com comandos Data Manipulation Language (DML) e Data Definition Language (DDL) para consultar e manipular seus dados. Crie projetos de soluções baseadas nas boas práticas das regras formais e explore técnicas de Recuperação e Controle de Concorrência em Banco de dados.

________________________________________________________________________________________________________________________________________________________



# Projeto - Personalizando o Banco de Dados com Índices e Procedures


**Parte 1 – Criando índices em Banco de Dados**

Criação de índices para consultas para o cenário de company com as perguntas (queries sql) para recuperar recuperação de informações. Sendo assim, dentro do script será criado os índices com base na consulta SQL.  

    Perguntas:  
  
        - Qual o departamento com maior número de pessoas? 

        - Quais são os departamentos por cidade? 

        - Relação de empregrados por departamento 
 

    Entregável: 
  
        - Crie as queries para responder essas perguntas 

        - Crie o índice para cada tabela envolvida (de acordo com a necessidade) 

        - Tipo de indice utilizado e motivo da escolha (via comentário no script ou readme) 
 
 [Link para Entregável](https://github.com/IsraelEvangelista/SQL_Database_Specialist/blob/main/Procedure%20and%20Index/perguntas_e_indices.sql)
 Obs.: As queries foram criadas com base nas perguntas propostas, assim como os índices foram, afim de performar as consultas no banco.
 
 **Parte 2 - Utilização de procedures para manipulação de dados em Banco de Dados**

Objetivo:  

Criar uma procedure que possua as instruções de inserção, remoção e atualização de dados no banco de dados. As instruções devem estar dentro de esrtuturas condicionais (como CASE ou IF).  

Além das variáveis de recebimento das informações, a procedure deverá possuir uma variável de controle. Essa variável de controle irá determinar a ação a ser executada. Ex: opção 1 – select, 2 – update, 3 – delete. 

    Entregável: 

        - Script SQL com a procedure criada e chamada para manipular os dados de universidade e e-commerce. Podem ser criados dois arquivos distintos, assim como a utilização do mesmo script para criação das procedures. Fique atento para selecionar o banco de dados antes da criação da procedure.  
        
        
        
[Link para Entregável](https://github.com/IsraelEvangelista/SQL_Database_Specialist/blob/main/Procedure%20and%20Index/procedure.sql)
Obs.: Foram criadas _Procedures_ de cadastro e controle, afim de evitar-se redundância de clientes e controle nas datas de emissão de pedido e de conclusão respectivamente.

_________________________________________________________________________________________________________________________________________________

# Projeto - Personalizando Acessos e Automatizando ações no MySQL

**Parte 1 – Personalizando acessos com views** 

Neste desafio você irá criar visões para os seguintes cenários 

- Número de empregados por departamento e localidade 

![image](https://user-images.githubusercontent.com/116984176/210107140-83f78d41-5391-4ebf-90c9-c522a789c8c9.png)

- Lista de departamentos e seus gerentes 

![image](https://user-images.githubusercontent.com/116984176/210107239-0da02e96-4b87-4a3f-82b4-4da7ea82fa2e.png)

- Projetos com maior número de empregados (ex: por ordenação desc) 

![image](https://user-images.githubusercontent.com/116984176/210107255-f7694216-1934-44ef-905c-4a8dbe7f4cfc.png)

- Lista de projetos, departamentos e gerentes 

![image](https://user-images.githubusercontent.com/116984176/210107269-2e25115f-c555-4fe2-be0f-9cb7add319b0.png)

- Quais empregados possuem dependentes e se são gerentes 

![image](https://user-images.githubusercontent.com/116984176/210107282-ca7fe11c-74ea-4ba3-b7c8-743b6d49078e.png)
        
       
[Acesso às visões criadas](https://github.com/IsraelEvangelista/SQL_Database_Specialist/blob/main/Views%20and%20Triggers/view_company_ecommerce.sql)

_______________________________________________________________________________________________________________________________________________________

## Foram criadas restrições de acesso conforme proposto no desafio, utilizando as visões sugeridas.

Os BDs usados para as views e restrições foram "Company" e "E-Commerce".
[Link para Sintaxe de restrições](https://github.com/IsraelEvangelista/SQL_Database_Specialist/blob/main/Views%20and%20Triggers/Restri%C3%A7%C3%B5es%20de%20acesso_Company%20e%20Ecommerce.sql)

_______________________________________________________________________________________________________________________________________________________

**Parte 2 – Criando gatilhos para cenário de e-commerce** 

Objetivo: 

Sabemos que a criação de triggers está associadas a ações que podem ser tomadas em momento anterior ou posterior a inserção, ou atualização dos dados. Além disso, em casos de remoção podemos utilizar as triggers. Sendo assim, crie as seguintes triggers para o cenário de e-commerce. 

[Link para Triggers criados](https://github.com/IsraelEvangelista/SQL_Database_Specialist/blob/main/Views%20and%20Triggers/Trigger.sql)

_______________________________________________________________________________________________________________________________________________________

# Projeto - Criando Transações, Executando Backup e Recovery de Banco de Dados

**Parte 1 - Essa primeira transação pode ser executada sem utilizar outros recursos como procedures. Dessa forma, você irá executar statements de consultas e modificações de dados persistidos no banco de dados via transações.**

[Link para Parte 01](https://github.com/IsraelEvangelista/SQL_Database_Specialist/blob/main/Transa%C3%A7%C3%B5es/transaction_pt01.sql)

**PARTE 2 - TRANSAÇÃO COM PROCEDURE**

Você deverá criar outra transação, contudo, esta será definida dentro de uma procedure. Neste caso, assim como no exemplo em aula, deverá haver uma verificação de erro. Essa verificação irá acarretar um ROLLBACK, total ou parcial (SAVEPOINT). 

[Link para Parte 02](https://github.com/IsraelEvangelista/SQL_Database_Specialist/blob/main/Transa%C3%A7%C3%B5es/transaction_pt02.sql)

**PARTE 3 – BACKUP E RECOVERY**

Objetivo: 

Neste etapa do desafio, você irá executar o backup do banco de dados e-commerce. Realize o backup e recovery do banco de dados; 

        - Utilize o mysqdump para realizar o backup e recovery do banco de dados e-commerce; 

        - Realize o backup de diferentes bancos de dados e inseria os recursos como: procedures, eventos e outros. 

        - Adicione o arquivo de backup ao github juntamente com o script; 




## Backup de todos os databases: 
[Link para Download](https://github.com/IsraelEvangelista/SQL_Database_Specialist/blob/main/Transa%C3%A7%C3%B5es/all_databases_backup.sql)


## Backup dos bancos de dados selecionados:
[Link para visualização](https://github.com/IsraelEvangelista/SQL_Database_Specialist/blob/main/Transa%C3%A7%C3%B5es/all_selected_databases_backup.sql)


## Backup ecommerce DB:
[Link para Visualização](https://github.com/IsraelEvangelista/SQL_Database_Specialist/blob/main/Transa%C3%A7%C3%B5es/ecommerce_backup.sql)


## Backup ecommerce DB sem data:
[Link para Visualização](https://github.com/IsraelEvangelista/SQL_Database_Specialist/blob/main/Transa%C3%A7%C3%B5es/ecommerce_nodata_backup.sql)


## Backup ecommerce DB sem infra:
[Link para Visualização](https://github.com/IsraelEvangelista/SQL_Database_Specialist/blob/main/Transa%C3%A7%C3%B5es/ecommerce_noinfo_backup.sql)
    
    
## Recovery ecommerce DB:
Utilizando "Backup ecommerce DB" para Recovery
    
*_Sintaxe_* 
mysql --user root --password ecommerce < ecommerce_backup.sql
