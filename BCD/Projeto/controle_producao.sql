-- Active: 1794483871965@@127.0.0.1@3308@projeto_producao
CREATE DATABASE if NOT EXISTS Projeto_Producao;
use Projeto_Producao;


CREATE TABLE if NOT EXISTS operadores (
    id_operador int AUTO_INCREMENT,
    nome  VARCHAR(60) not NULL,
    telefone VARCHAR(15),
    turno VARCHAR(50) not NULL,
    constraint pk_operadores PRIMARY KEY (id_operador)
);



CREATE Table if not exists maquina (
    id_maquina int AUTO_INCREMENT,
    status_maquina ENUM ("Ligado","Desligado"),
    modelo VARCHAR(180) not NULL,
    constraint pk_maquina PRIMARY KEY (id_maquina),
    id_operador INT not NULL,
    constraint fk_operador_maquina FOREIGN KEY (id_operador) REFERENCES operadores (id_operador)
);


CREATE Table if not exists 