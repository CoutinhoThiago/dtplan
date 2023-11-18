package br.com.dtplan.domain.musculo;

import jakarta.validation.constraints.NotNull;

public record DadosAtualizacaoMusculo(
		@NotNull
		Long id,
		String descricao,
		String acao
	) {
}
