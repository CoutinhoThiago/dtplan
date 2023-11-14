package br.com.dtplan.exercicios;

public record DadosListagemExercicio(String nome) {

	public DadosListagemExercicio(Exercicio exercicio) {
		this(exercicio.getDescricao());
	}

}