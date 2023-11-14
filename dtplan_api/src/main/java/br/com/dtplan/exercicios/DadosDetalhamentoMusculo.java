package br.com.dtplan.exercicios;

import br.com.dtplan.musculos.Musculo;

public record DadosDetalhamentoMusculo(Long id, String nome, String acao) {
	public DadosDetalhamentoMusculo(Musculo musculo) {
		this(musculo.getId(), musculo.getDescricao(), musculo.getAcao());
	}
}
