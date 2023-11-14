package br.com.dtplan.controller;

import br.com.dtplan.musculos.Musculo;

public record DadosDetalhamentoMusculo(Long id, String nome, String acao) {
	public DadosDetalhamentoMusculo(Musculo musculo) {
		this(musculo.getId(), musculo.getNome(), musculo.getAcao());
	}
}
