package br.com.dtplan.domain.musculo;

import br.com.dtplan.domain.exercicio.DadosAtualizacaoExercicio;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Table(name = "musculos")
@Entity(name = "Musculo")
@Getter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id")
public class Musculo {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String descricao;
	private String acao;
	private boolean ativo;
	
	public Musculo(DadosCadastroMusculo dados) {
		this.ativo = true;
		descricao = dados.descricao();
		this.acao = dados.acao();
	}

	public void atualizarInformacoes(DadosAtualizacaoMusculo dados) {
        if (dados.descricao() != null) {
            this.descricao = dados.descricao();
        }
        if (dados.acao() != null) {
            this.acao = dados.acao();
        }
	}
	
	public void inativar() {
        this.ativo = false;
    }

}