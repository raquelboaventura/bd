create database db_escola;

show databases;

use db_escola;
drop table tb_professor;
create table tb_professor (
	cpf varchar(11),
	nome varchar(255),
    salario double(10,2),
    primary key(cpf)
);

insert into tb_professor(cpf,nome,salario) values
('12312324344','fulano da silva', 5645.45);

create table tb_turma(
	numero int auto_increment,
    sala varchar(64),
    horario varchar(64),
    primary key (numero)
);

insert into tb_turma (sala, horario) values ('T112', 'quarta 19:00 até 20:40');

select * from tb_turma;

create table tb_leciona(
	cpf_professor char(11),
    numero_turma int, 
    primary key(cpf_professor, numero_turma), 
    foreign key(cpf_professor) references tb_professor(cpf), 
    foreign key(numero_turma) references tb_turma(numero)
);

select * from tb_leciona;

select p.nome, p.horario
from tb_professor p, tb_turma t, tb_leciona l
where p.cpf = l.cpf_professor 
and t.numero = l.numero_turma;
