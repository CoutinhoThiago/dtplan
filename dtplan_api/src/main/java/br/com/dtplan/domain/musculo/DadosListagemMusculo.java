package br.com.dtplan.domain.musculo;

public record DadosListagemMusculo(String nome, String acao) {
	
	public DadosListagemMusculo(Musculo musculo) {
		this(musculo.getDescricao(), musculo.getAcao());
	}
	
}
