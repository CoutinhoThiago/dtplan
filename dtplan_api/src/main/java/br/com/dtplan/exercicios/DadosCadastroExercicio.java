package br.com.dtplan.exercicios;

import jakarta.validation.constraints.NotBlank;

public record DadosCadastroExercicio(
		@NotBlank
		String descricao,
		@NotBlank
		boolean ativo,
		@NotBlank
	    int tipo,
	    
	    String musculo_alvo,
	    int series,
	    int repeticoes_min,
	    int repeticoes_max,
	    double carga,
	    
	    int duracao_minutos,
	    int intensidade
	) {
}
