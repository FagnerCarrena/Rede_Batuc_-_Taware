CREATE DATABASE batuc_plataforma;
USE batuc_plataforma;


CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    tipo_usuario ENUM('comunidade', 'pesquisador', 'visitante', 'admin') NOT NULL
);


CREATE TABLE comunidades (
    id_comunidade INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    localizacao VARCHAR(255),
    contato VARCHAR(100),
    site VARCHAR(255),
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);


CREATE TABLE roteiros (
    id_roteiro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT,
    id_comunidade INT,
    duracao VARCHAR(50),
    preco DECIMAL(10,2),
    link_agendamento VARCHAR(255),
    FOREIGN KEY (id_comunidade) REFERENCES comunidades(id_comunidade)
);


CREATE TABLE eventos (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT,
    data_inicio DATETIME,
    data_fim DATETIME,
    id_comunidade INT,
    FOREIGN KEY (id_comunidade) REFERENCES comunidades(id_comunidade)
);


CREATE TABLE artigos (
    id_artigo INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    autor VARCHAR(100),
    resumo TEXT,
    link_publicacao VARCHAR(255),
    data_publicacao DATE
);


CREATE TABLE formacoes (
    id_formacao INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT,
    carga_horaria VARCHAR(50),
    link_inscricao VARCHAR(255)
);


CREATE TABLE midias (
    id_midia INT AUTO_INCREMENT PRIMARY KEY,
    tipo ENUM('imagem', 'video') NOT NULL,
    url VARCHAR(255) NOT NULL,
    id_referencia INT,
    tipo_referencia ENUM('comunidade', 'roteiro', 'evento') NOT NULL
);
