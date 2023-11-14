package br.com.dtplan.exercicios;

import jakarta.validation.constraints.NotBlank;

public record DadosCadastroExercicio(
		@NotBlank
		String descricao
	) {
}
