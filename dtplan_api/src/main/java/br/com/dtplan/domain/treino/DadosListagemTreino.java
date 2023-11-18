package br.com.dtplan.domain.treino;

import br.com.dtplan.domain.exercicio.DadosDetalhamentoExercicio;

import java.util.List;
import java.util.stream.Collectors;

public record DadosListagemTreino(
		long id,
		String descricao,
		String autor,
		String tipo,
		List<DadosDetalhamentoExercicio> exercicios) {

	public DadosListagemTreino(Treino treino) {
		this(
				treino.getId(),
				treino.getDescricao(),
				treino.getAutor(),
				treino.getTipo(),
				treino.getExercicios().stream()
						.map(DadosDetalhamentoExercicio::new)
						.collect(Collectors.toList())
		);
	}
}