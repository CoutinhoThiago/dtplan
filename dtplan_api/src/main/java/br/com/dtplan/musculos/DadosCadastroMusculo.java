package br.com.dtplan.musculos;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record DadosCadastroMusculo (
	@NotBlank
	String descricao,
	@NotNull
	String acao
	) {
}
