package br.com.dtplan.musculos;

import jakarta.validation.constraints.NotNull;

public record DadosAtualizacaoMusculo(
		@NotNull
		Long id,
		String descricao,
		String acao
	) {
}
