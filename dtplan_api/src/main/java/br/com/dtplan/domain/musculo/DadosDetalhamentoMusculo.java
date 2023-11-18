package br.com.dtplan.domain.musculo;

public record DadosDetalhamentoMusculo(Long id, String nome, String acao) {
	public DadosDetalhamentoMusculo(Musculo musculo) {
		this(musculo.getId(), musculo.getDescricao(), musculo.getAcao());
	}
}
