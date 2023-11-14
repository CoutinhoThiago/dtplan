package br.com.dtplan.exercicios;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Table(name = "exercicios")
@Entity(name = "Exercicio")
@Getter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id")
public class Exercicio {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String descricao;
	private boolean ativo;
	private int tipo;
	
	private String musculo_alvo;
	private int series;
	private int repeticoes_min;
	private int repeticoes_max;
	private double carga;
	
	private int duracao_minutos;
	private int intensidade;
	
	public Exercicio(DadosCadastroExercicio dados) {
		this.ativo = true;
		this.descricao = dados.descricao();
	}
	
	public void atualizarInformacoes(DadosAtualizacaoExercicio dados) {
        if (dados.descricao() != null) {
            this.descricao = dados.descricao();
        }
	}
	
	public void inativar() {
        this.ativo = false;
    }

}
