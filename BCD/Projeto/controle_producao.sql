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

ALTER TABLE maquina
DROP FOREIGN KEY fk_operador_maquina;
ALTER TABLE maquina
DROP COLUMN id_operador;


CREATE Table if not exists produto (
    id_produto INT AUTO_INCREMENT,
    quantidade int not NULL,
    descricao  VARCHAR (120) not NULL,
    preco  DECIMAL(10,2) not NULL,
    constraint pk_produto PRIMARY KEY (id_produto)
);

ALTER TABLE produto
DROP COLUMN quantidade;

ALTER TABLE operadores
ADD CONSTRAINT chk_turno
CHECK (turno IN ('diurno', 'noturno'));

CREATE Table if NOT exists ordem_producao(
    id_ordem int AUTO_INCREMENT,
    prioridade ENUM ("Alta","Baixa"),
    data_inicio DATE NOT NULL,
    prazo  DATE not NULL,
    constraint pk_ordem PRIMARY KEY (id_ordem),
    id_operador int not NULL,
    constraint fk_operadores_ordem FOREIGN KEY (id_operador) REFERENCES operadores (id_operador),
    id_maquina int NOT NULL,
    constraint fk_maquina_ordem FOREIGN KEY (id_maquina) REFERENCES maquina (id_maquina)
);

CREATE TABLE IF NOT EXISTS item_producao (
    id_producao INT AUTO_INCREMENT,
    id_ordem INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    turno_producao VARCHAR(15) NOT NULL,
    status_producao VARCHAR(10) NOT NULL DEFAULT 'Ativa',

    CONSTRAINT pk_item_producao 
        PRIMARY KEY (id_producao),

    CONSTRAINT chk_quantidade 
        CHECK (quantidade > 0),

    CONSTRAINT chk_status_producao 
        CHECK (status_producao IN ('Ativa', 'Inativa')),

    CONSTRAINT fk_ordem_producao 
        FOREIGN KEY (id_ordem) 
        REFERENCES ordem_producao (id_ordem),

    CONSTRAINT fk_produto_producao 
        FOREIGN KEY (id_produto) 
        REFERENCES produto (id_produto)
);


