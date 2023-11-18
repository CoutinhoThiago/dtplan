CREATE TABLE musculos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    acao VARCHAR(100) NOT NULL,
    grupo_muscular VARCHAR(100) NOT NULL
);

CREATE TABLE exercicios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    ativo BOOLEAN DEFAULT TRUE,
    tipo INT,
    musculo_alvo VARCHAR(100),
    series INT,
    repeticoes_min INT,
    repeticoes_max INT,
    carga DECIMAL(10, 2),
    duracao_minutos INT,
    intensidade VARCHAR(50)
);

CREATE TABLE treinos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    autor VARCHAR(255) NOT NULL,
    tipo VARCHAR(255) NOT NULL,
    descricao VARCHAR(255)
);
CREATE TABLE treino_exercicios (
    treino_id INT,
    exercicio_id INT,
    FOREIGN KEY (treino_id) REFERENCES treinos(id),
    FOREIGN KEY (exercicio_id) REFERENCES exercicios(id),
    PRIMARY KEY (treino_id, exercicio_id)
);
CREATE TABLE treino_musculos (
    treino_id INT,
    musculo_id INT,
    FOREIGN KEY (treino_id) REFERENCES treinos(id),
    FOREIGN KEY (musculo_id) REFERENCES musculos(id),
    PRIMARY KEY (treino_id, musculo_id)
);