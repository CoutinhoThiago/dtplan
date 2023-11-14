CREATE TABLE exercicio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    tipo INT NOT NULL,
    duracao_minutos INT,
    intensidade VARCHAR(50),
    musculo_alvo VARCHAR(100),
    series INT,
    repeticoes_min INT,
    repeticoes_max INT,
    carga DECIMAL(10, 2),
    CHECK (tipo IN (1, 2)),
    CHECK ((tipo = 1 AND musculo_alvo IS NOT NULL AND series IS NOT NULL AND repeticoes_min IS NOT NULL AND repeticoes_max IS NOT NULL AND carga IS NOT NULL) OR (tipo = 2 AND duracao_minutos IS NOT NULL AND intensidade IS NOT NULL))
);

CREATE TABLE musculo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    acao VARCHAR(100) NOT NULL,
    grupo_muscular VARCHAR(100) NOT NULL,
    descricao VARCHAR(255)
);
