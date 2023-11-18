package br.com.dtplan.domain.musculo;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record DadosCadastroMusculo (
	@NotBlank
	String descricao,
	@NotNull
	String acao
	) {
}
