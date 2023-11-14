package br.com.dtplan.musculos;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record DadosCadastroMusculo (
	@NotBlank
	String nome,
	@NotNull
	String acao
	) {
}
