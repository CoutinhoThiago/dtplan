CREATE TABLE exercicios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    ativo BOOLEAN DEFAULT TRUE,
    tipo INT,
    
    duracao_minutos INT,
    intensidade VARCHAR(50),
    
    musculo_alvo VARCHAR(100),
    series INT,
    repeticoes_min INT,
    repeticoes_max INT,
    carga DECIMAL(10, 2)
    
);

CREATE TABLE musculos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    acao VARCHAR(100) NOT NULL,
    grupo_muscular VARCHAR(100) NOT NULL
);
