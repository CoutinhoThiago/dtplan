package br.com.dtplan.exercicios;

public record DadosDetalhamentoExercicio(Long id, String descricao, boolean ativo, int tipo, String musculo_alvo, int series, int repeticoes_min, int repeticoes_max, double carga) {
	public DadosDetalhamentoExercicio(Exercicio exercicio) {
		this(
				exercicio.getId(), 
				exercicio.getDescricao(),
				exercicio.isAtivo(),
				exercicio.getTipo(),
				exercicio.getMusculo_alvo(),
				exercicio.getSeries(),
				exercicio.getRepeticoes_max(),
				exercicio.getRepeticoes_max(),
				exercicio.getCarga()
				);
	}
}
