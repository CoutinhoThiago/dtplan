package br.com.dtplan.musculos;

public record DadosListagemMusculo(String nome, String acao) {
	
	public DadosListagemMusculo(Musculo musculo) {
		this(musculo.getNome(), musculo.getAcao());
	}
	
}
