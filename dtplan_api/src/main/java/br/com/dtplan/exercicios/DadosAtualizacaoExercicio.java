package br.com.dtplan.exercicios;

import jakarta.validation.constraints.NotNull;

public record DadosAtualizacaoExercicio(
		@NotNull
	    Long id,
	    String descricao
	) {


}


