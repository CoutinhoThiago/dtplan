package br.com.dtplan.domain.treino;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.dtplan.domain.musculo.Musculo;

public interface TreinoRepository extends JpaRepository<Treino, Long>{}
