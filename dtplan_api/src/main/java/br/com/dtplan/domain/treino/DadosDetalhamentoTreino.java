package br.com.dtplan.domain.treino;

import java.util.List;
import java.util.stream.Collectors;

import br.com.dtplan.domain.exercicio.Exercicio;

public record DadosDetalhamentoTreino(
		long id,
		String descricao,
		String autor,
		String tipo,
		List<String> exercicios
) {

	public DadosDetalhamentoTreino(Treino treino, List<Exercicio> exercicios) {
		this(
				treino.getId(),
				treino.getDescricao(),
				treino.getAutor(),
				treino.getTipo(),
				exercicios.stream().map(Exercicio::getDescricao).collect(Collectors.toList())
		);
	}
}
