package br.com.dtplan.controller;

import br.com.dtplan.exercicios.Exercicio;

public record DadosDetalhamentoExercicio(Long id, String nome) {
	public DadosDetalhamentoExercicio(Exercicio exercicio) {
		this(exercicio.getId(), exercicio.getDescricao());
	}
}
